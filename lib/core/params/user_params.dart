class UserParamsLogin {
  final String email;
  final String password;

  UserParamsLogin({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
