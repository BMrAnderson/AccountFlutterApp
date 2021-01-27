class Account {
  String id;
  String userId;
  String name;
  int accountNumber;
  double balance;
  double overdraft;
  DateTime modified;
  DateTime created;
  bool isActive;

  Account({
    this.id,
    this.userId,
    this.name,
    this.accountNumber,
    this.balance,
    this.overdraft,
    this.created,
    this.modified,
    this.isActive});

  Account.fromJson(Map json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    accountNumber = json['accountNumber'];
    balance = json['balance'];
    overdraft = json['overdraft'];
    modified = json['modified'];
    created = json['created'];
    isActive = json['active'];
  }

  Map toJson() {
    final Map data = new Map();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['accountNumber'] = this.accountNumber;
    data['balance'] = this.balance;
    data['overdraft'] = this.overdraft;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['active'] = this.isActive;
    return data;
  }
}