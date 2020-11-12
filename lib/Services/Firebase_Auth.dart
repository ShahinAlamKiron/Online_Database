import 'package:firebase_auth/firebase_auth.dart';
import 'package:offline_database/Models/Auth_Model.dart';

class AuthServices{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  Future signIn(AuthModel authModel)async{
    try {
     var user= await _firebaseAuth.signInWithEmailAndPassword(email:authModel.email, password: authModel.password);
      return user!=null;
    }on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signUP(AuthModel authModel)async{
    try {
     var authresult= await _firebaseAuth.createUserWithEmailAndPassword(email:authModel.email, password: authModel.password);
      return authresult !=null;
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  Future signOut()async{
    try{
      await _firebaseAuth.signOut();
      return "Sign Out";
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  Future forgetPassword(AuthModel authModel)async{
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: authModel.email);
      return "ForgetPassword";
    }on FirebaseAuthException catch(e){
      return e.message;
    }
  }

}