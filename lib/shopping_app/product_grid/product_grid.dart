import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/shopping_app/home_page.dart';
import '../../core/utils.dart';
import '../product_detail/product_detail_page.dart';

class ProductGridPage extends StatelessWidget {
  final String title;
  final List<String> imgUrl;
  final int indexOfSet;
  const ProductGridPage(
      {super.key,
      required this.title,
      required this.imgUrl,
      required this.indexOfSet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: indexOfSet == 0 ? 6.0 : 0, bottom: 6.0),
      child: Container(
        width: getWidth(context),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
              Wrap(
                children: [
                  ...List.generate(
                      imgUrl.length,
                      (index) => Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 || index == 2 ? 0.0 : 14.0,
                                top: 8.0,
                                right: index == 1 || index == 3 ? 0.0 : 14.0,
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
                                width: 150,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )).toList()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
