class GetDocumentationModel {
  GetDocumentationModel({
      this.code, 
      this.status, 
      this.message, 
      this.data,});

  GetDocumentationModel.fromJson(dynamic json) {
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
      this.user, 
      this.documentationsUser,});

  Data.fromJson(dynamic json) {
    user = json['user'];
    if (json['documentationsUser'] != null) {
      documentationsUser = [];
      json['documentationsUser'].forEach((v) {
        documentationsUser?.add(DocumentationsUser.fromJson(v));
      });
    }
  }
  String? user;
  List<DocumentationsUser>? documentationsUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = user;
    if (documentationsUser != null) {
      map['documentationsUser'] = documentationsUser?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DocumentationsUser {
  DocumentationsUser({
      this.id, 
      this.userId, 
      this.clientId, 
      this.createdAt, 
      this.updatedAt, 
      this.client,});

  DocumentationsUser.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
  }
  int? id;
  String? userId;
  String? clientId;
  String? createdAt;
  String? updatedAt;
  Client? client;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['client_id'] = clientId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (client != null) {
      map['client'] = client?.toJson();
    }
    return map;
  }

}

class Client {
  Client({
      this.id, 
      this.locale, 
      this.name, 
      this.personalId, 
      this.passportNum, 
      this.phoneNo, 
      this.carId, 
      this.loadingCar, 
      this.status, 
      this.documentation, 
      this.confirmed, 
      this.agreement, 
      this.birthDate, 
      this.endDatePassport, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt,});

  Client.fromJson(dynamic json) {
    id = json['id'];
    locale = json['locale'];
    name = json['name'];
    personalId = json['personal_id'];
    passportNum = json['passport_num'];
    phoneNo = json['phone_no'];
    carId = json['car_id'];
    loadingCar = json['loading_car'];
    status = json['status'];
    documentation = json['documentation'];
    confirmed = json['confirmed'];
    agreement = json['agreement'];
    birthDate = json['birth_date'];
    endDatePassport = json['end_date_passport'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? locale;
  String? name;
  String? personalId;
  String? passportNum;
  String? phoneNo;
  String? carId;
  String? loadingCar;
  String? status;
  String? documentation;
  String? confirmed;
  String? agreement;
  String? birthDate;
  dynamic endDatePassport;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['locale'] = locale;
    map['name'] = name;
    map['personal_id'] = personalId;
    map['passport_num'] = passportNum;
    map['phone_no'] = phoneNo;
    map['car_id'] = carId;
    map['loading_car'] = loadingCar;
    map['status'] = status;
    map['documentation'] = documentation;
    map['confirmed'] = confirmed;
    map['agreement'] = agreement;
    map['birth_date'] = birthDate;
    map['end_date_passport'] = endDatePassport;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}