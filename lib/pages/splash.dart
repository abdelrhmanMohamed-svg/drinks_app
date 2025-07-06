import 'package:flutter/material.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          SizedBox(height: 20),
          Center(child: Image.asset("assets/logo/McDonald's.png",width: 340)),
          Text("mcdonald's",style: TextStyle(fontSize: 60,color: Colors.black87,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
