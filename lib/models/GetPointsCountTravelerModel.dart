class GetPointsCountTravelerModel {
  int? code;
  bool? status;
  String? message;
  Data? data;

  GetPointsCountTravelerModel(
      {this.code, this.status, this.message, this.data});

  GetPointsCountTravelerModel.fromJson(Map<String, dynamic> json) {
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
  String? pointsCountThisTypeReservation;
  int? totalPointsCountReservation;

  Data({this.pointsCountThisTypeReservation, this.totalPointsCountReservation});

  Data.fromJson(Map<String, dynamic> json) {
    pointsCountThisTypeReservation = json['points Count this type Reservation'];
    totalPointsCountReservation = json['total points count reservation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points Count this type Reservation'] =
        this.pointsCountThisTypeReservation;
    data['total points count reservation'] = this.totalPointsCountReservation;
    return data;
  }
}


class NotGetPointsCountTravelerModel {
  int? code;
  bool? status;
  String? message;
  dynamic  data;

  NotGetPointsCountTravelerModel(
      {this.code, this.status, this.message, this.data});

  NotGetPointsCountTravelerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
