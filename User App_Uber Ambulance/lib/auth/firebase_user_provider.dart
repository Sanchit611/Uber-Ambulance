import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class UberHacktagFirebaseUser {
  UberHacktagFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

UberHacktagFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<UberHacktagFirebaseUser> uberHacktagFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<UberHacktagFirebaseUser>(
        (user) => currentUser = UberHacktagFirebaseUser(user));
