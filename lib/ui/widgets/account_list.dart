import 'package:account_manager/core/models/account.dart';
import 'package:account_manager/core/services/api.dart';
import 'package:account_manager/ui/widgets/account_detail.dart';
import 'package:account_manager/ui/widgets/add_new_account_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountList extends StatelessWidget {
  Api http = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      floatingActionButton: FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          child: AddNewAccountModal(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: http.getAccountListByUserId("UZyMgwSApiN0b148VDrZSAeWkfb2"),
        builder: (BuildContext context, AsyncSnapshot<List<Account>> snapshot) {
          if (snapshot.hasData) {
            List<Account> accounts = snapshot.data;
            return ListView(
              children: accounts
                  .map(
                    (Account account) => ListTile(
                  title: Text(account.name),
                  subtitle: Text(account.balance.toString()),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AccountDetail(
                        account: account,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
