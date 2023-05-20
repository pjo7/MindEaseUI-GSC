import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindease/call.dart';
import 'package:mindease/homepage.dart';

class CallingPage extends StatefulWidget {
  const CallingPage({super.key});

  @override
  State<CallingPage> createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                foregroundImage: NetworkImage('https://cdn140.picsart.com/1672f22c-fccf-4252-a27b-9ef7d681110d/407051376014201.jpg?type=webp&to=min&r=150'),
                radius: width/10,
              ),
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Call()));
              },
              child: Text('Calling...',
              style: GoogleFonts.poppins(
                fontSize: 32,
                color: Colors.black),),
            ),
            SizedBox(
              height: height/10,
            ),
            BottomAppBar(
                elevation: 0,
                height: height/10,
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      width: width/3,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        },
                        child: Icon(Icons.phone_disabled_sharp,color: Colors.black,)),
                    ),
                    Container(
                      width: width/3,
                      child: Icon(Icons.speaker_phone,color: Colors.black,),
                    ),
                    Container(
                      width: width/3,
                      child: Icon(Icons.mic_off,color: Colors.black,),
                    )
                    ]
                ),
              )
          ],
        )
      ),
    );
  }
}