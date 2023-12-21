import 'package:flutter/cupertino.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:live_soccer/Services/Models/NewsModel.dart';

class NewsProvider extends ChangeNotifier {
  late final List<NewsModel> _newsList = [];
   String _itemContent = '';

  List<NewsModel> get getNewsList {
    return _newsList;
  }

  String get getContent {
    return _itemContent;
  }
  void emptyContent() {
    _itemContent = '';
    notifyListeners();
  }
  bool isStringNumber(String value) {
    // Use a regular expression to check if the string is a number
    final numberRegExp = RegExp(r'^\d+$');
    return numberRegExp.hasMatch(value);
  }
  Future<void> getNews() async {
    //print('Featured News');
    _newsList.clear();

    try {
      const url = 'https://tribuna.com/en/news/page1/';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseBody = response.body;
        final html = dom.Document.html(responseBody);
        final webNewsList = html.querySelector('.news-list__news-wrapper')!.children;

        for (int i = 0; i < webNewsList.length; i++) {
          final newsItem = webNewsList[i].getElementsByClassName('simple-news');
            if (!isStringNumber(newsItem[0].getElementsByClassName('uiKit-text ')[1].text.trim())) {
              _newsList.add(NewsModel(
                title: newsItem[0].getElementsByClassName('uiKit-text ')[1].text,
                imageUrl: newsItem[0].getElementsByClassName('image__main-class')[0].attributes['src'] ?? '',
                contentUrl: newsItem[0].children[0].attributes['href'] ?? '',
              ));
            }

        }
      } else {
        //print('Request failed with status: ${response.statusCode}');
      }

      notifyListeners();
    } catch (e, stackTrace) {
      //print('Error fetching news: $e\nStack Trace: $stackTrace');
    }
  }

  Future<void> getNewsContent({required itemUrl}) async {
    final List<String> contentList = [];
    itemUrl = "https://tribuna.com$itemUrl";

    try {
      final response = await http.get(Uri.parse(itemUrl));
      if (response.statusCode == 200) {
        final responseBody = response.body;
        final html = dom.Document.html(responseBody);
        final webNewsList = html.querySelector('.Article_article__article__kV9RV')!.children;

        webNewsList.getRange(0, webNewsList.length - 2).forEach((element) {
          contentList.add(element.text);
        });
        _itemContent = contentList.join(' ');
      } else {
        //print('Request failed with status: ${response.statusCode}');
      }

      notifyListeners();
    } catch (e, stackTrace) {
      //print('Error fetching news content: $e\nStack Trace: $stackTrace');
    }
  }
}
