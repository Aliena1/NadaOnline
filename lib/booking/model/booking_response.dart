class BookingResponse {
  String? bookingtype;
  bool? status;
  String? title;
  String? message;

  BookingResponse({this.bookingtype, this.status, this.title, this.message});

  BookingResponse.fromJson(Map<String, dynamic> json) {
    bookingtype = json['bookingtype'];
    status = json['status'];
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingtype'] = this.bookingtype;
    data['status'] = this.status;
    data['title'] = this.title;
    data['message'] = this.message;
    return data;
  }
}
