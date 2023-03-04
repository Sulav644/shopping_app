import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/shopping_app/home_page.dart';
import 'package:shopping_app/shopping_app/product_slider/widget_designs/designs.dart';
import '../widget_helpers/components.dart';

class ProductImageAndLabelBody extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int index;
  const ProductImageAndLabelBody(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<SelectCategoryCubit>().state;
    return GestureDetector(
      onTap: () {
        context.read<ScrollToIndexCubit>().scrollToItem(index);
        context.read<SelectCategoryCubit>().selectCategory(index);
      },
      child: Designs().sliderImageWithTitle(
          context: context,
          index: index,
          selectedCategory: selectedCategory,
          children: [
            Container(
                color: selectedCategory == index
                    ? const Color.fromARGB(255, 219, 28, 14)
                    : Colors.red,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: index == selectedCategory ? 12.0 : 8.0),
                  child: Components().box(title: title),
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: index == selectedCategory ? 12.0 : 8.0),
              child: Components().urlImage(imgUrl: imgUrl),
            ),
          ]),
    );
  }
}
