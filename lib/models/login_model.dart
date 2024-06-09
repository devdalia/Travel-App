import 'package:amwaj_car/models/roles.dart';

class UserModel {
  UserModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  UserModel.fromJson(dynamic json) {
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
    this.token,
    this.user,
    this.roles,
  });

  Data.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
  }

  String? token;
  User? user;
  List<Roles>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.locale,
    this.name,
    this.personalId,
    this.passportNum,
    this.phoneNo,
    this.status,
    this.documentation,
    this.confirmed,
    this.agreement,
    this.birthDate,
    this.endDatePassport,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    locale = json['locale'];
    name = json['name'];
    personalId = json['personal_id'];
    passportNum = json['passport_num'];
    phoneNo = json['phone_no'];
    status = json['status'];
    documentation = json['documentation'];
    confirmed = json['confirmed'];
    agreement = json['agreement'];
    birthDate = json['birth_date'];
    endDatePassport = json['end_date_passport'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles?.add(Roles.fromJson(v));
      });
    }
  }

  int? id;
  String? locale;
  dynamic name;
  String? personalId;
  String? passportNum;
  String? phoneNo;
  String? status;
  String? documentation;
  String? confirmed;
  String? agreement;
  dynamic birthDate;
  dynamic endDatePassport;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  List<Roles>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['locale'] = locale;
    map['name'] = name;
    map['personal_id'] = personalId;
    map['passport_num'] = passportNum;
    map['phone_no'] = phoneNo;
    map['status'] = status;
    map['documentation'] = documentation;
    map['confirmed'] = confirmed;
    map['agreement'] = agreement;
    map['birth_date'] = birthDate;
    map['end_date_passport'] = endDatePassport;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
