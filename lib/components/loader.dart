import 'package:flutter/cupertino.dart';

import '../util/theme.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: CupertinoActivityIndicator(
            radius: 20,
            color: MyColors.onPrimary,
          ),
        ),
      ),
    );
  }
}
