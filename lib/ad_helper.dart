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
}