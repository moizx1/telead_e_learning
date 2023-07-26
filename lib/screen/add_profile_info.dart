import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/add_profile_info_controller.dart';
import 'package:telead_e_learning/widget/custom_text_field.dart';

class AddProfileInfo extends StatelessWidget {
  const AddProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProfileInfoController>(
        init: AddProfileInfoController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              // child: Container(
              //   height: 60,
              //   decoration: BoxDecoration(
              //     color: const Color(0xffFFFFFF),
              //     borderRadius: BorderRadius.circular(12.0),
              //   ),
              //   child: TextField(
              //       controller: controller.dateInput,
              //       decoration: const InputDecoration(
              //           icon: Icon(
              //               Icons.calendar_month_rounded), //icon of text field
              //           labelText: "Date of Birth" //label text of field
              //           ),
              //       readOnly:
              //           true, //set it true, so that user will not able to edit text
              //       onTap: () {
              //         controller.selectDate(context);
              //       }),
              // ),

              child: CustomTextField(
                  controller: controller.dateInput,
                  hintText: 'Date of Birth',
                  prefixIcon: Icons.calendar_month_rounded,
                  isReadOnly: true,
                  onTap: () {
                    controller.selectDate(context);
                  }),
            ),
          );
        });
  }
}
