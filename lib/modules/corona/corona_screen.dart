import 'package:flutter/material.dart';

class CoronaScreen extends StatelessWidget {
  const CoronaScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Text("CoronaScreen"),
      ),
    ));
  }
}
