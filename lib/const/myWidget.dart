import 'package:flutter/material.dart';
import 'package:testapp3/const/myStyles.dart';
import 'package:testapp3/const/mycolors.dart';

class MyWidget {
  static mainHeading(Head, viewall) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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

  static carddMovie(Moviename, imagepath, rating, releaseyear) {
    return Card(
      elevation: 8,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      child: Container(
        height: 210,
        width: 170,
        decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(imagepath),
              fit: BoxFit.cover,
              height: 170,
              width: 170,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Moviename,
                    style: MyStyles.cardMovieName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        releaseyear,
                        style: MyStyles.cardReleaseDate,
                      ),
                      rating != null
                          ? Row(
                              children: [
                                Image(
                                  image: AssetImage("assets/images/imdb.png"),
                                  fit: BoxFit.cover,
                                  height: 17,
                                  width: 22,
                                ),
                                Text("($rating)",
                                    style: TextStyle(fontSize: 10))
                              ],
                            )
                          : Text(" "),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
