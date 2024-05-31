import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/set_wallpaper.dart';

class Wallpaper_widget extends StatefulWidget {
  const Wallpaper_widget({Key? key}) : super(key: key);

  @override
  State<Wallpaper_widget> createState() => _Wallpaper_widgetState();
}

class _Wallpaper_widgetState extends State<Wallpaper_widget> {
  List images = [];
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchapi();
  }

  static final apikey =
      'm4gj7HHIf1CWiAeLHnUCIqqAIQJs5vrdLsraYTnTHDWTb9pk7ht3JoZE';
  fetchapi() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {'Authorization': apikey}).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
        // print(images);
      });
    });
  }

  load_more() async {
    setState(() {
      page += 1;
    });
    String url =
        "https://api.pexels.com/v1/curated?per_page=80&page=" + page.toString();
    await http
        .get(Uri.parse(url), headers: {'Authorization': apikey}).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Set_wallpaper(
                                    imageurl: images[index]['src']['large2x'],
                                  )));
                      // Navigator.pushNamed(context, '/set-wallpaper',
                      //     arguments: images[index]['src']['large2x']);
                    },
                    child: Container(
                      child: CachedNetworkImage(
                          imageUrl: images[index]['src']['tiny'],
                          fit: BoxFit.cover),
                    ),
                  );
                },
                itemCount: images.length),
          )),
          InkWell(
            onTap: () => load_more(),
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                  child: Text("Load more",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
            ),
          )
        ],
      ),
    );
  }
}
