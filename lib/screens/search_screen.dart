// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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
          ],
        ),
      ),
    );
  }
}
