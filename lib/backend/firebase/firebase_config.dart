import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCQAPLCK06mnZta1gF3SC5OiPzZNy-7E0g",
            authDomain: "production-d2b97.firebaseapp.com",
            projectId: "production-d2b97",
            storageBucket: "production-d2b97.firebasestorage.app",
            messagingSenderId: "181866182683",
            appId: "1:181866182683:web:7af81b0d41341c964f60be",
            measurementId: "G-N1Y5D1B7F4"));
  } else {
    await Firebase.initializeApp();
  }
}
