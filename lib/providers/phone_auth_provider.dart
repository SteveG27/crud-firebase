
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthProvider {

  final _auth = FirebaseAuth.instance;
  String _verificationId = '';

  String get verificationId => _verificationId;

  Future<void> phoneAuthentication(String phone) async{
     await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        }, 
        codeSent: (verificationId, resendToken){
          _verificationId = verificationId;
        }, 
        codeAutoRetrievalTimeout:(verificationId){
          _verificationId = verificationId;
        },
        verificationFailed: (e){
          if(e.code == 'invalid-phone-number'){
            // mostrar un alert Dialog(Error, El numero proveido no es valido)
          }else{
            // mostrar un alert Dialog(Error,Something went wrong. Try again  )
          }
        }, 
        );
  }

  // Future<void> verifyOTP(String otp) async{
  //     await _auth.signInWithCredential(PhoneAuthProvider.credential())
  // }
}