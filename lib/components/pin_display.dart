import 'package:flutter/widgets.dart';
import 'package:simple_pinpad/components/pin_placeholder.dart';

class PinDisplay extends StatelessWidget {
  final int length;
  final int count;

  const PinDisplay(this.length, this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(bottom: 5, left: 0, right: 0, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: List<PinPlaceholder>.generate(
                  count,
                  (i) => PinPlaceholder(
                        active: i < length ? true : false,
                      )),
            )
          ],
        ));
  }
}
