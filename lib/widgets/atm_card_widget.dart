import 'package:flutter/material.dart';

class AtmCardWidget extends StatelessWidget {
  const AtmCardWidget({super.key, this.cardNumber, this.expiryMonth, this.name, this.expiryYear});
  final int? expiryMonth,expiryYear;
  final String? name,cardNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            cardNumber ?? '' ,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const SizedBox(
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
                '$expiryMonth/$expiryYear',
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8.5),
          Text(
            name??'',
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
