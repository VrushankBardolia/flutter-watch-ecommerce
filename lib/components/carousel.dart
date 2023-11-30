import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../util/theme.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset('assets/banners/banner1.jpg', fit: BoxFit.cover),
              Image.asset('assets/banners/banner2.jpg', fit: BoxFit.cover),
              Image.asset('assets/banners/banner3.jpg', fit: BoxFit.cover)
            ],
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index,reason){
                setState(()=> activeIndex = index);
              }
            )
          ),

          const SizedBox(height: 8),

          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 3,
            effect: WormEffect(
              dotWidth: 12,
              dotHeight: 12,
              activeDotColor: MyColors.primary,
              dotColor: CupertinoColors.opaqueSeparator,
              type: WormType.underground
            ),
          )
        ],
      ),
    );
  }
}
