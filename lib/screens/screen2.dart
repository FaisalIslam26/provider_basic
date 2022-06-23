import 'package:flutter/material.dart';
import 'package:provide1state/providers/changename_provider.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    final changeName = Provider.of<ChangeName>(context, listen: false);
    // TODO: implement initState

    Timer.periodic(Duration(seconds: 2), (timer) {
      changeName.increment();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final changeName = Provider.of<ChangeName>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Increment Using Flutter'),
      ),
      body:
          Center(child: Consumer<ChangeName>(builder: ((context, value, child) {
        return Text(
          value.increase.toString(),
          style: TextStyle(fontSize: 50),
        );
      }))),
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeName.increment();
      }),
    );
  }
}
