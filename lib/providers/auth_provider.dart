import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_tut/models/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StreamProvider.autoDispose<AppUser?>((ref) async* {

  final Stream<AppUser?> userStream = FirebaseAuth.instance.authStateChanges().map((user){
    if(user != null){
      return AppUser(
        email: user.email!,
        uid: user.uid
      );
    }
    return null;
  });

  await for (final user in userStream){
    yield user;
  }
});