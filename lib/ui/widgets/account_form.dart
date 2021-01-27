import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountFormWidget extends StatelessWidget {
  final String name;
  final double balance;
  final int accountNumber;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedBalance;
  final ValueChanged<String> onChangedAccountNumber;
  final VoidCallback onSaved;

  const AccountFormWidget({
    Key key,
    this.name = '',
    this.balance = 0,
    this.accountNumber = 0,
    @required this.onChangedName,
    @required this.onChangedBalance,
    @required this.onChangedAccountNumber,
    @required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildName(),
        SizedBox(height: 8),
        buildBalance(),
        SizedBox(height: 20),
        buildNumber(),
        SizedBox(height: 32,),
        buildButton(),
      ],
    ),
  );

  Widget buildName() => TextFormField(
    maxLines: 1,
    initialValue: name,
    onChanged: onChangedName,
    validator: (title) {
      if (title.isEmpty) {
        return 'Please insert account name';
      }
      return null;
    },
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Name',
    ),
  );

  Widget buildBalance() => TextFormField(
    maxLines: 1,
    initialValue: balance.toString(),
    onChanged: onChangedBalance,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Current Balance',
    ),
  );

  Widget buildNumber() => TextFormField(
    maxLines: 1,
    initialValue: accountNumber.toString(),
    onChanged: onChangedAccountNumber,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: 'Account number',
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white)
      ),
      onPressed: onSaved,
      child: Text('Save', ),
    ),
  );
}