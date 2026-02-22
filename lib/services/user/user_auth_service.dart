import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/models/user.dart';

class UserAuthService {
  final String currentUserbox = "currentUser";
  final String userBox = "users";

  // تحقق من البريد + الباسورد وارجع المستخدم
  Future<User?> getUser({
    required String email,
    required String password,
  }) async {
    try {
      final box = Hive.box(userBox);
      final data = box.get(email);
      if (data != null && data is Map) {
        final user = User.fromMap(Map<String, dynamic>.from(data));
        if (user.password == password) return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // اضف مستخدم جديد
  Future<User?> addUser({
    required String name,
    required String email,
    required String password,
  }) async {
    final user = User(email: email, fullName: name, password: password);
    try {
      await Hive.box(userBox).put(email, user.toMap());
      await Hive.box(currentUserbox).put("currentUser", email);
      return user;
    } catch (e) {
      return null;
    }
  }

  // رجع المستخدم الحالي من Hive
  Future<User?> getCurrentUser() async {
    try {
      final currentEmail =
          Hive.box(currentUserbox).get("currentUser") as String?;
      if (currentEmail == null) return null;

      final data = Hive.box(userBox).get(currentEmail);
      if (data != null && data is Map) {
        return User.fromMap(Map<String, dynamic>.from(data));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // ضع المستخدم الحالي
  Future<void> setCurrentUser(String email) async {
    await Hive.box(currentUserbox).put("currentUser", email);
  }

  // احذف المستخدم الحالي
  Future<void> deleteCurrentUser() async {
    await Hive.box(currentUserbox).delete("currentUser");
  }
}
