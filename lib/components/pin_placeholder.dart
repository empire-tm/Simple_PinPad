import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PinPlaceholder extends StatelessWidget {
  final bool active;
  final Color color;
  final double size;

  PinPlaceholder({
    this.active = false,
    this.color,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    Color newColor = color ?? Theme.of(context).textTheme.headline5.color;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Material(
        color: active ? newColor : newColor.withOpacity(0.2),
        shape: CircleBorder(),
        child: Container(
          width: size,
          height: size,
        ),
      ),
    );
  }
}
