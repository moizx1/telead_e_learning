import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';

class CustomAlert extends StatelessWidget {
  final Widget _child;

  CustomAlert({
    Key? key,
    final double? radius,
  })  : _child = Container(),
        super(key: key);

  const CustomAlert.accountReady({
    Key? key,
    final double? radius,
    final Color? color,
  })  : _child = const _AccountReady(),
        super(key: key);

  const CustomAlert.paymentSuccessfull({
    Key? key,
    final double? radius,
    final Color? color,
  })  : _child = const _PaymentSuccessfull(),
        super(key: key);
  const CustomAlert.courseCompleted({
    Key? key,
    final double? radius,
    final Color? color,
  })  : _child = const _CourseCompleted(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}

class _AccountReady extends StatelessWidget {
  const _AccountReady();

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

class _PaymentSuccessfull extends StatelessWidget {
  const _PaymentSuccessfull();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/security_alert.png'),
          SizedBox(height: 3.h),
          const Text(
            'Course Completed',
            style: TextStyle(
                color: Color(0xff202244),
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 3.h),
          const Text(
            textAlign: TextAlign.center,
            'Complete your Course. Please Write a Review',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff545454),
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
              Icon(Icons.star, color: Color(0xffFF9C07), size: 22),
            ],
          ),
          SizedBox(height: 3.h),
          CustomButton(label: 'Write Review'),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}

class _CourseCompleted extends StatelessWidget {
  const _CourseCompleted();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/course_completed_alert.png'),
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
            'Your Payment is Successfully. Purchase a New Course',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff545454),
            ),
          ),
          SizedBox(height: 2.h),
          const Text(
            textAlign: TextAlign.center,
            'Watch the Course',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff167F71),
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 3.h),
          CustomButton(label: 'E-Receipt'),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
