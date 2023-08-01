import 'package:flutter/material.dart';

class CustomHorizontalList extends StatelessWidget {
  const CustomHorizontalList(
      {super.key,
      this.currentIndex,
      required this.onTap,
      this.titles = const [],
      this.index});
  final int? currentIndex, index;
  final List<String> titles;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      height: 40,
      child: ListView.builder(
        itemCount: titles.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          List items = titles;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              height: 30,
              // width: 58,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: index == currentIndex
                      ? const Color(0xff167F71)
                      : const Color(0xffE8F1FF),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 15),
              child: Text(
                items[index],
                style: TextStyle(
                  color: index == currentIndex
                      ? Colors.white
                      : const Color(0xff202244),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
