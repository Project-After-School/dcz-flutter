class login {
  String? accountId;
  String? password;

  login({this.accountId, this.password});

  login.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['password'] = this.password;
    return data;
  }
}
