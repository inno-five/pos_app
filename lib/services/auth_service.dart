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
