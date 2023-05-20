
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mindease/login.dart';
import '../homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override

  void initState() {
    super.initState();
    init();
  }

  Widget build(BuildContext context) {
    TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    TextEditingController confirmpassword=TextEditingController();
    String text=' ';
    return Scaffold(
       backgroundColor :Color.fromARGB(255, 255, 255, 255),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGN UP',
              style: GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontSize: 32,color: Colors.black),
              ),
              SizedBox(height: 42,),
              LoginForm(text: "Email",textEditingController: email,value: false,),
              SizedBox(height: 42,),
              LoginForm(text: "Password",textEditingController: password,value: true,),
              SizedBox(height: 42,),
              LoginForm(text: "Confirm Password",textEditingController: confirmpassword,value: true,),
                SizedBox(height: 42,),
              Container(
                height: 50 ,
                width:90 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black,
                  ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                    onPressed: () async{
                      if(confirmpassword.text!=password.text){
                        final snackBar = SnackBar(
            content: const Text('Password does not match. Re-enter.',style: TextStyle(color: Colors.red,fontSize: 20),),
            backgroundColor: Colors.white,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                      //signup(email.text, password.text);
                      try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.text,
    password: password.text,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    //print('The password provided is too weak.');
    text='The password provided is too weak.';
  } else if (e.code == 'email-already-in-use') {
    //print('The account already exists for that email.');
    text='The account already exists for that email.';
  }
} catch (e) {
  print(e);
}
final snackBar = SnackBar(
            content: Text(text ,style: TextStyle(color: Colors.red,fontSize: 20),),
            backgroundColor: Colors.white,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  child: Text('SIGN UP',
                  style: GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600,color: Colors.white),),
                )
              ),
          ],
        ),
      ),
    );
  }


}

Future<void> init() async {
  await Firebase.initializeApp();

  Future.delayed(const Duration(milliseconds: 3*1000));(){
    registerforauthStatechanges();
  };
}

void registerforauthStatechanges() {
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

Future<void> signup(String email, String password) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key, required this.text, required this.textEditingController, required this.value,
  });
final String text;
final TextEditingController textEditingController;
final bool value;
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Container(
      height: 50,
      width:width/1.5,
      child: TextFormField(
        obscureText: value,
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,),
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
        ),
      ),
    );
  }
}

