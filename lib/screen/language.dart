import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/Language_controller.dart';
import 'package:telead_e_learning/dummy_data.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';
import 'package:telead_e_learning/widget/language_radio_tile.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Language'),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'All Languages',
                    style: TextStyle(
                      color: Color(0xff202244),
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.only(left: 18, top: 10),
                    itemCount: controller.list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return LanguageRadioTile(
                        isChecked: controller.list[index]['isChecked'] as bool,
                        language: controller.list[index]['language'].toString(),
                        onChanged: (value) {
                          controller.onChange(value, index);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
