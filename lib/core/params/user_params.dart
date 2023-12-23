class UserParamsLogin {
  final String email;
  final String password;

  UserParamsLogin({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class UserParamsRegister {
  final String name;
  final String email;
  final String password;

  UserParamsRegister(
      {required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
