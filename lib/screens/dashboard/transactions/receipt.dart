import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/receipt_text_widget.dart';
import '../../../controllers/dashboard/transactions/receipt_controller.dart';
import '../../../widgets/custom_app_bar.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiptController>(
      init: ReceiptController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'E-Receipt',
            trailing: PopupMenuButton(
              surfaceTintColor: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onOpened: controller.onMenuOpen,
              onCanceled: controller.onMenuClose,
              offset: Offset(-10, Get.statusBarHeight - 45),
              icon: controller.isMenuOpened == false
                  ? Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffB4BDC4),
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                        color: const Color(0xffE8F1FF),
                      ),
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                        size: 20,
                      ),
                    )
                  : Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffA0A4AB), width: 3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Color(0xffA0A4AB),
                        size: 20,
                      ),
                    ),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  const PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Share',
                          style: TextStyle(
                            color: Color(0xff545454),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.send_outlined,
                          color: Colors.black,
                          size: 22,
                        )
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Download',
                          style: TextStyle(
                            color: Color(0xff545454),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.download,
                          color: Colors.black,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Print',
                          style: TextStyle(
                            color: Color(0xff545454),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.local_print_shop_outlined,
                          color: Colors.black,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Image.asset('assets/images/Receipt.png'),
                const SizedBox(height: 20),
                Image.asset('assets/images/BARCODE.png'),
                const SizedBox(height: 25),
                ReceiptTextWidget(title: 'Name', value: 'Scott R. Shoemake'),
                const SizedBox(height: 15),
                ReceiptTextWidget(
                    title: 'Email ID', value: 'shoemake.redial@gmail.com'),
                const SizedBox(height: 15),
                ReceiptTextWidget(
                    title: 'Course', value: '3d Character Illustration Cre..'),
                const SizedBox(height: 15),
                ReceiptTextWidget(title: 'Category', value: 'Web Development'),
                const SizedBox(height: 15),
                ReceiptTextWidget(
                  title: 'TransactionID',
                  value: 'SK345680976',
                  trailing: Icon(Icons.file_copy_sharp, size: 16),
                ),
                const SizedBox(height: 15),
                ReceiptTextWidget(title: 'Price', value: '\$55.00'),
                const SizedBox(height: 15),
                ReceiptTextWidget(
                    title: 'Date', value: 'Nov 20, 202X   /   15:45'),
                const SizedBox(height: 15),
                ReceiptTextWidget(
                  title: 'Status',
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 2.5),
                    color: const Color(0xff167F71),
                    child: Text(
                      'Paid',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
