import 'package:flutter/material.dart';
import 'package:provide1state/providers/changename_provider.dart';
import 'package:provide1state/providers/counter_providers.dart';
import 'package:provide1state/providers/thirdscree_provider.dart';
import 'package:provide1state/screens/home.dart';
import 'package:provide1state/screens/screen2.dart';
import 'package:provide1state/screens/screen3.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter()),
          ChangeNotifierProvider(create: (_) => ThirdProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ThirdScreen(),
        ));
  }
}


// ChangeNotifierProvider(
//       create: (_) => ChangeName(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // home: HomeScreen(),
//         home: SecondScreen(),
//       ),
//     );