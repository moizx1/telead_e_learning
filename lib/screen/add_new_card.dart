import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

class AddNewCard extends StatelessWidget {
  const AddNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add New Card'),
      body: Center(
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 26),
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 18),
          height: 180,
          decoration: BoxDecoration(
            color: const Color(0xff0961F5),
            image: const DecorationImage(
                image: AssetImage('assets/images/atm_card_background.png'),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '1234  5678  8765  0876',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                    child: Text(
                      'Valid Thru',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    '12/28',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 8.5),
              Text(
                'Timmy C. Hernandez',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
