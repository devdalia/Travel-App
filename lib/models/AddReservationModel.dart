class AddReservationModel {
  AddReservationModel({
      this.code, 
      this.status, 
      this.message,});

  AddReservationModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  int? code;
  bool? status;
  Message? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (message != null) {
      map['message'] = message?.toJson();
    }
    return map;
  }

}

class Message {
  Message({
      this.original, 
      this.exception,});

  Message.fromJson(dynamic json) {
    original = json['original'] != null ? Original.fromJson(json['original']) : null;
    exception = json['exception'];
  }
  Original? original;
  dynamic exception;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (original != null) {
      map['original'] = original?.toJson();
    }
    map['exception'] = exception;
    return map;
  }

}

class Original {
  Original({
      this.code, 
      this.status, 
      this.message, 
      this.data,});

  Original.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    message = json['message'] != null ? json['message'].cast<String>() : [];
    data = json['data'];
  }
  int? code;
  bool? status;
  List<String>? message;
  dynamic data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}