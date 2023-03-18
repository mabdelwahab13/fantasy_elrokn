import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/screens/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<FirebaseApp> _initializeFirebaseApp() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            home: FutureBuilder(
              future: _initializeFirebaseApp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LoginScreen();
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}


// localizationsDelegates: const [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            //   // Add the following line to support Arabic language
            //   // ArabicFontsDelegate(), // Add this line to support Arabic fonts
            // ],
            // supportedLocales: const [
            //   Locale('en'), // English
            //   Locale('ar'), // Arabic
            // ],
            // locale: const Locale('ar', ''), // Set the initial language to Arabic
            // Set the text direction to right-to-left for Arabic RTL
            // textDirection: TextDirection.rtl,
            // Use Google Fonts to load Arabic fonts
            // theme: ThemeData(
            //   textTheme: GoogleFonts.cairoTextTheme(
            //     Theme.of(context).textTheme,
            //   ),
            // ),