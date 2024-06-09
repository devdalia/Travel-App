class ResponseModel {
  ResponseModel({
      this.status, 
      this.code, 
      this.message, 
      this.data,});

  ResponseModel.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
  bool? status;
  int? code;
  String? message;
  String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}