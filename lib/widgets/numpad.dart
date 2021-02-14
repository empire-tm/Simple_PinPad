import 'package:flutter/material.dart';
import 'package:simple_pinpad/components/numpad_button.dart';
import 'package:simple_pinpad/models/key_layout.dart';

class NumPad extends StatelessWidget {
  final void Function(BuildContext context, KeyLayoutModel key) onPressed;
  final Widget Function(BuildContext context, KeyLayoutModel model)
      buttonBuilder;
  final List<KeyLayoutModel> keyLayout;
  final Widget additionalButton1;
  final Widget additionalButton2;

  const NumPad(
      {this.onPressed,
      this.buttonBuilder,
      this.keyLayout,
      this.additionalButton1,
      this.additionalButton2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildRow(context, keyLayout.sublist(0, 3)),
        buildRow(context, keyLayout.sublist(3, 6)),
        buildRow(context, keyLayout.sublist(6, 9)),
        buildRow(context, keyLayout.sublist(9, 12))
      ],
    );
  }

  Widget buildRow(BuildContext context, List<KeyLayoutModel> keys) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: keys.map((value) => buildButton(context, value)).toList(),
      ),
    );
  }

  Widget buildButton(BuildContext context, KeyLayoutModel key) {
    if (buttonBuilder != null) {
      return buttonBuilder(context, key);
    } else {
      if (key.type == NumpadButtonType.additional1) {
        return additionalButton1 ?? NumPadButton();
      } else if (key.type == NumpadButtonType.additional2) {
        return additionalButton2 ?? NumPadButton();
      }
      if (key.type == NumpadButtonType.delete) {
        return NumPadButton(
            icon: Icons.backspace,
            onPressed: (BuildContext context) async {
              this.onPressed(context, key);
            });
      } else
        return NumPadButton(
            letter: key.char,
            label: key.label,
            onPressed: (BuildContext context) async {
              this.onPressed(context, key);
            });
    }
  }
}
