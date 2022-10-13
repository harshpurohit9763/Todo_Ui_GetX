import 'package:firstapp/screens/addtask.dart';
import 'package:firstapp/screens/all_tasks.dart';
import 'package:firstapp/utils/colors.dart';
import 'package:firstapp/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 20.0, top: 100.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/img_1.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: const TextSpan(
                  text: 'hello',
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: '\nstart your beautiful day',
                        style: TextStyle(
                          color: AppColors.smallTextColor,
                          fontSize: 14,
                        ))
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 2),
            InkWell(
              onTap: () {
                Get.to(
                  () => const AddTask(),
                  transition: Transition.zoom,
                  duration: const Duration(microseconds: 500),
                );
              },
              child: const ButtonWidget(
                backgroundcolor: AppColors.mainColor,
                text: 'Add Task',
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(
                  () => const AllTasks(),
                  transition: Transition.fade,
                  duration: const Duration(seconds: 1),
                );
              },
              child: const ButtonWidget(
                backgroundcolor: Colors.white,
                text: 'View all',
                textColor: AppColors.smallTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
