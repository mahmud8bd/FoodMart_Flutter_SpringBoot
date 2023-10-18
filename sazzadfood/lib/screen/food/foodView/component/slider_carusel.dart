import 'package:flutter/material.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:scroll_page_view/scroll_page.dart';
class SliderCarusel extends StatefulWidget {
  const SliderCarusel({
    super.key,
  });

  @override
  State<SliderCarusel> createState() => _SliderState();
}

class _SliderState extends State<SliderCarusel> {
  static const _images = [
    'assets/slider/foodslider1.jpg',
    'assets/slider/foodslider2.jpg',
    'assets/slider/foodslider3.jpg',
    'assets/slider/foodslider4.PNG',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
          child: SizedBox(
            height: size.height * 19/100,
            child: ScrollPageView(
              controller: ScrollPageController(),
              delay: const Duration(seconds: 3),
              indicatorAlign: Alignment.centerRight,
              children:
              (_images.reversed).map((image) => _imageView(image)).toList(),
            ),
          ),
        );
  }

  ///Image
  Widget _imageView(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}