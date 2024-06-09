class DriverProfile {
  DriverProfile({
      this.status, 
      this.data,});

  DriverProfile.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.locale, 
      this.name, 
      this.personalId, 
      this.passportNum, 
      this.phoneNo, 
      this.carId, 
      this.loadingCar, 
      this.lat, 
      this.lon, 
      this.status, 
      this.securityCode, 
      this.documentation, 
      this.confirmed, 
      this.agreement, 
      this.birthDate, 
      this.endDatePassport, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.image, 
      this.passportImages, 
      this.car,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    locale = json['locale'];
    name = json['name'];
    personalId = json['personal_id'];
    passportNum = json['passport_num'];
    phoneNo = json['phone_no'];
    carId = json['car_id'];
    loadingCar = json['loading_car'];
    lat = json['lat'];
    lon = json['lon'];
    status = json['status'];
    securityCode = json['security_code'];
    documentation = json['documentation'];
    confirmed = json['confirmed'];
    agreement = json['agreement'];
    birthDate = json['birth_date'];
    endDatePassport = json['end_date_passport'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    if (json['passport_images'] != null) {
      passportImages = [];
      json['passport_images'].forEach((v) {
        passportImages?.add(PassportImages.fromJson(v));
      });
    }
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
  }
  int? id;
  String? locale;
  String? name;
  String? personalId;
  String? passportNum;
  String? phoneNo;
  String? carId;
  String? loadingCar;
  String? lat;
  String? lon;
  String? status;
  String? securityCode;
  String? documentation;
  String? confirmed;
  String? agreement;
  dynamic birthDate;
  dynamic endDatePassport;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  Image? image;
  List<PassportImages>? passportImages;
  Car? car;

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
    map['lat'] = lat;
    map['lon'] = lon;
    map['status'] = status;
    map['security_code'] = securityCode;
    map['documentation'] = documentation;
    map['confirmed'] = confirmed;
    map['agreement'] = agreement;
    map['birth_date'] = birthDate;
    map['end_date_passport'] = endDatePassport;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    if (passportImages != null) {
      map['passport_images'] = passportImages?.map((v) => v.toJson()).toList();
    }
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
      this.periodTraveling, 
      this.price, 
      this.currentLoading, 
      this.maxLoading, 
      this.features, 
      this.createdAt, 
      this.updatedAt,});

  Car.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    carTypeId = json['car_type_id'];
    periodTraveling = json['period_traveling'];
    price = json['price'];
    currentLoading = json['current_loading'];
    maxLoading = json['max_loading'];
    features = json['features'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? carTypeId;
  String? periodTraveling;
  String? price;
  String? currentLoading;
  String? maxLoading;
  String? features;
  dynamic createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['car_type_id'] = carTypeId;
    map['period_traveling'] = periodTraveling;
    map['price'] = price;
    map['current_loading'] = currentLoading;
    map['max_loading'] = maxLoading;
    map['features'] = features;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class PassportImages {
  PassportImages({
      this.id, 
      this.userId, 
      this.accountRecoveryId, 
      this.filename, 
      this.createdAt, 
      this.updatedAt,});

  PassportImages.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    accountRecoveryId = json['account_recovery_id'];
    filename = json['filename'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? userId;
  dynamic accountRecoveryId;
  String? filename;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['account_recovery_id'] = accountRecoveryId;
    map['filename'] = filename;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Image {
  Image({
      this.id, 
      this.url, 
      this.imageableId, 
      this.imageableType, 
      this.createdAt, 
      this.updatedAt,});

  Image.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? url;
  String? imageableId;
  String? imageableType;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imageable_id'] = imageableId;
    map['imageable_type'] = imageableType;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}