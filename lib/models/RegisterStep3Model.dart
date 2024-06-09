class RegisterStep3Model {
  RegisterStep3Model({
      this.status, 
      this.code, 
      this.message,
      this.data,});

  RegisterStep3Model.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  int? code;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.regUser, 
      this.personalId, 
      this.password,});

  Data.fromJson(dynamic json) {
    regUser = json['regUser'];
    personalId = json['personal_id'];
    password = json['password'];
  }
  bool? regUser;
  String? personalId;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['regUser'] = regUser;
    map['personal_id'] = personalId;
    map['password'] = password;
    return map;
  }

}