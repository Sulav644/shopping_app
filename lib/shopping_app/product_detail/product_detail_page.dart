import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils.dart';
import '../home_page.dart';
import 'components/price_slider.dart';

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
      backgroundColor: const Color.fromARGB(255, 196, 195, 195),
      body: SingleChildScrollView(
        child: Column(
          children: [
            productDetailHeading(),
            productImage(context: context),
            if (index.isEven) PriceSlider(selectedSize: selectedSize),
            if (index.isOdd) unavailableTag(),
            originalPriceTag(context: context),
            productDetail(context: context),
          ],
        ),
      ),
    );
  }

  Container productDetailHeading() => Container(
        height: 80,
        color: const Color.fromARGB(255, 1, 20, 36),
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            children: [
              const Icon(
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
      );
  Container productImage({required BuildContext context}) => Container(
        width: getWidth(context),
        height: getHeightRatio(context, 0.4),
        color: Colors.white,
        child: Image.network(
          imgUrl,
          fit: BoxFit.contain,
        ),
      );
  Padding unavailableTag() => Padding(
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
      );
  Padding originalPriceTag({required BuildContext context}) => Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defaultTextStyle(
                child: Padding(
                  padding: padding(),
                  child: Column(
                    children: [
                      originalEdition(),
                      verticalSpacer(10),
                      editionTable(context: context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  SizedBox editionTable({required BuildContext context}) => SizedBox(
        width: getWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: getWidthRatio(context, 0.4),
              decoration: decoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: decorationWithBorder(),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0), child: title())),
                  SizedBox(
                      width: getWidth(context),
                      child: const Divider(
                        height: 2,
                        color: Colors.black,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        tableContent('3 options from'),
                        verticalSpacer(10),
                        tableContent('\$59.99')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  Text tableContent(String title) => Text(
        title,
        style: style(fontSize: 18),
      );
  Widget title() => Text(
        'Original 1.0',
        style: style(fontWeight: FontWeight.bold),
      );
  Row originalEdition() => Row(
        children: [
          Text(
            'Edition: Original 1.0',
            style: style(),
          ),
        ],
      );
  EdgeInsets padding() =>
      const EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0, bottom: 28.0);
  Decoration decoration() => BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(4));
  Decoration decorationWithBorder() => const BoxDecoration(
      color: Color.fromARGB(255, 238, 237, 237),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4), topRight: Radius.circular(4)));
  Padding productDetail({required BuildContext context}) => Padding(
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
                    child: SizedBox(
                      width: getWidth(context),
                      child: defaultTextStyle(
                        color: const Color.fromARGB(255, 53, 53, 53),
                        fontSize: 18,
                        child: Column(
                          children: [
                            detailContent(context, 'Brand', 'REVLON'),
                            verticalSpacer(5),
                            divider(context),
                            verticalSpacer(5),
                            detailContent(context, 'Color', 'Black'),
                            verticalSpacer(5),
                            divider(context),
                            verticalSpacer(5),
                            detailContent(context, 'Material', 'Nylon'),
                            verticalSpacer(5),
                            divider(context),
                            verticalSpacer(5),
                            detailContent(context, 'Wattage', 'Corded Electric')
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
      );
  SizedBox divider(BuildContext context) => SizedBox(
      width: getWidth(context),
      child: const Divider(
        height: 2,
        color: Colors.black,
      ));
  Row detailContent(BuildContext context, String key, String title) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(key),
          SizedBox(
              width: getWidthRatio(context, 0.5),
              child: Text(
                title,
                style: style(fontWeight: FontWeight.bold, fontSize: 18),
              )),
        ],
      );
}
