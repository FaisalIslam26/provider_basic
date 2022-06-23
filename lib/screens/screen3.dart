import 'package:flutter/material.dart';
import 'package:provide1state/providers/thirdscree_provider.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Third Screen'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ThirdProvider>(builder: ((context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    print(value);

                    value.setValue(val);
                  });
            })),
            Consumer<ThirdProvider>(builder: ((context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: Center(
                        child: Text('Container 1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: Center(
                        child: Text('Container 2'),
                      ),
                    ),
                  ),
                ],
              );
            })),
          ],
        ));
  }
}
