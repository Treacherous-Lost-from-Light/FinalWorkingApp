import 'package:flutter/material.dart';
import 'package:lucaschatbot/screen/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

 const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Lucas chatbot',
    home: SplashScreen(),
  ); //MaterialApp
 } //Widget build
} //MyApp class