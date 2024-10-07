import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppMultiProvider extends StatelessWidget {
  const MyAppMultiProvider({super.key, required this.myApp});
  final Widget myApp;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [], child: myApp);
  }
}
