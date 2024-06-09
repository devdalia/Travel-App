class ProfileModel {
  ProfileModel({
      this.status, 
      this.data,});

  ProfileModel.fromJson(dynamic json) {
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
      this.status, 
      this.documentation, 
      this.confirmed, 
      this.agreement, 
      this.birthDate, 
      this.endDatePassport, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.image, 
      this.passportImages,});

  Data.fromJson(dynamic json) {
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
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    if (json['passport_images'] != null) {
      passportImages = [];
      json['passport_images'].forEach((v) {
       /// passportImages?.add(Dynamic.fromJson(v));
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
  String? birthDate;
  dynamic endDatePassport;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  Image? image;
  List<dynamic>? passportImages;

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
    if (image != null) {
      map['image'] = image?.toJson();
    }
    if (passportImages != null) {
      map['passport_images'] = passportImages?.map((v) => v.toJson()).toList();
    }
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