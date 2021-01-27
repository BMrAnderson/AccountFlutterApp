import 'package:account_manager/ui/widgets/account_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewAccountModal extends StatefulWidget {
  @override
  _AddNewAccountModalState createState() => _AddNewAccountModalState();
}

class _AddNewAccountModalState extends State<AddNewAccountModal> {
  final _formKey = GlobalKey<FormState>();
  String name;
  double balance;
  int accountNumber;

  @override
  Widget build(BuildContext context) => AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 8,),
        AccountFormWidget(
            onChangedName: (name) => setState(() => this.name = name), 
            onChangedBalance: (balance) => setState(() => this.balance = double.parse(balance)),
            onSaved: null)
      ],
    ),
  );

}