import 'package:flutter/material.dart';
import 'package:provide1state/providers/counter_providers.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    final counter = Provider.of<Counter>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      counter.increment();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lets Learn Provider"),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, value, child) {
            return Text(
              value.count.toString(),
              style: TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
      ),
    );
  }
}
