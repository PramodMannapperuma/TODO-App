import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_application/extentions/space_extentions.dart';
import 'package:todo_application/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  //icons
  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

  //texts
  final List<String> texts = [
    "Home",
    'Profile',
    'Settings',
    'Details',
  ];
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          //User Img
          CircleAvatar(
            radius: 50,
            child: SizedBox(
              child: Lottie.asset(
                  'assets/lottie/AnimationUser - 1735151727695.json'),
            ),
          ),
          8.h,
          //user Name
          Text(
            'Pramod Mannapperuma',
            style: textTheme.displayMedium,
          ),
          //user position
          Text(
            'Flutter Dev',
            style: textTheme.displaySmall,
          ),
          //Drawer Items
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                //drawer item
                return InkWell(
                  onTap: () {
                    log("${texts[index]} item tapped");
                  },
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    child: ListTile(
                      leading: Icon(
                        icons[index],
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        texts[index],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
