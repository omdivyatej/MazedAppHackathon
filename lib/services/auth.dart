import 'package:firebase_auth/firebase_auth.dart';
import 'package:mazed_health_app/models/user_model.dart';
import 'package:mazed_health_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //Register with email and password
  Future<UserModel?> registerUser(String email,String password) async{
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user= userCredential.user;
      await DatabaseService(uid: user!.uid).profileCreation();
      return user!=null?convertToUserModel(user):null;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Convert registered user to UserModel
  UserModel convertToUserModel(User user){
    return  UserModel(uid: user.uid);
  }
  //Auth changes Stream
  Stream<UserModel?> get authChange{

    return _auth.authStateChanges().map((User? user) => convertToUserModel(user!));
  }
  //Sign out
  Future signOutUser(){
    return _auth.signOut();
  }

  // Sign in with email and password
  Future<UserModel?> signInEmandPw(String email, String password) async{
    try{
      UserCredential userCredential=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user= userCredential.user;
      return convertToUserModel(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}

