
class Roles {
  Roles({
    this.id,
    this.name,
    this.locale,
    this.displayName,
    this.description,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.pivot,});

  Roles.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    locale = json['locale'];
    displayName = json['display_name'];
    description = json['description'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int? id;
  String? name;
  String? locale;
  String? displayName;
  String? description;
  String? status;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['locale'] = locale;
    map['display_name'] = displayName;
    map['description'] = description;
    map['status'] = status;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

class Pivot {
  Pivot({
    this.userId,
    this.roleId,});

  Pivot.fromJson(dynamic json) {
    userId = json['user_id'];
    roleId = json['role_id'];
  }
  String? userId;
  String? roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['role_id'] = roleId;
    return map;
  }

}