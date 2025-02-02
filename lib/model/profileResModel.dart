class ProfileResModel {
  bool? success;
  String? message;
  Data? data;

  ProfileResModel({this.success, this.message, this.data});

  ProfileResModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? contact;
  String? profilePicture;
  String? role;
  String? fcmToken;
  bool? isActive;
  bool? isDelete;
  String? status;
  Validation? validation;

  Data(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.contact,
        this.profilePicture,
        this.role,
        this.fcmToken,
        this.isActive,
        this.isDelete,
        this.status,
        this.validation});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    contact = json['contact'];
    profilePicture = json['profilePicture'];
    role = json['role'];
    fcmToken = json['fcmToken'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    status = json['status'];
    validation = json['validation'] != null
        ? new Validation.fromJson(json['validation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['profilePicture'] = this.profilePicture;
    data['role'] = this.role;
    data['fcmToken'] = this.fcmToken;
    data['isActive'] = this.isActive;
    data['isDelete'] = this.isDelete;
    data['status'] = this.status;
    if (this.validation != null) {
      data['validation'] = this.validation!.toJson();
    }
    return data;
  }
}

class Validation {
  bool? isVerified;

  Validation({this.isVerified});

  Validation.fromJson(Map<String, dynamic> json) {
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isVerified'] = this.isVerified;
    return data;
  }
}
