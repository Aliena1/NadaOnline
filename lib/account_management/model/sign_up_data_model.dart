import 'dart:convert';

SignUpDataResponse signUpDataResponseFromJson(String str) => SignUpDataResponse.fromJson(json.decode(str));

String signUpDataResponseToJson(SignUpDataResponse data) => json.encode(data.toJson());

class SignUpDataResponse {
  final List<DepartmentListElement> organizationList;
  final List<DepartmentListElement> designationList;
  final List<DepartmentListElement> departmentList;
  final bool status;
  final String title;
  final String message;

  SignUpDataResponse({
    required this.organizationList,
    required this.designationList,
    required this.departmentList,
    required this.status,
    required this.title,
    required this.message,
  });

  factory SignUpDataResponse.fromJson(Map<String, dynamic> json) => SignUpDataResponse(
    organizationList: List<DepartmentListElement>.from(json["organizationList"].map((x) => DepartmentListElement.fromJson(x))),
    designationList: List<DepartmentListElement>.from(json["designationList"].map((x) => DepartmentListElement.fromJson(x))),
    departmentList: List<DepartmentListElement>.from(json["departmentList"].map((x) => DepartmentListElement.fromJson(x))),
    status: json["status"],
    title: json["title"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "organizationList": List<dynamic>.from(organizationList.map((x) => x.toJson())),
    "designationList": List<dynamic>.from(designationList.map((x) => x.toJson())),
    "departmentList": List<dynamic>.from(departmentList.map((x) => x.toJson())),
    "status": status,
    "title": title,
    "message": message,
  };
}

class DepartmentListElement {
  final int id;
  final String name;
  final int activeStatus;

  DepartmentListElement({
    required this.id,
    required this.name,
    required this.activeStatus,
  });

  factory DepartmentListElement.fromJson(Map<String, dynamic> json) => DepartmentListElement(
    id: json["id"],
    name: json["name"],
    activeStatus: json["active_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "active_status": activeStatus,
  };
}
