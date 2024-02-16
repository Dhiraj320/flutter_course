import 'package:flutter/material.dart';

import '../models/text_info.dart';

class ImageText extends StatelessWidget {
  final TextInfo texInfo;
  const ImageText({
    Key? key,
    required this.texInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texInfo.text,
      textAlign: texInfo.textAlign,
      style: TextStyle(
          fontSize: texInfo.fontSize,
          fontWeight: texInfo.fontWeight,
          fontStyle: texInfo.fontStyle,
          color: texInfo.color),
    );
  }
}
