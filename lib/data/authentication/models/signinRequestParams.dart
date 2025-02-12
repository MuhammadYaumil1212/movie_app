class SigninrequestParams {
  final String email;
  final String password;

  const SigninrequestParams({
    required this.email,
    required this.password,
  });

  SigninrequestParams copyWith({
    String? email,
    String? password,
  }) {
    return SigninrequestParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
