import 'package:flutter/material.dart';
import 'package:luxetime/util/theme.dart';

class BrandTile extends StatelessWidget {
  final String img;
  const BrandTile({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 0,
        color: MyColors.surface,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(img),
        ),
      ),
    );
  }
}
