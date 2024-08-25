class SignUpResponse {
  SignUpResponse({
    this.email,
    this.name,
    this.status,
    this.title,
    this.message,
    this.errors
  });

  final String? email;
  final String? name;
  final bool? status;
  final String? title;
  final String? message;
  var errors;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    email: json["email"],
    name: json["name"],
    status: json["status"],
    title: json["title"],
    message: json["message"],
    errors: json["errors"],
  );

}


class Errors {
  Errors({
    this.name,
    this.password,
    this.confirm_password,
    this.email,
    this.mobile_number,
  });

  final List? name;
  final List? password;
  final List? confirm_password;
  final List? email;
  final List? mobile_number;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    name: json["name"] == null ? null : List.from(json["name"].map((x) => x)),
    password: json["password"] == null ? null : List.from(json["password"].map((x) => x)),
    email: json["email"] == null ? null : List.from(json["email"].map((x) => x)),
    confirm_password: json["confirm_password"] == null ? null : List.from(json["confirm_password"].map((x) => x)),
    mobile_number: json["mobile_number"] == null ? null : List.from(json["mobile_number"].map((x) => x)),
  );


}
