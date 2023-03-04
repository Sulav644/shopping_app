import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopping_app/shopping_app/product_detail/product_detail_page.dart';
import 'package:shopping_app/shopping_app/product_slider/presenter/presenter.dart';
import '../sub_widgets/product_image_and_label_body.dart';
import '../widget_designs/designs.dart';
import '../widget_helpers/aligners.dart';
import '../domain/product_data.dart';

const sliderTitles = [
  "Footwears",
  "Tablets",
  "Travellings",
  "Cleanups",
  "Home Utilities",
  "Partywears",
  "Kids Toys",
  "Gadgets",
  "Babycarts",
  "Babyplays",
  "Handwears",
  "Cheap Phones",
  "Wearings"
];

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderPresenter(children: [
          ...List.generate(
            imgUrl.length,
            (index) => ProductImageAndLabelBody(
                index: index,
                imgUrl: imgUrl[index],
                title: sliderTitles[index]),
          )
        ])
      ],
    );
  }
}
