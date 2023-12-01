import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId{
    if(Platform.isAndroid){
      // return 'ca-app-pub-3940256099942544/6300978111'; // test
      return 'ca-app-pub-5862202377198959/4719875021'; // real
    }else if(Platform.isIOS){
      return 'ca-app-pub-3940256099942544/2934735716';
    }else{
      throw UnsupportedError('Unsupported Platform');
    }
  }

  static String get interstitialAdUnitId{
    if(Platform.isAndroid){
      return 'ca-app-pub-5862202377198959/8748212389'; // real
    }else if(Platform.isIOS){
      return 'ca-app-pub-3940256099942544/4411468910'; // test : https://developers.google.com/admob/ios/test-ads?hl=ko
    }else{
      throw UnsupportedError('Unsupported Platform');
    }
  }

  static String get interstitialVideoAdUnitId{
    if(Platform.isAndroid){
      // return 'ca-app-pub-3940256099942544/8691691433'; // test : https://developers.google.com/admob/android/test-ads?hl=ko
      return 'ca-app-pub-5862202377198959/8911863913'; // real
    }else if(Platform.isIOS){
      return 'ca-app-pub-3940256099942544/5135589807'; // test : https://developers.google.com/admob/ios/test-ads?hl=ko
    }else{
      throw UnsupportedError('Unsupported Platform');
    }
  }
}