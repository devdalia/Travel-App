class TypeReservationModel {
  TypeReservationModel({
      this.code, 
      this.status, 
      this.message, 
      this.data,});

  TypeReservationModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataType.fromJson(v));
      });
    }
  }
  int? code;
  bool? status;
  String? message;
  List<DataType>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DataType {
  DataType({
      this.id, 
      this.type, 
      this.pointsCount, 
      this.createdAt, 
      this.updatedAt,});

  DataType.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    pointsCount = json['points_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? type;
  String? pointsCount;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['points_count'] = pointsCount;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}