import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping_app/core/utils.dart';
import 'package:shopping_app/shopping_app/product_slider/domain/product_data.dart';

import '../home_page.dart';

class ProductDetailViewer extends StatelessWidget {
  final String imgUrl;
  final int index;
  const ProductDetailViewer(
      {super.key, required this.imgUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectSizeCubit(),
      child: ProductDetailPage(
        imgUrl: imgUrl,
        index: index,
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String imgUrl;
  final int index;
  const ProductDetailPage(
      {super.key, required this.imgUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    final selectedSize = context.watch<SelectSizeCubit>().state;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 195, 195),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              color: Color.fromARGB(255, 1, 20, 36),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.white,
                    ),
                    Text(
                      'Deliver today',
                      style: style(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: getWidth(context),
              height: getHeightRatio(context, 0.4),
              color: Colors.white,
              child: Image.network(
                imgUrl,
                fit: BoxFit.contain,
              ),
            ),
            if (index.isEven)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        verticalSpacer(10),
                        defaultTextStyle(
                          color: Colors.black,
                          child: Row(
                            children: [
                              Text(
                                'Size:',
                                style: style(
                                    color: Color.fromARGB(255, 58, 58, 58)),
                              ),
                              Text(
                                selectedSize == ""
                                    ? 'Select size to see price'
                                    : selectedSize,
                                style: style(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        verticalSpacer(22),
                        Container(
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
                                          context
                                              .read<SelectSizeCubit>()
                                              .selectSize(e);
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: e == selectedSize
                                                    ? Colors.black
                                                    : Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
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
                        ),
                        verticalSpacer(16),
                        defaultTextStyle(
                          fontSize: 20,
                          child: Row(
                            children: [
                              selectedSize == ""
                                  ? Text('\$55\u2070\u2070-\$75\u2070\u2076')
                                  : (() {
                                      if (selectedSize.split(" ").length == 2 &&
                                          selectedSize
                                              .split(" ")[1]
                                              .contains('Wide')) {
                                        return Row(
                                          children: [
                                            Text('Price: '),
                                            Text(
                                              '\$${(double.parse(selectedSize.split(" ")[0]) * 9.5).toStringAsFixed(2)}',
                                              style: style(
                                                  color: Colors.red,
                                                  fontSize: 24),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Row(
                                          children: [
                                            Text('Price: '),
                                            Text(
                                              '\$${(double.parse(selectedSize.split(" ")[0]) * 9).toStringAsFixed(2)}',
                                              style: style(
                                                  color: Colors.red,
                                                  fontSize: 24),
                                            ),
                                          ],
                                        );
                                      }
                                    }()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (index.isOdd)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Currently unavailable',
                          style: style(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        verticalSpacer(10),
                        Text(
                          "We don't know when or if this item will be back in stock",
                          style: style(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultTextStyle(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, left: 8.0, right: 8.0, bottom: 28.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Edition: Original 1.0',
                                  style: style(),
                                ),
                              ],
                            ),
                            verticalSpacer(10),
                            Container(
                              width: getWidth(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getWidthRatio(context, 0.4),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.red),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 238, 237, 237),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    topRight:
                                                        Radius.circular(4))),
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Original 1.0',
                                                style: style(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                        Container(
                                            width: getWidth(context),
                                            child: Divider(
                                              height: 2,
                                              color: Colors.black,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '3 options from',
                                                style: style(fontSize: 18),
                                              ),
                                              verticalSpacer(10),
                                              Text(
                                                '\$59.99',
                                                style: style(fontSize: 18),
                                                textAlign: TextAlign.end,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defaultTextStyle(
                    child: Column(
                      children: [
                        verticalSpacer(10),
                        Row(
                          children: [
                            Text(
                              'Details',
                              style: style(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        verticalSpacer(15),
                        defaultTextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          child: Container(
                            width: getWidth(context),
                            child: defaultTextStyle(
                              color: Color.fromARGB(255, 53, 53, 53),
                              fontSize: 18,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Brand'),
                                      Container(
                                          width: getWidthRatio(context, 0.5),
                                          child: Text(
                                            'REVLON',
                                            style: style(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )),
                                    ],
                                  ),
                                  verticalSpacer(5),
                                  Container(
                                      width: getWidth(context),
                                      child: Divider(
                                        height: 2,
                                        color: Colors.black,
                                      )),
                                  verticalSpacer(5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Color'),
                                      Container(
                                          width: getWidthRatio(context, 0.5),
                                          child: Text(
                                            'Black',
                                            style: style(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                  verticalSpacer(5),
                                  Container(
                                      width: getWidth(context),
                                      child: Divider(
                                        height: 2,
                                        color: Colors.black,
                                      )),
                                  verticalSpacer(5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Material'),
                                      Container(
                                          width: getWidthRatio(context, 0.5),
                                          child: Text(
                                            'Nylon',
                                            style: style(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                  verticalSpacer(5),
                                  Container(
                                      width: getWidth(context),
                                      child: Divider(
                                        height: 2,
                                        color: Colors.black,
                                      )),
                                  verticalSpacer(5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Wattage'),
                                      Container(
                                          width: getWidthRatio(context, 0.5),
                                          child: Text(
                                            'Corded Electric',
                                            style: style(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
