
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mindease/homepage.dart';
import 'package:mindease/signup.dart';
//import 'package:bookstore/authentication.dart';

 TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
   
    return Scaffold(
      backgroundColor :Color.fromARGB(255, 255, 255, 255),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIGN IN',
              style: GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontSize: 32,color: Colors.black),
              ),
              SizedBox(height: 42,),
              LoginForm(text: "Email",textEditingController: email,value: false,),
              SizedBox(height: 42,),
              LoginForm(text: "Password",textEditingController: password,value: true,),
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
                  onPressed: () {
                    // Confirm the link is a sign-in with email link.
                    //signin();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                   },
                  child: Text('SIGN IN',
                  style: GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600,color: Colors.white),),
                )
              ),
              SizedBox(height: 42,),
              GestureDetector(
                child: Text("Don't Have an account? Sign Up"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                },
              ),
              SizedBox(height:10),
              Text(
                  "Forgot Password",
                  style: GoogleFonts.poppins(fontStyle: FontStyle.normal,fontSize: 12)
                  ),
          ],
        ),
      ),
    );
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
      height: 50 ,
      width:width/1.5 ,
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