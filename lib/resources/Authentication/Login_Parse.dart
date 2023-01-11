class Login {
  String? accessToken;
  int? expiresIn;
  String? tokenType;
  String? refreshToken;
  String? scope;
  String? errorDescription;

  Login(
      {this.accessToken,
      this.expiresIn,
      this.tokenType,
      this.refreshToken,
      this.scope,
      this.errorDescription});

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    accessToken: json['access_token'],
    expiresIn: json['expires_in'],
    tokenType: json['token_type'],
    refreshToken: json['refresh_token'],
    scope: json['scope'],
    errorDescription: json['error_description']
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['error_description'] = this.errorDescription;
    return data;
  }
}

class FailedLogin {
  String? error;
  String? errorDescription;

  FailedLogin({this.error, this.errorDescription});

  factory FailedLogin.fromJson(Map<String, dynamic> json) => FailedLogin(
    error: json['error'],
    errorDescription: json['error_description'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = this.error;
    data['error_description'] = this.errorDescription;
    return data;
  }
}
