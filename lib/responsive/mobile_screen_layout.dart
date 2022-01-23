// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/mobile/mobile_footer.dart';
import 'package:google_clone/widgets/search.dart';
import 'package:google_clone/widgets/translation_button.dart';
import 'package:google_clone/widgets/web/search_buttons.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
        title: SizedBox(
          width: size.width * 0.3,
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              labelColor: blueColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: blueColor,
              tabs: [
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: 'Images',
                ),
              ],
            ),
          ),
        ),
        actions: [
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     'Gmail',
          //     style: TextStyle(
          //       color: primaryColor,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     'Images',
          //     style: TextStyle(
          //       color: primaryColor,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   width: 10,
          // ),
          IconButton(
              icon: SvgPicture.asset(
                'assets/images/more-apps.svg',
                color: primaryColor,
              ),
              onPressed: () {}),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10),
            child: MaterialButton(
              onPressed: () {},
              color: Color(0xff1A73EB),
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Search(),
                    SearchButtons(),
                    SizedBox(
                      height: 20,
                    ),
                    TranslationButtons(),
                  ],
                ),
                MobileFooter(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
