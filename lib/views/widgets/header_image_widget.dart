import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final bool isLandscape;

  const HeaderImageWidget({super.key, this.isLandscape = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isLandscape ? double.infinity : 240,
      width: double.infinity,
      child: Image.asset(
        'assets/images/imagessibu.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
