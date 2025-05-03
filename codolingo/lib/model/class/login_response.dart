class LoginResponse {
  final String token;
  final int expiresIn;

  LoginResponse({required this.token, required this.expiresIn});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] as String,
      expiresIn: json['expiresIn'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresIn': expiresIn,
    };
  }
}