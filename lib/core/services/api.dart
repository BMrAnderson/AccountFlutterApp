import 'dart:convert';
import 'dart:io';

import 'package:account_manager/core/models/account.dart';
import 'package:http/http.dart' as http;

//Make http requests with the service
class Api {
  static const address = 'http://us-central1-momentumtest-bfdef.cloudfunctions.net/app/api/v1/account';

  var client = new http.Client();

  Future<Account> getAccountByUserId(String userId) async {
    //get account for user by id
    var response = await client.get('$address/$userId');

    return Account.fromJson(json.decode(response.body));
  }

  //
  Future<List<Account>> getAccountListByUserId(String userId) async {
    var accounts = List<Account>();

    //get list of accounts by user id
    var response = await client.get('$address/findByUserId?userId=$userId');

    var result = json.decode(response.body) as List<dynamic>;

    for (var account in result) {
      accounts.add(Account.fromJson(account));
    }
    return accounts;
  }

  Future createAccount(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new HttpException('Error while fetching data');
      }
      return Account.fromJson(json.decode(response.body));
    });
  }
}