class LoginResponse {
  CustomerDetail? customerDetail;
  bool? status;
  String? message;

  LoginResponse({this.customerDetail, this.status, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    customerDetail = json['customerDetail'] != null
        ? new CustomerDetail.fromJson(json['customerDetail'])
        : null;
    status = json['status'];
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerDetail != null) {
      data['customerDetail'] = this.customerDetail!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class CustomerDetail {
  int? id;
  String? username;
  String? password;
  Null? rememberToken;
  int? activeStatus;
  int? isSuperAdmin;
  int? changedPassword;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  LatestAdminUserInfo? latestAdminUserInfo;

  CustomerDetail(
      {this.id,
        this.username,
        this.password,
        this.rememberToken,
        this.activeStatus,
        this.isSuperAdmin,
        this.changedPassword,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.latestAdminUserInfo});

  CustomerDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    rememberToken = json['remember_token'];
    activeStatus = json['active_status'];
    isSuperAdmin = json['is_super_admin'];
    changedPassword = json['changed_password'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    latestAdminUserInfo = json['latest_admin_user_info'] != null
        ? new LatestAdminUserInfo.fromJson(json['latest_admin_user_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['active_status'] = this.activeStatus;
    data['is_super_admin'] = this.isSuperAdmin;
    data['changed_password'] = this.changedPassword;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.latestAdminUserInfo != null) {
      data['latest_admin_user_info'] = this.latestAdminUserInfo!.toJson();
    }
    return data;
  }
}

class LatestAdminUserInfo {
  int? id;
  int? adminUserId;
  Null? supervisorUsersInfoId;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;
  Null? profileImage;
  Null? digitalSignature;
  Null? userCreatedByUsersInfoId;
  Null? userUpdatedByUsersInfoId;
  Null? userDeletedByUsersInfoId;
  Null? deletedAt;
  String? createdAt;
  Null? updatedAt;

  LatestAdminUserInfo(
      {this.id,
        this.adminUserId,
        this.supervisorUsersInfoId,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.address,
        this.profileImage,
        this.digitalSignature,
        this.userCreatedByUsersInfoId,
        this.userUpdatedByUsersInfoId,
        this.userDeletedByUsersInfoId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  LatestAdminUserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminUserId = json['admin_user_id'];
    supervisorUsersInfoId = json['supervisor_users_info_id'];
    fullName = json['full_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    profileImage = json['profile_image'];
    digitalSignature = json['digital_signature'];
    userCreatedByUsersInfoId = json['user_created_by_users_info_id'];
    userUpdatedByUsersInfoId = json['user_updated_by_users_info_id'];
    userDeletedByUsersInfoId = json['user_deleted_by_users_info_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_user_id'] = this.adminUserId;
    data['supervisor_users_info_id'] = this.supervisorUsersInfoId;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['profile_image'] = this.profileImage;
    data['digital_signature'] = this.digitalSignature;
    data['user_created_by_users_info_id'] = this.userCreatedByUsersInfoId;
    data['user_updated_by_users_info_id'] = this.userUpdatedByUsersInfoId;
    data['user_deleted_by_users_info_id'] = this.userDeletedByUsersInfoId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
