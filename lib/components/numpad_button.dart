import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NumPadButton extends StatelessWidget {
  NumPadButton(
      {this.icon,
      this.letter,
      this.label,
      this.onPressed,
      this.enabled = true,
      this.visible = true,
      this.size = 72,
      this.iconSize = 30});
  final IconData icon;
  final String letter;
  final String label;
  final void Function(BuildContext context) onPressed;
  final bool enabled;
  final bool visible;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    IconButton button = IconButton(
      enableFeedback: true,
      padding: EdgeInsets.all(20),
      iconSize: 60,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,

      icon: Container(
          constraints: BoxConstraints.tightFor(
            width: size,
            height: size,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon != null
                  ? Icon(
                      this.icon,
                      size: this.iconSize,
                      color: Theme.of(context).primaryColor,
                    )
                  : SizedBox(
                      height: 0,
                    ),
              letter != null
                  ? Text(
                      letter,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    ),
              label != null
                  ? Expanded(
                      child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        //fontWeight: FontWeight.bold,
                      ),
                    ))
                  : SizedBox(
                      height: 0,
                    ),
            ],
          )),

      onPressed: () {},
      //padding: EdgeInsets.all(18),
    );

    return SizedBox(
        width: 95,
        height: 95,
        child: Container(
            child: Visibility(
          child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerUp: (PointerUpEvent event) {
                if (isInsideBox(event)) {
                  onPressed(context);
                }
              },
              child: button),
          visible: visible,
        )));
  }

  bool isInsideBox(PointerUpEvent details) {
    return details.localPosition.dx >= 0.0 &&
        details.localPosition.dy >= 0.0 &&
        details.localPosition.dx <= 95 &&
        details.localPosition.dy <= 95;
  }
}
