class RefreshToken {
  final String refreshToken;

  const RefreshToken({
    required this.refreshToken,
  });

  factory RefreshToken.fromJson(Map<String, dynamic> json) => RefreshToken(
    refreshToken: json['refreshToken'],
  );

  Map<String, dynamic> toJson() => {
    "refreshToken": refreshToken,
  };
}
