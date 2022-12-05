import 'package:flutter/material.dart';

/* CREATING OWN CUSTOM CONTAINER CLASS NAMED AS REUSABLE CARD CLASS */
class ReusableCard extends StatelessWidget {
  /* CONSTRUCTOR WITH REQUIRED KEYWORD IN cardColor */
  const ReusableCard(
      {super.key,
      required this.cardColor,
      required this.cardChild,
      required this.handlePress});

  /* INSTANCE VARIABLE = FIELD = PROPERTY ===> ALL MEANS THE SAME THING*/
  /* INSTANTIATING cardColor AS Color */
  final Color cardColor;
  final Widget cardChild;
  final Function handlePress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handlePress();
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor,
        ),
        child: cardChild,
      ),
    );
  }
}
