class GetAllConfirmedReservationsModel {
  GetAllConfirmedReservationsModel({
      this.code, 
      this.status, 
      this.message, 
      this.data,});

  GetAllConfirmedReservationsModel.fromJson(dynamic json) {
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
      this.allTravelersConfirmedWithDriverWait, 
      this.loading,});

  Data.fromJson(dynamic json) {
    allTravelersConfirmedWithDriverWait = json['allTravelersConfirmedWithDriverWait'] != null ? AllTravelersConfirmedWithDriverWait.fromJson(json['allTravelersConfirmedWithDriverWait']) : null;
    loading = json['loading'];
  }
  AllTravelersConfirmedWithDriverWait? allTravelersConfirmedWithDriverWait;
  int? loading;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (allTravelersConfirmedWithDriverWait != null) {
      map['allTravelersConfirmedWithDriverWait'] = allTravelersConfirmedWithDriverWait?.toJson();
    }
    map['loading'] = loading;
    return map;
  }

}

class AllTravelersConfirmedWithDriverWait {
  AllTravelersConfirmedWithDriverWait({
      this.currentPage, 
      this.dataReservations,
      this.firstPageUrl, 
      this.from, 
      this.lastPage, 
      this.lastPageUrl, 
      this.links, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to, 
      this.total,});

  AllTravelersConfirmedWithDriverWait.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataReservations = [];
      json['data'].forEach((v) {
        dataReservations?.add(DataReservations.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  List<DataReservations>? dataReservations;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (dataReservations != null) {
      map['data'] = dataReservations?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }

}

class Links {
  Links({
      this.url, 
      this.label, 
      this.active,});

  Links.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  dynamic url;
  String? label;
  bool? active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }

}

class DataReservations {
  DataReservations({
      this.id, 
      this.carId, 
      this.clientId, 
      this.jurneyNum, 
      this.operationNumReservation, 
      this.confirmed, 
      this.status, 
      this.travel, 
      this.createdAt, 
      this.updatedAt, 
      this.car, 
      this.client,});

  DataReservations.fromJson(dynamic json) {
    id = json['id'];
    carId = json['car_id'];
    clientId = json['client_id'];
    jurneyNum = json['jurney_num'];
    operationNumReservation = json['operation_num_reservation'];
    confirmed = json['confirmed'];
    status = json['status'];
    travel = json['travel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
  }
  int? id;
  String? carId;
  String? clientId;
  String? jurneyNum;
  String? operationNumReservation;
  String? confirmed;
  String? status;
  String? travel;
  String? createdAt;
  String? updatedAt;
  Car? car;
  Client? client;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['car_id'] = carId;
    map['client_id'] = clientId;
    map['jurney_num'] = jurneyNum;
    map['operation_num_reservation'] = operationNumReservation;
    map['confirmed'] = confirmed;
    map['status'] = status;
    map['travel'] = travel;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (car != null) {
      map['car'] = car?.toJson();
    }
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