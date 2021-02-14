import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_pinpad/widgets/numpad.dart';
import 'package:simple_pinpad/components/pin_display.dart';
import 'package:simple_pinpad/layouts/english.dart';
import 'package:simple_pinpad/models/key_layout.dart';
import 'package:simple_pinpad/models/pin_value.dart';

class SimplePinPad extends StatefulWidget {
  final String value;
  final int pinLength;
  final List<KeyLayoutModel> keyLayout;
  final Function(BuildContext context, String value) onChanged;
  final Function(BuildContext context, String value) onCompleted;
  final Widget Function(BuildContext context, KeyLayoutModel model)
      buttonBuilder;
  final Widget additionalButton1;
  final Widget additionalButton2;

  SimplePinPad(
      {this.value = "",
      this.pinLength = 4,
      this.keyLayout,
      this.onChanged,
      this.onCompleted,
      this.buttonBuilder,
      this.additionalButton1,
      this.additionalButton2});

  @override
  _SimplePinPadState createState() => _SimplePinPadState(
      value,
      pinLength,
      keyLayout,
      onChanged,
      onCompleted,
      buttonBuilder,
      additionalButton1,
      additionalButton2);
}

class _SimplePinPadState extends State<SimplePinPad> {
  PinValueModel pin;
  final List<KeyLayoutModel> keyLayout;
  final Function(BuildContext context, String value) onChanged;
  final Function(BuildContext context, String value) onCompleted;
  final Widget Function(BuildContext context, KeyLayoutModel model)
      buttonBuilder;
  final Widget additionalButton1;
  final Widget additionalButton2;
  StreamSubscription streamSubscription;

  _SimplePinPadState(
      value,
      pinLength,
      this.keyLayout,
      this.onChanged,
      this.onCompleted,
      this.buttonBuilder,
      this.additionalButton1,
      this.additionalButton2) {
    this.pin = PinValueModel(value: value, length: pinLength);
  }

  @override
  void initState() {
    if (streamSubscription == null) {
      streamSubscription = pin.valueUpdates.listen((newVal) => {
            if (pin.value != newVal)
              setState(() {
                pin.value = newVal;
              })
          });
    }
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(bottom: 5, left: 0, right: 0, top: 5),
            //color: Theme.of(context).canvasColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<String>(
                    initialData: pin.value,
                    stream: pin.valueUpdates,
                    builder: (context, snappShot) {
                      String newValue;
                      if (snappShot != null && snappShot.hasData) {
                        newValue = snappShot.data.toString();
                      }
                      return PinDisplay(newValue.length, pin.length);
                    }),
              ],
            )),
        NumPad(
          onPressed: (BuildContext context, KeyLayoutModel key) async {
            String oldValue = pin.value;

            if (key.type == NumpadButtonType.delete) {
              pin.deleteChar();
            } else {
              pin.addChar(key.value ?? key.char);
            }

            if (pin.value != oldValue) {
              if (onChanged != null) {
                onChanged(context, pin.value);
              }

              if (pin.value.length == this.pin.length) {
                if (onCompleted != null) {
                  onCompleted(context, pin.value);
                }
              }
            }
          },
          keyLayout: keyLayout ?? englishKeyLayout,
          buttonBuilder: this.buttonBuilder,
          additionalButton1: this.additionalButton1,
          additionalButton2: this.additionalButton2,
        )
      ],
    );
  }
}
