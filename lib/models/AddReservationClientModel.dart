class AddReservationClientModel {
  AddReservationClientModel({
      this.code, 
      this.status, 
      this.message, 
      this.data,});

  AddReservationClientModel.fromJson(dynamic json) {
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
      this.id, 
      this.userId, 
      this.clientId, 
      this.pointsCount, 
      this.operationNum, 
      this.type, 
      this.nameCar, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    pointsCount = json['points_count'];
    operationNum = json['operation_num'];
    type = json['type'];
    nameCar = json['name_car'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  dynamic userId;
  String? clientId;
  String? pointsCount;
  String? operationNum;
  String? type;
  String? nameCar;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['client_id'] = clientId;
    map['points_count'] = pointsCount;
    map['operation_num'] = operationNum;
    map['type'] = type;
    map['name_car'] = nameCar;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}