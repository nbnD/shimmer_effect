import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_example/provider/getdata_provider.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => GetDataProvider()),
        ],
        child:const MaterialApp(
          title: 'Flutter Demo',
          home: HomePage(),
        ));
  }
}
