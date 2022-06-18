import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ultrasenses_fitboard/core/const/path_constants.dart';

/// Global widget that depicts a custom rounded user icon
/// Use for creating user profile images

class RoundedImage extends StatelessWidget {
  final String? url;
  final String? path;
  final double width;
  final double height;
  final double? radius;
  final EdgeInsets? margin;
  final double borderRadius;

  const RoundedImage({
    Key? key,
    this.url,
    this.path = "",
    this.margin,
    this.radius = 25,
    this.width = 40,
    this.height = 40,
    this.borderRadius = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path != null) {
      if (path!.startsWith('https://')) {
        return CircleAvatar(
            backgroundColor: const Color(0x00000000),
            radius: radius,
            child: ClipOval(
                child: FadeInImage.assetNetwork(
              placeholder: PathConstants.profile,
              image: path!,
              fit: BoxFit.cover,
              width: 200,
              height: 120,
            )));
      } else {
        return CircleAvatar(
            backgroundColor: const Color(0x00000000),
            backgroundImage: AssetImage(path!),
            radius: radius);
      }
    } else {
      return CircleAvatar(
          backgroundColor: const Color(0x00000000),
          backgroundImage: const AssetImage(PathConstants.profile),
          radius: radius);
    }
  }
}
