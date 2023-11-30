import 'package:flutter/cupertino.dart';
import 'package:luxetime/util/theme.dart';

class Explore extends StatelessWidget {
  final Function() onTap;
  const Explore({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 8),
          Text('Explore',style: MyTexts.label.copyWith(fontSize: 14)),
          const Icon(CupertinoIcons.chevron_forward, size: 20)
        ],
      ),
    );
  }
}
