import 'package:flutter/material.dart';
import 'package:mindease/homepage.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color:Colors.white,
          child: Column(
            children: [
              Container(
                width: width,
                height: height*9/10,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 210, 248),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
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
          ),
        ),
      ),
    );
  }
}