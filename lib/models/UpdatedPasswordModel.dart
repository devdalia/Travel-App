class UpdatedPasswordModel {
  UpdatedPasswordModel({
      this.code, 
      this.status, 
      this.message, 
      this.data,});

  UpdatedPasswordModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? code;
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.newpassword, 
      this.token,});

  Data.fromJson(dynamic json) {
    newpassword = json['new password'];
    token = json['token'];
  }
  String? newpassword;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['new password'] = newpassword;
    map['token'] = token;
    return map;
  }

}