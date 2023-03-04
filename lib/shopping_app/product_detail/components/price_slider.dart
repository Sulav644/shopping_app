import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import 'slider_box.dart';

class PriceSlider extends StatelessWidget {
  final String selectedSize;
  const PriceSlider({super.key, required this.selectedSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              verticalSpacer(10),
              defaultTextStyle(
                color: Colors.black,
                child: productSize(),
              ),
              verticalSpacer(22),
              SliderBox(selectedSize: selectedSize),
              verticalSpacer(16),
              defaultTextStyle(
                fontSize: 20,
                child: priceCalculator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row priceCalculator() => Row(
        children: [
          selectedSize == ""
              ? const Text('\$55\u2070\u2070-\$75\u2070\u2076')
              : (() {
                  if (selectedSize.split(" ").length == 2 &&
                      selectedSize.split(" ")[1].contains('Wide')) {
                    return Row(
                      children: [
                        const Text('Price: '),
                        Text(
                          '\$${(double.parse(selectedSize.split(" ")[0]) * 9.5).toStringAsFixed(2)}',
                          style: style(color: Colors.red, fontSize: 24),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        const Text('Price: '),
                        Text(
                          '\$${(double.parse(selectedSize.split(" ")[0]) * 9).toStringAsFixed(2)}',
                          style: style(color: Colors.red, fontSize: 24),
                        ),
                      ],
                    );
                  }
                }()),
        ],
      );
  Row productSize() => Row(
        children: [
          Text(
            'Size:',
            style: style(color: const Color.fromARGB(255, 58, 58, 58)),
          ),
          Text(
            selectedSize == "" ? 'Select size to see price' : selectedSize,
            style: style(fontWeight: FontWeight.bold),
          )
        ],
      );
}
