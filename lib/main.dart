import 'package:flutter/material.dart';
import 'package:simple_pinpad/widgets/simple_pinpad.dart';

import 'components/numpad_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimplePinPad Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SimplePinPad Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Text("Enter pin code:"),
            SimplePinPad(
              onChanged: (BuildContext context, String value) {
                debugPrint("onChanged: " + value);
              },
              onCompleted: (BuildContext context, String value) {
                debugPrint("onCompleted: " + value);

                SnackBar snackBar =
                    SnackBar(content: Text("You pin code: " + value));
                Scaffold.of(context).showSnackBar(snackBar);
              },
              additionalButton1: NumPadButton(
                  icon: Icons.fingerprint,
                  onPressed: (BuildContext context) async {
                    SnackBar snackBar = SnackBar(content: Text("Touch ID"));
                    Scaffold.of(context).showSnackBar(snackBar);
                  }),
            )
          ],
        ))));
  }
}
