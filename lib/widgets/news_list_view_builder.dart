import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artilce.model.dart';
import 'package:news_app/services/news_service.dart';

import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // List<ArticleModel> articles = [];
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text('there are no articles'),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
    //   return isLoading
    //       ? const SliverToBoxAdapter(
    //           child: Center(child: CircularProgressIndicator()),
    //         )
    //       : articles.isNotEmpty
    //           ? NewsListView(
    //               articles: articles,
    //             )
    //           : const SliverToBoxAdapter(
    //               child: Text('there are no articles'),
    //             );
  }
}
