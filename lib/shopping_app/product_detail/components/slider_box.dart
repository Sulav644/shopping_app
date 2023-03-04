import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../home_page.dart';

class SliderBox extends StatelessWidget {
  final String selectedSize;
  const SliderBox({super.key, required this.selectedSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...[
              "6.5",
              "7",
              "7.5",
              "8",
              "8 Wide",
              "8.5",
              "9",
              "9.5",
              "10",
              "10.5",
              "11"
            ].map((e) => Padding(
                  padding: EdgeInsets.only(
                    left: e.contains('6.5') ? 0 : 4.0,
                    right: 4,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.read<SelectSizeCubit>().selectSize(e);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color:
                                e == selectedSize ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            e,
                            style: style(
                                color: e == selectedSize
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
