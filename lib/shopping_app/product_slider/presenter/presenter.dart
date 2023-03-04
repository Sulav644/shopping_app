import 'package:flutter/material.dart';
import '../widget_helpers/aligners.dart';

class SliderPresenter extends StatelessWidget {
  final List<Widget> children;
  const SliderPresenter({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Aligners().verticalSpace(28),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: children,
          ),
        ),
      ],
    );
  }
}
