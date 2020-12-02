import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginHelper extends Model {
  GoogleSignIn googleSingin = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  Map<String, dynamic> userData = Map();
  bool isLoading = false;
  String _erroMSG = "";

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    _loadCurrentUser();
  }

  String getErroMSG() {
    return this._erroMSG;
  }

  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSucess,
      @required VoidCallback onFail}) {
    this._erroMSG = "";
    _loadIn(true);
    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((newUser) async {
      this.user = newUser.user;
      await _saveUserData(userData);
      onSucess();
      _loadIn(false);
    }).catchError((erro) {
      this._erroMSG = erro.message;
      onFail();
      _loadIn(false);
    });
  }

  void signOut() async {
    if (this.googleSingin.currentUser != null) {
      this._signOutGoogle();
    } else {
      await this._auth.signOut();
    }
    _singOutUser();
  }

  void _singOutUser() {
    this.userData = Map();
    this.user = null;
    notifyListeners();
  }

  void signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSucess,
      @required VoidCallback onFail}) async {
    _loadIn(true);
    this
        ._auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((currentUser) async {
      this.user = currentUser.user;
      await _loadCurrentUser();
      onSucess();
    }).catchError((erro) {
      onFail();
    });
    _loadIn(false);
  }

  void recoverPass(String email) {
    this._auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return this.user != null;
  }

  void _loadIn(bool state) {
    this.isLoading = state;
    notifyListeners();
  }

  signInWithGoogle(
      {@required VoidCallback onSucess, @required VoidCallback onFail}) async {
    if (await this._auth.currentUser() == null) {
      await this.googleSingin.signIn().whenComplete(() async {
        GoogleSignInAuthentication credentials =
            await this.googleSingin.currentUser.authentication;
        AuthCredential authCredential = GoogleAuthProvider.getCredential(
            idToken: credentials.idToken, accessToken: credentials.accessToken);
        await this
            ._auth
            .signInWithCredential(authCredential)
            .then((googleUser) {
          this.user = googleUser.user;
          this.userData["name"] = this.googleSingin.currentUser.displayName;
          notifyListeners();
          onSucess();
        }).catchError((erro) {
          onFail();
        });
      });
    } else {
      this.userData["name"] = this.googleSingin.currentUser.displayName;
    }
  }

  void _signOutGoogle() async {
    await this.googleSingin.signOut();
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection("login")
        .document(this.user.uid)
        .setData(this.userData);
  }

  Future<Null> _loadCurrentUser() async {
    if (this.user == null) {
      this.user = await this._auth.currentUser();
    }
    if (this.user != null) {
      if (userData["name"] == null) {
        DocumentSnapshot docUser = await Firestore.instance
            .collection("login")
            .document(this.user.uid)
            .get();
        this.userData = docUser.data;
      }
    }
    notifyListeners();
  }
}
