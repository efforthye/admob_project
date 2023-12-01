import 'dart:math';

import 'package:flutter/material.dart';

class InterstitialAdScreen extends StatefulWidget {
  const InterstitialAdScreen({super.key});

  @override
  State<InterstitialAdScreen> createState() => _InterstitialAdScreenState();
}

class _InterstitialAdScreenState extends State<InterstitialAdScreen> {
  late int score;

  void getMyScore(){
    setState(() {
      score = Random().nextInt(51);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interstition Ad'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check, size: 100,),
            const Text('Quiz Completed', style: TextStyle(
              fontSize: 30,
            ),),
            Text('Score : $score out of 50', style: TextStyle(fontSize: 20),),
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: (){
                
              }, 
              child: const Text('Go back')
            )
          ],
        ),
      ),
    );
  }
}
