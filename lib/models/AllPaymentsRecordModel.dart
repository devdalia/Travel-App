class AllPaymentsRecordModel {
  AllPaymentsRecordModel({
      this.code, 
      this.status, 
      this.message, 
      this.data,});

  AllPaymentsRecordModel.fromJson(dynamic json) {
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
      this.personalId, 
      this.allPaymentsRecord,});

  Data.fromJson(dynamic json) {
    personalId = json['personal_id'];
    if (json['allPaymentsRecord'] != null) {
      allPaymentsRecord = [];
      json['allPaymentsRecord'].forEach((v) {
        allPaymentsRecord?.add(AllPaymentsRecord.fromJson(v));
      });
    }
  }
  String? personalId;
  List<AllPaymentsRecord>? allPaymentsRecord;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['personal_id'] = personalId;
    if (allPaymentsRecord != null) {
      map['allPaymentsRecord'] = allPaymentsRecord?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AllPaymentsRecord {
  AllPaymentsRecord({
      this.id, 
      this.operationNum, 
      this.userId, 
      this.driverId, 
      this.pointsCount, 
      this.barcode, 
      this.confirmed, 
      this.paid, 
      this.createdAt, 
      this.updatedAt, 
      this.driver,});

  AllPaymentsRecord.fromJson(dynamic json) {
    id = json['id'];
    operationNum = json['operation_num'];
    userId = json['user_id'];
    driverId = json['driver_id'];
    pointsCount = json['points_count'];
    barcode = json['barcode'];
    confirmed = json['confirmed'];
    paid = json['paid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
  }
  int? id;
  String? operationNum;
  String? userId;
  String? driverId;
  String? pointsCount;
  String? barcode;
  String? confirmed;
  String? paid;
  String? createdAt;
  String? updatedAt;
  Driver? driver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['operation_num'] = operationNum;
    map['user_id'] = userId;
    map['driver_id'] = driverId;
    map['points_count'] = pointsCount;
    map['barcode'] = barcode;
    map['confirmed'] = confirmed;
    map['paid'] = paid;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    return map;
  }

}

class Driver {
  Driver({
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

  Driver.fromJson(dynamic json) {
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