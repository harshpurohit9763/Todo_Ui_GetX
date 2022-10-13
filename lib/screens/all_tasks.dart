import 'package:firstapp/utils/colors.dart';
import 'package:firstapp/widgets/button_widgets.dart';
import 'package:firstapp/widgets/task_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = ["Try Harder", "Try Smarter"];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    // ignore: non_constant_identifier_names
    final RightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 20.0, top: 60.0),
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img_3.jpg'),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.secondaryColor,
                ),
              )),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  // ignore: sort_child_properties_last
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: Colors.black),
                ),
                Expanded(
                  child: Container(),
                ),
                const Icon(Icons.calendar_month_sharp,
                    color: Colors.greenAccent),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "2",
                  style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: RightDeleteIcon,
                    onDismissed: (DismissDirection direction) {
                      // ignore: avoid_print
                      print("After Dismiss");
                    },
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                  height: 300,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(172, 118, 131, 131),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        ButtonWidget(
                                            backgroundcolor:
                                                AppColors.mainColor,
                                            text: "View",
                                            textColor: Colors.white),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ButtonWidget(
                                            backgroundcolor:
                                                AppColors.mainColor,
                                            text: "Edit",
                                            textColor: Colors.white),
                                      ],
                                    ),
                                  ));
                            });
                        return false;
                      } else {
                        return Future.delayed(const Duration(seconds: 1),
                            () => direction == DismissDirection.endToStart);
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: TaskWidget(
                        text: myData[index],
                        color: Colors.blueGrey,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
