import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.avif', categoryName: 'Business'),
    CategoryModel(
        image: 'assets/entertaiment.avif', categoryName: 'Entertaiment'),
    CategoryModel(image: 'health.avif', categoryName: 'Health'),
    CategoryModel(image: 'science.avif', categoryName: 'Science'),
    CategoryModel(image: 'technology.jpeg', categoryName: 'Technology'),
    CategoryModel(image: 'sports.avif', categoryName: 'Sports'),
    CategoryModel(image: 'general.avif', categoryName: 'General'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}
