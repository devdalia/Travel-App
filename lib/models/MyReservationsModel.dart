class MyReservationsModel {
  int? code;
  bool? status;
  String? message;
  Data? data;

  MyReservationsModel({this.code, this.status, this.message, this.data});

  MyReservationsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<DataReservations>? dataReservations;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic  nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
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
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      dataReservations = <DataReservations>[];
      json['data'].forEach((v) {
        dataReservations!.add(new DataReservations.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.dataReservations != null) {
      data['data'] = this.dataReservations!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class DataReservations {
  int? id;
  String? userId;
  String? clientId;
  String? pointsCount;
  String? operationNum;
  String? type;
  String? status;
  String? carId;
  String? paid;
  String? createdAt;
  String? updatedAt;
  Client? client;

  DataReservations(
      {this.id,
        this.userId,
        this.clientId,
        this.pointsCount,
        this.operationNum,
        this.type,
        this.status,
        this.carId,
        this.paid,
        this.createdAt,
        this.updatedAt,
        this.client});

  DataReservations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    pointsCount = json['points_count'];
    operationNum = json['operation_num'];
    type = json['type'];
    status = json['status'];
    carId = json['car_id'];
    paid = json['paid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['client_id'] = this.clientId;
    data['points_count'] = this.pointsCount;
    data['operation_num'] = this.operationNum;
    data['type'] = this.type;
    data['status'] = this.status;
    data['car_id'] = this.carId;
    data['paid'] = this.paid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
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
  dynamic birthDate;
  dynamic endDatePassport;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Client(
      {this.id,
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
        this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['personal_id'] = this.personalId;
    data['passport_num'] = this.passportNum;
    data['phone_no'] = this.phoneNo;
    data['car_id'] = this.carId;
    data['loading_car'] = this.loadingCar;
    data['status'] = this.status;
    data['documentation'] = this.documentation;
    data['confirmed'] = this.confirmed;
    data['agreement'] = this.agreement;
    data['birth_date'] = this.birthDate;
    data['end_date_passport'] = this.endDatePassport;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
