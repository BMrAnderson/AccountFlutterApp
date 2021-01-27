import 'package:flutter/material.dart';
import 'package:account_manager/ui/widgets/account_detail.dart';
import 'package:account_manager/ui/widgets/account_list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accounts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: AccountList(),
      );
  }
}