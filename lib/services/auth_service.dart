class LogInProfile {
  late String email;
  late String password;

  LogInProfile({required this.email, required this.password});

  factory LogInProfile.fromJson(Map<String, dynamic> json) {
    return LogInProfile(
      email: json['email'],
      password: json['password'],
    );
  }
}

class RegisterProfile {
  late String email;
  late String password;
  late String bussinessName;
  late String bussinessType;

  RegisterProfile(
      {required this.email,
      required this.password,
      required this.bussinessName,
      required this.bussinessType});

  factory RegisterProfile.fromJson(Map<String, dynamic> json) {
    return RegisterProfile(
      email: json['email'],
      password: json['password'],
      bussinessName: json['bussinessName'],
      bussinessType: json['bussinessType'],
    );
  }
}

class AuthService {
  Future<bool> login(LogInProfile logInProfile) async {
    // NOTE:May use in future
    // await Future.delayed(const Duration(seconds: 2));
    // return {
    //   'email': logInProfile.email,
    //   'password': logInProfile.password,};
    return true;
  }
}
