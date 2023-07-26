import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
            backgroundColor: Color(0xffF5F9FF),
            body: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/Profile Image.png"),
                    ),
                    Positioned(
                        bottom: 0,
                        right: -25,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: Color(0xFFF5F6F9),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blue,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        )),
                  ],
                ),
              ),
              //  CustomTextField(
              //   controller: controller.dateInput,
              //   hintText: 'Date of Birth',
              //   prefixIcon: Icons.calendar_month_rounded,
              //   isReadOnly: true,
              //   onTap: () {
              //     controller.selectDate(context);
              //   },
              // ),
              // IntlPhoneField(
              //   flagsButtonPadding: const EdgeInsets.only(left: 10),
              //   dropdownIcon: const Icon(
              //     Icons.keyboard_arrow_down_rounded,
              //     size: 28,
              //   ),
              //   dropdownIconPosition: IconPosition.trailing,
              //   decoration: InputDecoration(
              //     fillColor: Colors.white,
              //     filled: true,
              //     labelText: 'Phone Number',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12.0),
              //       borderSide: BorderSide.none,
              //     ),
              //   ),
              //   initialCountryCode: 'IN',
              //   onChanged: (phone) {},
              // ),
            ),
          );
        });
  }
}
