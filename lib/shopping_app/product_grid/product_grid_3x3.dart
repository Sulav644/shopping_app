import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/data.dart';

import '../../core/utils.dart';
import '../home_page.dart';
import '../product_detail/product_detail_page.dart';
import '../product_slider/domain/product_data.dart';

class ProductGridPage3x3 extends StatelessWidget {
  final String title;
  final List<String> imgUrl;
  final int indexOfSet;
  const ProductGridPage3x3(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.indexOfSet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Container(
        width: getWidth(context),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Container(
            child: Column(
              children: [
                verticalSpacer(15),
                Row(
                  children: [
                    Text(
                      title,
                      style: style(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                verticalSpacer(15),
                Container(
                  child: Wrap(
                    children: [
                      ...List.generate(
                          imgUrl.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0 || index == 3 || index == 6
                                        ? 0.0
                                        : 14.0,
                                    top: 8.0,
                                    right:
                                        index == 2 || index == 5 || index == 8
                                            ? 0.0
                                            : 14.0,
                                    bottom: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<SelectCategoryCubit>()
                                        .selectCategory(indexOfSet);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ProductDetailViewer(
                                          index: index, imgUrl: imgUrl[index]);
                                    }));
                                  },
                                  child: Image.network(
                                    imgUrl[index],
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )).toList()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
