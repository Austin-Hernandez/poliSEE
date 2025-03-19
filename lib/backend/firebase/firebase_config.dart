import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCVPEM7AV3JafkCxGMSkSLI3kpZR0Uu3Zg",
            authDomain: "polisee-7280f.firebaseapp.com",
            projectId: "polisee-7280f",
            storageBucket: "polisee-7280f.firebasestorage.app",
            messagingSenderId: "526831984163",
            appId: "1:526831984163:web:66072ea9be565096795b96"));
  } else {
    await Firebase.initializeApp();
  }
}
