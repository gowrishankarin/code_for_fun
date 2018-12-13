
class CONFIGURATIONS {
  static String _googleAPIKey = '';
  static String _fbCloudStoragePath = 'https://us-central1-flutter-products-gs.cloudfunctions.net/storeImage';
  
  static String get googleAPIKey {
    return _googleAPIKey;
  }

  static String get fbCloudStoragePath {
    return _fbCloudStoragePath;
  }
}

//Project Console: https://console.firebase.google.com/project/flutter-products-gs/overview