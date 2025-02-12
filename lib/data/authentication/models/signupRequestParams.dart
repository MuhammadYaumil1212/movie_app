class SignupRequestParams {
  final String email;
  final String password;

  const SignupRequestParams({
    required this.email,
    required this.password,
  });

  SignupRequestParams copyWith({
    String? email,
    String? password,
  }) {
    return SignupRequestParams(
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
