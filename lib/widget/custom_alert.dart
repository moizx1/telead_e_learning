import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/Group46.png'),
          SizedBox(height: 3.h),
          const Text(
            'Congratulations',
            style: TextStyle(
                color: Color(0xff202244),
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 3.h),
          const Text(
            textAlign: TextAlign.center,
            'Your Account is Ready to Use. You will be redirected to the Home Page in a Few Seconds.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff545454),
            ),
          ),
          SizedBox(height: 3.h),
          const CircularProgressIndicator(
            strokeWidth: 7,
            color: Colors.black54,
          ),
          SizedBox(height: 3.h),
        ],
      ),
    );
  }
}
