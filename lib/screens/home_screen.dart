import 'package:admob_project/screens/bottom_banner_ad.dart';
import 'package:admob_project/screens/inline_banner_ad.dart';
import 'package:admob_project/screens/interstitial_ad_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monetize Flutter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const BottomBannerAdScreen()));
              },
              child: const Text('Bottom Banner Ads')
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const InlineBannerAdScreen()));
                },
                child: const Text('Inline Banner Ads')
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const InterstitialAdScreen()));
                },
                child: const Text('Interstitial Ads')
            ),
          ],
        ),
      ),
    );
  }
}
