import 'package:flutter/material.dart';

import 'package:imdbcloning/detail_screen.dart';

import 'model/data_film.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const FilmList();
          } else if (constraints.maxWidth <= 1200){
            return const FilmGrid(gridCount: 4);
          } else {
            return const FilmGrid(gridCount: 6, containerMargin: 104.0);
          }
        },
      )
    );
  }
}

class FilmList extends StatelessWidget {
  const FilmList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                        child: Image(
                            image: AssetImage(film.Poster)
                        ),
                      ),
                      const SizedBox(width: 10.0,),
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
    );
  }
}

class FilmGrid extends StatelessWidget {
  final int gridCount;
  final double containerMargin;

  const FilmGrid({Key? key, this.gridCount = 4, this.containerMargin = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: containerMargin),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: filmList.map((film) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(film: film);
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 250,
                          child: Image.asset(
                            film.Poster,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          film.Title,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text(
                          film.Actors,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}