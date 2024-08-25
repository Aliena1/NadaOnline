class OtpResponse {
  bool? status;
  String? message;
  String? username;

  OtpResponse({this.status, this.message,this.username});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['username'] = username;
    return data;
  }
}
