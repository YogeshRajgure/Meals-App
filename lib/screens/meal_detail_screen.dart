import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(children: <Widget>[
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            selectedMeal.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container()
      ]),
    );
  }
}
