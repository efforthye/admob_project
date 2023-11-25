import 'package:admob_project/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BottomBannerAdScreen extends StatefulWidget {
  const BottomBannerAdScreen({super.key});

  @override
  State<BottomBannerAdScreen> createState() => _BottomBannerAdScreenState();
}

class _BottomBannerAdScreenState extends State<BottomBannerAdScreen> {
  late BannerAd bottomBannerAd;
  bool isBannerAdLoaded = false;

  Future loadBannerAd() async {
    // 배너 설정
    bottomBannerAd = BannerAd(
      size: AdSize.banner, // 배너 사이즈
      adUnitId: AdHelper.bannerAdUnitId, // 테스트 배너 유닛 아이디
      listener: BannerAdListener(
        onAdLoaded: (ad){
          setState(() {
            isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error){
          print('Faild to load banner ad : ${error.message}');
          ad.dispose();
        }
      ),
      request: const AdRequest()
    );
    
    // 배너 광고 로드
    bottomBannerAd.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBannerAd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bottomBannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Ads'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Bottom Banner Ad'),
      ),
      bottomNavigationBar: isBannerAdLoaded ? SizedBox(
        width: bottomBannerAd.size.width.toDouble(),
        height: bottomBannerAd.size.height.toDouble(),
        child: AdWidget(ad : bottomBannerAd)
      ) : const LinearProgressIndicator()
    );

  }
}
