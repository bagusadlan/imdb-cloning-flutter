import 'package:flutter/material.dart';
import 'package:imdbcloning/model/data_film.dart';

class DetailScreen extends StatelessWidget {
  final DataFilm film;

  const DetailScreen({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 800) {
            return DetailMobilePage(film: film);
          } else {
            return DetailWebPage(film: film);
          }
        }
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
            ),
          elevation: 3.0
        ),
        icon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            isWatchlist ? Icons.done : Icons.add,
            size: 40.0,
          ),
        ),
        label: isWatchlist ? const Text('Added to Watchlist') : const Text('Add to Watchlist')
    );
  }
}

class DetailWebPage extends StatelessWidget {
  final DataFilm film;
  final double containerMargin;

  const DetailWebPage({Key? key, required this.film, this.containerMargin = 128.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: containerMargin),
            child: IconButton(
              icon: const Icon(
                  Icons.arrow_back
              ),
              tooltip: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: containerMargin),
            child: Text(
                film.Title
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: containerMargin),
              child: IconButton(
                icon: const Icon(
                    Icons.more_vert
                ),
                tooltip: 'More',
                onPressed: () {},
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 128.0),
          child: SafeArea(
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
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                              height: 300,
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
                                      decoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFF000000)),
                                          borderRadius: const BorderRadius.all(Radius.circular(3.0))
                                      ),
                                      child: Center(child: Text(genre)),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                  film.Plot
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 3.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Photos',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                              height: 250,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: film.imageUrls.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final imageFilm = film.imageUrls[index];

                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0, right: 16.0, bottom: 8.0),
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
                  Card(
                    elevation: 3.0,
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: const Text(
                              'Cast',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Actors',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  film.Actors,
                                  style: const TextStyle(
                                      fontSize: 16.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Director',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  film.Director,
                                  style: const TextStyle(
                                      fontSize: 16.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Writers',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  film.Writer,
                                  style: const TextStyle(
                                      fontSize: 16.0
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3.0,
                    margin: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: const Text(
                              'Awards',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Text(
                            film.Awards,
                            style: const TextStyle(
                                fontSize: 16.0
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 2.0),
                            child: const Text(
                              'Ratings',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: film.Ratings.map((rating) {
                              return Container(
                                margin: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      rating["Source"]!,
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Text(
                                      rating['Value']!,
                                      style: const TextStyle(
                                          fontSize: 16.0
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 3.0,
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Details',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Release Date',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  film.Released,
                                  style: const TextStyle(
                                      fontSize: 16.0
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Country of Origin',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  film.Country,
                                  style: const TextStyle(
                                      fontSize: 16.0
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Language Spoken',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  film.Language,
                                  style: const TextStyle(
                                      fontSize: 16.0
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final DataFilm film;

  const DetailMobilePage({Key? key, required this.film}) : super(key: key);

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
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                            height: 210,
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
                                    decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xFF000000)),
                                        borderRadius: const BorderRadius.all(Radius.circular(3.0))
                                    ),
                                    child: Center(child: Text(genre)),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                                film.Plot
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Photos',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                            height: 250,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: film.imageUrls.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final imageFilm = film.imageUrls[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0, right: 16.0, bottom: 8.0),
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
                Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: const Text(
                            'Cast',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Actors',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                film.Actors,
                                style: const TextStyle(
                                    fontSize: 16.0
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Director',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                film.Director,
                                style: const TextStyle(
                                    fontSize: 16.0
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Writers',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                film.Writer,
                                style: const TextStyle(
                                    fontSize: 16.0
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: const Text(
                            'Awards',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Text(
                          film.Awards,
                          style: const TextStyle(
                              fontSize: 16.0
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 2.0),
                          child: const Text(
                            'Ratings',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: film.Ratings.map((rating) {
                            return Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rating["Source"]!,
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    rating['Value']!,
                                    style: const TextStyle(
                                        fontSize: 16.0
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 3.0,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Details',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Release Date',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                film.Released,
                                style: const TextStyle(
                                    fontSize: 16.0
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Country of Origin',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                film.Country,
                                style: const TextStyle(
                                    fontSize: 16.0
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Language Spoken',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                film.Language,
                                style: const TextStyle(
                                    fontSize: 16.0
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
