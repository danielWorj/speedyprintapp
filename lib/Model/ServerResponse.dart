class ServerResponse {
  bool? success;
  String? message;

  ServerResponse(this.success, this.message);

  ServerResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['success'] = success;
    data['message'] = message;

    return data;
  }
}
