import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DriverAppFirebaseUser {
  DriverAppFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

DriverAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DriverAppFirebaseUser> driverAppFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DriverAppFirebaseUser>(
        (user) => currentUser = DriverAppFirebaseUser(user));
