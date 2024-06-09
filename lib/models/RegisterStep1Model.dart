class RegisterStep1Model {
  RegisterStep1Model({
      this.status, 
      this.code, 
      this.message, 
      this.data,});

  RegisterStep1Model.fromJson(dynamic json) {
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
      this.code,});

  Data.fromJson(dynamic json) {
    regUser = json['regUser'];
    code = json['code'];
  }
  bool? regUser;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['regUser'] = regUser;
    map['code'] = code;
    return map;
  }

}