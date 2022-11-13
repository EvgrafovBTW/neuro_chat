import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuro_chat/colors.dart';

class TabIndicator extends Decoration {
  @override
  _TabIndicatorPainter createBoxPainter([VoidCallback? onChanged]) =>
      _TabIndicatorPainter(this, onChanged ?? () {});
}

class _TabIndicatorPainter extends BoxPainter {
  final TabIndicator decoration;
  _TabIndicatorPainter(this.decoration, VoidCallback onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = Rect.fromLTWH(
        configuration.size!.width / 2 + offset.dx - 35, offset.dy + 65, 75, 5);
    final Paint paint = Paint();
    paint.color = authTabPrimaryColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect,
          topLeft: const Radius.circular(10),
          topRight: const Radius.circular(10),
        ),
        paint);
  }
}
