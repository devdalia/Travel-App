class AllDataWalletUserModel {
  AllDataWalletUserModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  AllDataWalletUserModel.fromJson(dynamic json) {
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
    this.totalMyPointsOriginalWallet,
    this.myReservations,
    this.myPayments,
    this.countReservedPoints,
    this.countAllowedRedeemedPoints,
    this.countOfferPoints,
    this.reservationPoints,
    this.redeemedPoints,
    this.lastRequestRedeem,
    this.getAllRedeemRequests,
  });

  Data.fromJson(dynamic json) {
    totalMyPointsOriginalWallet = json['totalMyPointsOriginalWallet'];
    myReservations = json['myReservations'];
    myPayments = json['myPayments'];
    countReservedPoints = json['countReservedPoints'];
    countAllowedRedeemedPoints = json['countAllowedRedeemedPoints'];
    countOfferPoints = json['countOfferPoints'];
    reservationPoints = json['reservationPoints'];
    redeemedPoints = json['redeemedPoints'];
    lastRequestRedeem = json['lastRequestRedeem'] != null
        ? LastRequestRedeem.fromJson(json['lastRequestRedeem'])
        : null;
    if (json['getAllRedeemRequests'] != null) {
      getAllRedeemRequests = [];
      json['getAllRedeemRequests'].forEach((v) {
        getAllRedeemRequests?.add(GetAllRedeemRequests.fromJson(v));
      });
    }
  }

  int? totalMyPointsOriginalWallet;
  dynamic myReservations;
  int? myPayments;
  String? countReservedPoints;
  String? countAllowedRedeemedPoints;
  int? countOfferPoints;
  int? reservationPoints;
  int? redeemedPoints;
  LastRequestRedeem? lastRequestRedeem;
  List<GetAllRedeemRequests>? getAllRedeemRequests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalMyPointsOriginalWallet'] = totalMyPointsOriginalWallet;
    map['myReservations'] = myReservations;
    map['myPayments'] = myPayments;
    map['countReservedPoints'] = countReservedPoints;
    map['countAllowedRedeemedPoints'] = countAllowedRedeemedPoints;
    map['countOfferPoints'] = countOfferPoints;
    map['reservationPoints'] = reservationPoints;
    map['redeemedPoints'] = redeemedPoints;
    if (lastRequestRedeem != null) {
      map['lastRequestRedeem'] = lastRequestRedeem?.toJson();
    }
    if (getAllRedeemRequests != null) {
      map['getAllRedeemRequests'] =
          getAllRedeemRequests?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class GetAllRedeemRequests {
  GetAllRedeemRequests({
    this.id,
    this.operationNum,
    this.userId,
    this.reservationPointsCount,
    this.redeemedPointsCount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  GetAllRedeemRequests.fromJson(dynamic json) {
    id = json['id'];
    operationNum = json['operation_num'];
    userId = json['user_id'];
    reservationPointsCount = json['reservation_points_count'];
    redeemedPointsCount = json['redeemed_points_count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? operationNum;
  String? userId;
  String? reservationPointsCount;
  String? redeemedPointsCount;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['operation_num'] = operationNum;
    map['user_id'] = userId;
    map['reservation_points_count'] = reservationPointsCount;
    map['redeemed_points_count'] = redeemedPointsCount;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class LastRequestRedeem {
  LastRequestRedeem({
    this.id,
    this.operationNum,
    this.userId,
    this.reservationPointsCount,
    this.redeemedPointsCount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  LastRequestRedeem.fromJson(dynamic json) {
    id = json['id'];
    operationNum = json['operation_num'];
    userId = json['user_id'];
    reservationPointsCount = json['reservation_points_count'];
    redeemedPointsCount = json['redeemed_points_count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? operationNum;
  String? userId;
  String? reservationPointsCount;
  String? redeemedPointsCount;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['operation_num'] = operationNum;
    map['user_id'] = userId;
    map['reservation_points_count'] = reservationPointsCount;
    map['redeemed_points_count'] = redeemedPointsCount;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
