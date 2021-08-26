import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!this._loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'] as String;
      this.categoryTitle = routeArgs['title'] as String;
      this.displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    this._loadedInitData = true;

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      this.displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: this.displayedMeals[index].id,
            title: this.displayedMeals[index].title,
            imageUrl: this.displayedMeals[index].imageUrl,
            duration: this.displayedMeals[index].duration,
            complexity: this.displayedMeals[index].complexity,
            affordability: this.displayedMeals[index].affordability,
            removeItem: this._removeMeal,
          );
        },
        itemCount: this.displayedMeals.length,
      ),
    );
  }
}
