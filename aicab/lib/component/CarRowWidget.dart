import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CarRowWidget extends StatelessWidget {
  final String? img;
  final String? name;
  final int? year;
  final double? price;

  const CarRowWidget({super.key, this.img, this.name, this.year, this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width() - 32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.topRight,
                  
                ),
                const SizedBox(height: 16),
                Image.asset(img!, height: 100, width: 150, fit: BoxFit.fitHeight),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(price!.toString(), style: secondaryTextStyle(size: 12)),
          const SizedBox(height: 4),
          SizedBox(
            width: context.width() - 32,
            child: Text(name!, maxLines: 2, style: boldTextStyle(size: 14)),
          ),
          //const SizedBox(height: 4),
          //Text(includedAlcohols!.join(', '), style: secondaryTextStyle(size: 12)),
          //Text(category!, style: secondaryTextStyle(size: 12)),
        ],
      ),
    );
  }
}
