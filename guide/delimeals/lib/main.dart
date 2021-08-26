import 'package:flutter/material.dart';
import './models/meal.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final String title = 'DeliMeals';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      this._filters = filterData;

      this._availableMeals = DUMMY_MEALS.where((meal) {
        if (this._filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (this._filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (this._filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (this._filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        this._favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() => this._favoriteMeals.removeAt(existingIndex));
    } else {
      setState(() => this
          ._favoriteMeals
          .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)));
    }
  }

  bool _isMealFavorite(String id) {
    return this._favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: MyHomePage(title: this.title),
      // home: CategoriesScreen(title: this.title),
      initialRoute: TabsScreen.routeName,
      routes: {
        TabsScreen.routeName: (_) => TabsScreen(this._favoriteMeals),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(this._availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(this._toggleFavorite, this._isMealFavorite),
        FiltersScreen.routeName: (_) =>
            FiltersScreen(this._filters, this._setFilters),
      },
      // // no route matching above
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (_) => CategoriesScreen());
      // },
      // // 404
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => CategoriesScreen());
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
