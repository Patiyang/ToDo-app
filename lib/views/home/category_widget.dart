import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Styling/global_styling.dart';
import 'package:todo_app/models/category.dart';

import '../../appstate.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCatId == category.id;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCatId(category.id);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: isSelected ? Colors.white : Colors.transparent,
          border: Border.all(
              color: isSelected ? Colors.white : Colors.white24, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              category.icon,
              color: isSelected
                  ? redColor
                  : Theme.of(context).scaffoldBackgroundColor,
              size: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              category.name,
              style: isSelected ? selectedCategoryText : categoryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
