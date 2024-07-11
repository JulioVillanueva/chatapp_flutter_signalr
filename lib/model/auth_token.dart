class AuthToken {
  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;

  const AuthToken({
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) => AuthToken(
    tokenType: json['tokenType'],
    accessToken: json['accessToken'],
    expiresIn: json['expiresIn'],
    refreshToken: json['refreshToken'],
  );

  Map<String, dynamic> toJson() => {
    "tokenType": tokenType,
    "accessToken": accessToken,
    "expiresIn": expiresIn,
    "refreshToken": refreshToken,
  };
}