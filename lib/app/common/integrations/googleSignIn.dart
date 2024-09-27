import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final googleSignIn = GoogleSignIn(
    clientId:
        "859373862785-s50u0lv526f2886hh35nq4id1lmh3290.apps.googleusercontent.com",
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  static Future<GoogleSignInAccount?> Login() => googleSignIn.signIn();
  static Future<GoogleSignInAccount?> SignOut() => googleSignIn.signOut();
}
