import 'dart:math';
import 'package:admob_project/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdScreen extends StatefulWidget {
  const InterstitialAdScreen({super.key});

  @override
  State<InterstitialAdScreen> createState() => _InterstitialAdScreenState();
}

class _InterstitialAdScreenState extends State<InterstitialAdScreen> {
  late int score;
  InterstitialAd? _interstitialAd;

  void _loadInterstitialAd(){
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad){
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad){
              Navigator.pop(context);
              ad.dispose();
            }
          );
          _interstitialAd = ad;
          print('Interstitial Ad Loaded');
        },
        onAdFailedToLoad: (LoadAdError error){
          print('Faild to load an interstitial ad : ${error.message}');
          _interstitialAd = null;
        }
      )
    );
  }

  void getMyScore(){
    setState(() {
      score = Random().nextInt(51);
    });
  }

  void onBackPressed(){
    if(_interstitialAd != null){
      _interstitialAd?.show();
    }else{
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _interstitialAd?.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyScore();
    _loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('Back Button Pressed');
        onBackPressed();
        return true;
      },
      child: Scaffold(
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
                  onBackPressed();
                },
                child: const Text('Go back')
              )
            ],
          ),
        ),
      ),
    );
  }
}
