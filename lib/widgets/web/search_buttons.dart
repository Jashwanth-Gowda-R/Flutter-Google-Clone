// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(
                  4,
                ),
              )),
              color: searchColor,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 18,
              ),
              onPressed: () {},
              child: Text('Google Search'),
            ),
            SizedBox(
              width: 10,
            ),
            MaterialButton(
              elevation: 0,
              color: searchColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(
                  4,
                ),
              )),
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 18,
              ),
              onPressed: () {},
              child: Text("I'm feeling Lucky"),
            ),
          ],
        )
      ],
    );
  }
}
