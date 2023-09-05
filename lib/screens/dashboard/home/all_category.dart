import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_search_bar.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'All Categories'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          children: [
            const CustomSearchBar(
              hintText: 'Search for...',
              trailingIcon: Icons.search_rounded,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Get.toNamed('/coursesList'),
                    child: Card(
                      color: const Color(0xffE8F1FF),
                      child: Center(child: Text('$index')),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
