import 'dart:math';

import 'package:admob_project/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InlineBannerAdScreen extends StatefulWidget {
  const InlineBannerAdScreen({super.key});

  @override
  State<InlineBannerAdScreen> createState() => _InlineBannerAdScreenState();
}

class _InlineBannerAdScreenState extends State<InlineBannerAdScreen> {
  List<dynamic> items = []; // Data which will be shown to user including the Ad
  List<BannerAd> allBannerAds = []; // So that we can dispose it in the end

  SizedBox getBannerAd(){
    BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad){
          print('Banner Ad loaded successfully');
        },
        onAdFailedToLoad: (ad, error){
          print('Failed to load Banner ad : ${error.message}');
          ad.dispose();
        }
      ),
      request: const AdRequest()
    );
    bannerAd.load();
    allBannerAds.add(bannerAd);
    return SizedBox(
      width: bannerAd.size.width.toDouble(),
      height: bannerAd.size.height.toDouble(),
      child: AdWidget(
        ad: bannerAd,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i<20; i++){
      items.add('Item no ${i+1}');
    }

    for(int i=0; i<3; i++){
      int randomAdPosition = Random().nextInt(items.length); // 0 to 19
      SizedBox bannerAd = getBannerAd();
      items.insert(randomAdPosition, bannerAd);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for(int i = 0; i<allBannerAds.length; i++){
      allBannerAds[i].dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inline banner'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          dynamic data = items[index];
          if(data is SizedBox){
            return data;
          }else{
            return ListTile(
              leading: const Icon(Icons.photo),
              title: Text(data.toString()),
            );
          }
        },
      ),
    );
  }
}
