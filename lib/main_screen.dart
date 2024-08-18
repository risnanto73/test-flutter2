import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pesona_indonesia/detail_screen.dart';
import 'package:pesona_indonesia/model/data_wisata.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textFont = const TextStyle(fontFamily: "Oswald");

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Main Screen',
            style: TextStyle(fontFamily: "Oswald"),
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemBuilder: (Context, index) {
              final TempatWisata tempatWisata = wisataTempatList[index];
              // log('tempatWisata: $tempatWisata', name: 'MainScreen');
              return InkWell(
                onTap: () {
                  print('Card Clicked');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(tempatWisata: tempatWisata),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(tempatWisata.gambar),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(tempatWisata.nama),
                                  Text(tempatWisata.deskripsi),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: wisataTempatList.length,
          ),
        ),
      ),
    );
  }
}
