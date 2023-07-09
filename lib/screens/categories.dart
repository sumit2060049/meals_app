import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite,required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

//Here , we're doing something  we haven't really done before.we are adding a method to a stateless widget.
//we haven't done it before because in most cases, when we added a method to a widget, so when we reacted
//to a button tap or something,we wanted to update some state.And of course we can't do that in a stateless widget.
//but here we want to load a differetn screen .
  void _selectCategory(BuildContext context, CAtegory category) {
    //Now we want to navigate to a different screen and this can be done using push method.
    //Navigator.push(context, route);or
    final filteredMeals = availableMeals //dummyMeals(initially)
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: const Text('P ick your category'),
        //   ),
        //   body:
        GridView(
            padding: EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ), //setting the number of columns

            children: [
          //here we wanna use the category_grid_item widget which we created.
          //Using for loop is an alternative
          //availableCategories.map((category)=>CategoryGridItem(category:category)).toList();
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ]);
  }
}
