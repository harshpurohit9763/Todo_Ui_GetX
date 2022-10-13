import 'package:firstapp/utils/colors.dart';
import 'package:firstapp/widgets/TextField.dart';
import 'package:firstapp/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameContoller = TextEditingController();
    TextEditingController detailContoller = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/img_3.jpg"))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 30),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.secondaryColor,
                      ))
                ],
              ),
              Column(
                children: [
                  TextFieldWidget(
                    textController: nameContoller,
                    hintText: "Task name",
                    borderRadius: 30,
                  ),
                  const SizedBox(height: 30),
                  TextFieldWidget(
                    textController: detailContoller,
                    hintText: "Task detail",
                    maxlines: 3,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const ButtonWidget(
                      backgroundcolor: AppColors.mainColor,
                      text: "Add",
                      textColor: Colors.white)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              )
            ]),
      ),
    );
  }
}
