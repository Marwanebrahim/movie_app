class User {
  final String email;
  final String fullName;
  final String password;
  final DateTime createdTime;
  User({
    required this.email,
    required this.fullName,
    required this.password,
    required this.createdTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'password': password,
      'createdTime': createdTime.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      fullName: json['fullName'],
      password: json['password'],
      createdTime: DateTime.parse(json['createdTime']),
    );
  }
}
