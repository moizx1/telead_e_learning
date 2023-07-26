import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/controller/add_profile_info_controller.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/custom_text_field.dart';

class AddProfileInfo extends StatelessWidget {
  const AddProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProfileInfoController>(
        init: AddProfileInfoController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 28,
                ),
              ),
              title: const Text('Fill Your Profile'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    // fit: StackFit.expand,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffE8F1FF),
                          child: ClipOval(
                            child:
                                Image.asset("assets/images/dummyProfile.png"),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: -7.5,
                          right: -27.5,
                          child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: const Color(0xff167F71),
                            padding: const EdgeInsets.all(0.0),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 14,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  const CustomTextField(
                    hintText: 'Full Name',
                  ),
                  SizedBox(height: 2.h),
                  const CustomTextField(
                    hintText: 'NickName',
                  ),
                  SizedBox(height: 2.h),
                  CustomTextField(
                    controller: controller.dateInput,
                    hintText: 'Date of Birth',
                    prefixIcon: Icons.calendar_month_rounded,
                    isReadOnly: true,
                    onTap: () {
                      controller.selectDate(context);
                    },
                  ),
                  SizedBox(height: 2.h),
                  const CustomTextField(
                    hintText: 'Email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(height: 2.h),
                  IntlPhoneField(
                    flagsButtonPadding: const EdgeInsets.only(left: 10),
                    dropdownIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 28,
                    ),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    initialCountryCode: 'US',
                    onChanged: (phone) {},
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Center(
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                            // contentPadding: EdgeInsets.only(left: 7.5),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            suffixIcon: Icon(Icons.arrow_drop_down, size: 28)),
                        icon:
                            const Padding(padding: EdgeInsets.only(right: 7.5)),
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              padding: const EdgeInsets.only(left: 21),
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff505050),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
                        isExpanded: true,
                        hint: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 21.0),
                          child: Text(
                            'Genders',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff505050),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  const CustomButton(label: 'Continue'),
                  SizedBox(height: 2.h)
                ],
              ),
            ),
          );
        });
  }
}
