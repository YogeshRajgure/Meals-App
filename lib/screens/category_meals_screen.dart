import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_3_meals_app/models/meal.dart';
import 'package:flutter_project_3_meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInintData = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_loadedInintData == false) {
      // so this code will only run for first time
      super.didChangeDependencies();
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final CategoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((element) {
        return element.categories.contains(CategoryId);
      }).toList();
      _loadedInintData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
