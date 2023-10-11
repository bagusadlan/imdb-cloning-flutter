import 'package:flutter/material.dart';

import 'package:imdbcloning/detail_screen.dart';

import 'model/data_film.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final DataFilm film = filmList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(film: film);
              }));
            },
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: Image(
                                image: AssetImage(film.Poster)
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                film.Title,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(film.Year),
                              Text(film.Actors)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: filmList.length,
        )
      );
  }
}