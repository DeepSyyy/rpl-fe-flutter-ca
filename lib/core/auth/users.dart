import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Stream<User?> streamAuthStatus() {
  return FirebaseAuth.instance.authStateChanges();
}

User? get user => FirebaseAuth.instance.currentUser;

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

//get role
Future<String> getRole() async {
  final user = FirebaseAuth.instance.currentUser;
  final uid = user!.uid;
  final role = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((value) => value.data()!['role']);
  return role;
}

//get name
Future<String> getName() async {
  final user = FirebaseAuth.instance.currentUser;
  final uid = user!.uid;
  final name = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((value) => value.data()!['name']);
  return name;
}

final futureRole = getRole();
String? getRoleUser() {
  String? role;
  futureRole.then((value) => role = value);

  return role;
}

final futureName = getName();

String? getNameUser() {
  String? name;
  futureName.then((value) => name = value);
  print(name);
  return name;
}

class AuthUserProvider extends ChangeNotifier {
  String? name;
  String? role;
  String? email;
  String? uid;
  String? errorMessage;

  AuthUserProvider({
    this.name,
    this.role,
    this.email,
    this.uid,
    this.errorMessage,
  }) {
    getUser();
  }

  void getUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data());
    if (data != null) {
      name = data['name'];
      role = data['role'];
      email = data['email'];
      this.uid = uid;
      errorMessage = null;
      notifyListeners();
    } else {
      errorMessage = 'Data tidak ditemukan';
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      name = null;
      role = null;
      email = null;
      uid = null;
      errorMessage = null;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String password,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({'name': name, 'email': email, 'password': password});
      getUser();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
