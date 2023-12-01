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
  InterstitialAd? _interstitialVideoAd;

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

  void _loadInterstitialVideoAd(){
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialVideoAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad){
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad){
              // Navigator.pop(context);
              // ad.dispose();
              getMyScore();
              _interstitialAd = null; // Don't want to show ad again while going back
              _interstitialVideoAd = null;
              _loadInterstitialVideoAd(); // Assigning a new video ad jest incase the user play again
            }
          );
          _interstitialVideoAd = ad;
          print('Interstitial Video Ad Loaded');
        },
        onAdFailedToLoad: (LoadAdError error){
          print('Faild to load an interstitial Video ad : ${error.message}');
          _interstitialVideoAd = null;
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

  void onPlayAgainPressed(){
    if(_interstitialVideoAd != null){
      _interstitialVideoAd?.show();
    }else{
      getMyScore();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _interstitialAd?.dispose();
    _interstitialVideoAd?.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyScore();
    _loadInterstitialAd();
    _loadInterstitialVideoAd();
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
              ),
              const SizedBox(height: 20,),
              ElevatedButton.icon(
                onPressed: (){
                  onPlayAgainPressed();
                },
                icon: const Icon(Icons.video_call),
                label: const Text('Play Again'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
