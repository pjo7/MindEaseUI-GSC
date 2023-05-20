// ignore_for_file: prefer_const_constructors
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mindease/calling.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('MindEase',
            style: GoogleFonts.poppins(
              fontSize: 32,
              color: Colors.black),
              ),
          ),
          actions: [
            GestureDetector(
              child: Icon(Icons.phone,color: Colors.black,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CallingPage()));
              },
              ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}