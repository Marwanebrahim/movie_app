import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:movie_app/models/user.dart';

class UserAuthService {
  final String userCollection = "users";
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Future<User?> getUser({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = await db
          .collection(userCollection)
          .doc(userCredential.user!.uid)
          .get();
      if (user.exists) {
        return User.fromMap(user.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<User?> addUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = User(
        email: email,
        fullName: name,
        password: password,
        createdTime: DateTime.now(),
      );
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await db
          .collection(userCollection)
          .doc(userCredential.user!.uid)
          .set(user.toMap());
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        final userData = await db
            .collection(userCollection)
            .doc(user.uid)
            .get();
        if (userData.exists) {
          return User.fromMap(userData.data() as Map<String, dynamic>);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteCurrentUser() async {
    await auth.signOut();
  }
}
