// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/footer_text.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FooterText(title: 'About'),
              SizedBox(width: 10),
              FooterText(title: 'Advertising'),
              SizedBox(width: 10),
              FooterText(title: 'Business'),
              SizedBox(width: 10),
              FooterText(title: 'How Search Works'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FooterText(title: 'Privacy'),
              SizedBox(width: 10),
              FooterText(title: 'Terms'),
              SizedBox(width: 10),
              FooterText(title: 'Settings'),
            ],
          ),
        ],
      ),
    );
  }
}
