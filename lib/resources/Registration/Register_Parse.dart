class Register {
  String? error;
  String? message;

  Register({this.error, this.message});

  Register.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}