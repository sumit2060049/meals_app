import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

//this widget class should also accept some external data,
//that will be required to output the actual category information.
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final CAtegory category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    //Now we can return our widget combination for this
    //category grid item widget,that should display category title,
    //use its color,and also make sure that the item will be tappable,
    // so that later we can navigate to a different screen.
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ), //it is simply the widget that will be placed inside the container
      ),
    );
  }
}
