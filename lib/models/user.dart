class User {
  final String email;
  final String fullName;
  final String password;
  User({required this.email, required this.fullName, required this.password});
  Map<String, dynamic> toMap() {
    return {'email': email, 'fullName': fullName, 'password': password};
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      fullName: json['fullName'],
      password: json['password'],
    );
  }
}
