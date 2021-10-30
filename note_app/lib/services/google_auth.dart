import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:notes_app/pages/homepage.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

final FirebaseAuth auth = FirebaseAuth.instance;

CollectionReference users = FirebaseFirestore.instance.collection('users');

void signInWithGoogle(BuildContext context) async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
    );

    final UserCredential authResult = await auth.signInWithCredential(credential);

    final User? user = authResult.user;

    var userData = {
      'name': googleSignInAccount.displayName,
      'provider': 'google',
      'photoUrl': googleSignInAccount.photoUrl,
      'email': googleSignInAccount.email,
    };

    users.doc(user!.uid).get().then((doc) {
      if (doc.exists) {
        // Check if the user exists
        doc.reference.update(userData);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        // Check if the user does not exits
        users.doc(user.uid).set(userData);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });

  } catch (PlatformException) {
    print(PlatformException);
    print("Sign in not successful !");
    // better show an alert here
  }
}