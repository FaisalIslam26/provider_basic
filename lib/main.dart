import 'package:flutter/material.dart';
import 'package:provide1state/providers/auth_provider.dart';
import 'package:provide1state/providers/changename_provider.dart';
import 'package:provide1state/providers/counter_providers.dart';
import 'package:provide1state/providers/favourite_provider.dart';
import 'package:provide1state/providers/thirdscree_provider.dart';
import 'package:provide1state/screens/favorite/favorite_screen.dart';
import 'package:provide1state/screens/home.dart';
import 'package:provide1state/screens/login.dart';
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
          ChangeNotifierProvider(create: (_) => FavouriteItem()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
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

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FavouriteScreen(),
//     );
//   }
// }
