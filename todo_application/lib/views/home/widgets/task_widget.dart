import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigate to task View to see tasks
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: const Offset(0, 4),
                blurRadius: 10,
              )
            ]),
        duration: const Duration(milliseconds: 600),
        child: ListTile(
          //Check Icon
          leading: GestureDetector(
            onTap: () {
              //check or uncheck the task
              print('clicked');
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: .8),
              ),
              child: const Icon(Icons.check, color: Colors.white),
            ),
          ),
          //Task Title
          title: const Padding(
            padding: EdgeInsets.only(top: 3, bottom: 5),
            child: Text(
              'Done',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                // decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          //Task Description
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Task Name
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  // decoration: TextDecoration.lineThrough,
                ),
              ),
              //Date of Task
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        'Sub Date',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
