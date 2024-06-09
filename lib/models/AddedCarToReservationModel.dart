class AddedCarToReservationModel {
  AddedCarToReservationModel({
      this.code, 
      this.status, 
      this.message, 
      this.data,});

  AddedCarToReservationModel.fromJson(dynamic json) {
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
      this.car,});

  Data.fromJson(dynamic json) {
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
  }
  Car? car;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (car != null) {
      map['car'] = car?.toJson();
    }
    return map;
  }

}

class Car {
  Car({
      this.id, 
      this.name, 
      this.carTypeId, 
      this.color, 
      this.periodTraveling, 
      this.price, 
      this.currentLoading, 
      this.maxLoading, 
      this.features, 
      this.createdAt, 
      this.updatedAt, 
      this.carType,});

  Car.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    carTypeId = json['car_type_id'];
    color = json['color'];
    periodTraveling = json['period_traveling'];
    price = json['price'];
    currentLoading = json['current_loading'];
    maxLoading = json['max_loading'];
    features = json['features'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    carType = json['car_type'] != null ? CarType.fromJson(json['car_type']) : null;
  }
  int? id;
  String? name;
  String? carTypeId;
  String? color;
  String? periodTraveling;
  String? price;
  String? currentLoading;
  String? maxLoading;
  String? features;
  dynamic createdAt;
  dynamic updatedAt;
  CarType? carType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['car_type_id'] = carTypeId;
    map['color'] = color;
    map['period_traveling'] = periodTraveling;
    map['price'] = price;
    map['current_loading'] = currentLoading;
    map['max_loading'] = maxLoading;
    map['features'] = features;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (carType != null) {
      map['car_type'] = carType?.toJson();
    }
    return map;
  }

}

class CarType {
  CarType({
      this.id, 
      this.type, 
      this.createdAt, 
      this.updatedAt,});

  CarType.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? type;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}