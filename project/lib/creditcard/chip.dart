import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter/material.dart';

class ChipPage extends StatefulWidget {
  const ChipPage({Key? key}) : super(key: key);

  @override
  State<ChipPage> createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Debit Card',
                style: TextStyle(
                  fontSize: 22,
                  color: HexColor('D5D5E0'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '\$2,000.0',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: HexColor('D5D5E0'),
                ),
              ),
            ],
          ),
          Transform.rotate(
              angle: -69,
              child: Image.asset(
                'images/Chip.png',
                height: 56,
                width: 31,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '**** 7341',
                style: TextStyle(
                  fontSize: 15,
                  color: HexColor('D5D5E0'),
                ),
              ),
              Transform.rotate(
                  angle: -6.4,
                  child: Image.asset(
                    'images/visa.png',
                    height: 14,
                    width: 47,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
