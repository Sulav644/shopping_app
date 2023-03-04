import 'package:flutter/material.dart';
import 'package:shopping_app/core/utils.dart';

class Components {
  Container box({required String title}) => Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: textStyle(color: Colors.white),
        ),
      );
  Image urlImage({required String imgUrl}) => Image.network(
        imgUrl,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      );
}
