import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({super.key, required this.drawerKey});
  final GlobalKey<SliderDrawerState> drawerKey;

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome>
    with SingleTickerProviderStateMixin {
  late AnimationController animateController;
  bool isDrawerOpen = false;

  @override
  void initState() {
    animateController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    animateController.dispose();
    super.dispose();
  }

//onToggle
  void onDrawerToggle() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen) {
        animateController.forward();
        widget.drawerKey.currentState!.openSlider();
      } else {
        animateController.reverse();
        widget.drawerKey.currentState!.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Menu Icon
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                onPressed: onDrawerToggle,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: animateController,
                  size: 30,
                ),
              ),
            ),
            //Trash Icon
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {
                  //TODO: Remove all tasks from db
                },
                icon: const Icon(
                  CupertinoIcons.trash_fill,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
