import 'package:account_manager/core/models/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetail extends StatelessWidget {
  final Account account;

  AccountDetail({@required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text("Name"),
                      subtitle: Text(account.name),
                    ),
                    ListTile(
                      title: Text('Account Number'),
                      subtitle: Text(account.accountNumber.toString()),
                    ),
                    ListTile(
                      title: Text("Balance"),
                      subtitle: Text(account.balance.toString()),
                    ),
                    ListTile(
                      title: Text("Overdraft"),
                      subtitle: Text(account.overdraft.toString()),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text("Active"),
                      subtitle: Text(account.isActive.toString()),
                    ),
                    ListTile(
                      title: Text('User Id'),
                      subtitle: Text(account.userId),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}