import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class Set_wallpaper extends StatefulWidget {
  final String imageurl;
  const Set_wallpaper({Key? key, required this.imageurl}) : super(key: key);

  @override
  State<Set_wallpaper> createState() => _Set_wallpaperState();
}

class _Set_wallpaperState extends State<Set_wallpaper> {
  Future<void> set_wallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file_path = await DefaultCacheManager().getSingleFile(widget.imageurl);

    // await WallpaperManager.setWallpaperFromFile(file_path.path, location);
    // print(result);
  }

  @override
  Widget build(BuildContext context) {
    // final String imageurl =
    //     ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: Container(
            child: CachedNetworkImage(
                imageUrl: widget.imageurl, fit: BoxFit.cover),
          )),
          InkWell(
            onTap: () {
              set_wallpaper();
              print("set wallpaper called");
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                  child: Text("Set Wallpaper",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            ),
          )
        ],
      )),
    );
  }
}
