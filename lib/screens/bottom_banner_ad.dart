import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BottomBannerAdScreen extends StatefulWidget {
  const BottomBannerAdScreen({super.key});

  @override
  State<BottomBannerAdScreen> createState() => _BottomBannerAdScreenState();
}

class _BottomBannerAdScreenState extends State<BottomBannerAdScreen> {
  late BannerAd bottomBannerAd;
  bool isBannerAdLoded = false;

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
    );
  }
}
