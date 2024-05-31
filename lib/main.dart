import 'package:flutter/material.dart';
// import 'package:wallpaper_app/fulscreen.dart';
import 'package:wallpaper_app/set_wallpaper.dart';
import 'package:wallpaper_app/wallpaper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wallpaper_widget(),
      // Application name
      title: 'Flutter Hello World',
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Wallpaper_widget(),
      //   '/set-wallpaper': (context) => Set_wallpaper(imageurl: ),
      // },
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        brightness: Brightness.light,
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      // home: Wallpaper_widget(),
    );
  }
}
