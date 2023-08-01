import 'package:flutter/material.dart';

import '../widget/custom_app_bar.dart';
import '../widget/custom_search_bar.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'All Categories'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          children: [
            CustomSearchBar(
              hintText: 'Search for...',
              trailingIcon: Icons.search_rounded,
            ),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.only(top: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Color(0xffE8F1FF),
                      child: Center(child: Text('$index')),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
