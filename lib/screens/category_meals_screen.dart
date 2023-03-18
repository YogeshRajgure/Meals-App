import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_3_meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(
  //   this.categoryId,
  //   this.categoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final CategoryId = routeArgs['id'];
    final CategoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(CategoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: CategoryMeals[index].id,
            title: CategoryMeals[index].title,
            imageUrl: CategoryMeals[index].imageUrl,
            duration: CategoryMeals[index].duration,
            complexity: CategoryMeals[index].complexity,
            affordability: CategoryMeals[index].affordability,
          );
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
