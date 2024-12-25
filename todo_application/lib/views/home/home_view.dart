import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_application/extentions/space_extentions.dart';
import 'package:todo_application/utils/app_colors.dart';
import 'package:todo_application/utils/app_str.dart';
import 'package:todo_application/utils/constants.dart';
import 'package:todo_application/views/home/components/app_bar.dart';
import 'package:todo_application/views/home/components/fab.dart';
import 'package:todo_application/views/home/components/slider_drawer.dart';
import 'package:todo_application/views/home/widgets/task_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();
  final List<int> testing = [];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Fab(),
        //Body
        body: SliderDrawer(
            key: drawerKey,
            isDraggable: false,
            animationDuration: 1000,
            slider: CustomDrawer(),
            appBar: AppBarHome(
              drawerKey: drawerKey,
            ),
            child: _buildHomeBody(textTheme)));
  }

  //Home Body
  Widget _buildHomeBody(TextTheme textTheme) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          //Custom AppBar
          Container(
            // margin: EdgeInsets.only(top: 60),
            width: double.infinity,
            height: 100,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //progress Indicator
                SizedBox(
                  width: 30,
                  height: 30,
                  child: const CircularProgressIndicator(
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                  ),
                ),
                25.w,

                //Top level task Info
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStr.mainTitle,
                      style: textTheme.displayLarge,
                    ),
                    3.h,
                    Text(
                      '1 of 3 tasks',
                      style: textTheme.titleMedium,
                    ),
                  ],
                )
              ],
            ),
          ),
          //Divider
          const Padding(
            padding: EdgeInsets.only(top: 10.0, right: 5.0),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),
          //Tasks
          SizedBox(
            width: double.infinity,
            height: 585,
            child: testing.isNotEmpty
                //Task List is not empty
                ? ListView.builder(
                    itemCount: testing.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      //Dismissible use to remove items like a call add
                      return Dismissible(
                        direction: DismissDirection.horizontal,
                        onDismissed: (_) {
                          //remove task from db
                        },
                        //background when removing items
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete_outline,
                              color: Colors.grey,
                            ),
                            8.w,
                            const Text(
                              AppStr.deleteTask,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        key: Key(
                          index.toString(),
                        ),
                        child: const TaskWidget(),
                      );
                    },
                  )

                //All Tasks Done Animation. Empty task list
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Fade In animation Lotti
                      FadeInUp(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Lottie.asset(
                            lottieUrl,
                            animate: testing.isNotEmpty ? false : true,
                          ),
                        ),
                      ),
                      //Fade IN text
                      FadeInUp(
                        from: 30,
                        child: const Text(
                          AppStr.doneAllTasks,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
