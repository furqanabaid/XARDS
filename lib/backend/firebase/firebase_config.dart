import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD4LWsOJ_R0jXCbjBiZKBWiCBhKCkiOU30",
            authDomain: "xards-a3a19.firebaseapp.com",
            projectId: "xards-a3a19",
            storageBucket: "xards-a3a19.appspot.com",
            messagingSenderId: "460837106008",
            appId: "1:460837106008:web:b9561f31ebc82afe50f52d"));
  } else {
    await Firebase.initializeApp();
  }
}
