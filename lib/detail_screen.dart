import 'package:flutter/material.dart';
import 'package:imdbcloning/model/data_film.dart';

class DetailScreen extends StatelessWidget {
  final DataFilm film;

  const DetailScreen({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back
          ),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          film.Title
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert
            ),
            tooltip: 'More',
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        film.Title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(film.Year),
                          const SizedBox(width: 10),
                          Text(film.Rated),
                          const SizedBox(width: 10),
                          Text(film.Runtime)
                        ],
                      )
                    ],
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 250,
                        child: Image.asset(film.Poster)
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 36,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: film.Genre.map((genre) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(color: Color(0xFF000000)),
                                      left: BorderSide(color: Color(0xFF000000)),
                                      right: BorderSide(color: Color(0xFF000000)),
                                      bottom: BorderSide(color: Color(0xFF000000)),
                                    ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(3.0)
                                      )
                                  ),
                                  child: Center(child: Text(genre)),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(film.Plot)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: const WatchlistButton()
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Icon(
                            Icons.star
                        ),
                        const SizedBox(height: 8.0),
                        Text(film.imdbRating),
                        const SizedBox(height: 8.0),
                        Text(film.imdbVotes)
                      ],
                    ),
                    const Column(
                      children: <Widget>[
                        Icon(
                            Icons.star_border
                        ),
                        SizedBox(height: 8.0),
                        Text(
                            'Rate this'
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        const Icon(
                            Icons.score
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                            film.Metascore
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                            '52 critics'
                        )
                      ],
                    )
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Photos',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: film.imageUrls.length,
                          itemBuilder: (BuildContext context, int index) {
                            final imageFilm = film.imageUrls[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                child: Image(
                                    image: AssetImage(imageFilm)
                                ),
                              ),
                            );
                          })
                        ),
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class WatchlistButton extends StatefulWidget {
  const WatchlistButton({Key? key}) : super(key: key);

  @override
  State<WatchlistButton> createState() => _WatchlistButtonState();
}

class _WatchlistButtonState extends State<WatchlistButton> {
  bool isWatchlist = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          setState(() {
            isWatchlist = !isWatchlist;
          });
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            )
        ),
        icon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            isWatchlist ? Icons.add : Icons.done,
            size: 40.0,
          ),
        ),
        label: const Column(
          children: <Widget>[
            Text('Add to Watchlist'),
            SizedBox(height: 8.0),
            Text('Added by 38.6K users')
          ],
        )
    );
  }
}
