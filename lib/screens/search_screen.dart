// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchHeader(),
            Padding(
              padding: const EdgeInsets.only(left: 150.0),
              child: SearchTabs(),
            ),
            Divider(
              height: 0,
              thickness: 0.3,
            ),
            // pagination
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '< Prev',
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Next >',
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            SearchFooter(),
          ],
        ),
      ),
    );
  }
}
