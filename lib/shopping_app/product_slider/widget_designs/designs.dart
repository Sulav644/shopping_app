import 'package:flutter/material.dart';
import '../../../core/utils.dart';

class Designs {
  Widget sliderImageWithTitle(
          {required List<Widget> children,
          required BuildContext context,
          required int index,
          required int selectedCategory}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            SizedBox(
              width: getWidthRatio(context, 0.35),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: index == selectedCategory ? 16.0 : 24),
                    child: Container(
                      width: getWidthRatio(context, 0.25),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(255, 121, 120, 120),
                                blurRadius: 8,
                                offset: Offset(1, 4))
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: cWhite,
                      border: index == selectedCategory
                          ? Border.all(
                              color: const Color.fromARGB(255, 219, 28, 14))
                          : null,
                    ),
                    child: SizedBox(
                      width: getWidthRatio(context, 0.35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: children,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
