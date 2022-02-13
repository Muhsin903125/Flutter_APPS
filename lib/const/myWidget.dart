import 'package:flutter/material.dart';
import 'package:testapp3/const/myStyles.dart';

class MyWidget {
  static mainHeading(Head, viewall) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Head,
            style: MyStyles.MainHeadStyle,
          ),
          viewall != null
              ? Text(
                  viewall,
                  style: MyStyles.ViewAllStyle,
                )
              : Text(' ')
        ],
      ),
    );
  }

  static const buttonTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static const chartLabelsTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  static const tabTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
}
