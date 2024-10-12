import 'package:flutter/material.dart';
import 'package:my_social_media_app/pages/login_page.dart';
import 'package:my_social_media_app/services/auth/login_or_signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_social_media_app/services/auth_gate.dart';
import 'package:my_social_media_app/services/database/database_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      //database provider
      ChangeNotifierProvider(create: (context) => DatabaseProvider()),
    ],
    child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate(),
    );
  }
}
