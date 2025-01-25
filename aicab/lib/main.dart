import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';



import '/screen/DashBoardScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AICab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      navigatorKey: navigatorKey,

      scrollBehavior: SBehavior(),

      home: const DashBoardScreen(),
    );
  }
}

