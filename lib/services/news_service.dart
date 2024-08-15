import 'package:dio/dio.dart';
import 'package:news_app/models/artilce.model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews() async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/everything?q=general&apiKey=91ddc08948ed4c3cbd5030bb27cf985f');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      // Create a new article object from the articles model
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subtitle: article['description'],
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
