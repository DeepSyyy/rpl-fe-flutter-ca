import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/config/app_color.dart';

class IndicatorCarousel extends StatefulWidget {
  const IndicatorCarousel({
    super.key,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current;

  final CarouselController _controller;
  final int _current;

  @override
  State<IndicatorCarousel> createState() => _IndicatorCarouselState();
}

class _IndicatorCarouselState extends State<IndicatorCarousel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [1, 2, 3].map((entry) {
        return GestureDetector(
          onTap: () => widget._controller.animateToPage(entry - 1),
          child: widget._current == entry - 1
              ? AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: widget._current == entry - 1
                      ? Curves.easeOut
                      : Curves.easeIn,
                  width: 28,
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 4.0),
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primary,
                  ),
                )
              : AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: widget._current == entry - 1
                      ? Curves.easeOut
                      : Curves.easeIn,
                  width: 6,
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 4.0),
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primary.withOpacity(0.5),
                  ),
                ),
        );
      }).toList(),
    );
  }
}
