import 'package:flutter/material.dart';

import 'constants.dart';

/* CREATING A REUSABLE CLASS FOR CHILD IN ICONS CAONTAINER */
class ReusbaleIconsWidget extends StatelessWidget {
  const ReusbaleIconsWidget(
      {super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: kIconsSize, //Icon Size
            color: Colors.white, //Color Of Icon
          ),
          const SizedBox(
            height: kBoxHeight,
          ),
          Text(
            label.toUpperCase(),
            style: kLabelTextStyle,
          )
        ],
      ),
    );
  }
}
