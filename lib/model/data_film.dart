class DataFilm {
  String Title;
  String Year;
  String Rated;
  String Released;
  String Runtime;
  List<String> Genre;
  String Director;
  String Writer;
  String Actors;
  String Plot;
  String Language;
  String Country;
  String Awards;
  String Poster;
  List? Ratings;
  String Metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String Type;
  String DVD;
  String BoxOffice;
  String Production;
  String Website;
  String Response;
  List<String> imageUrls;

  DataFilm({
    required this.Title,
    required this.Year,
    required this.imageUrls,
    required this.Rated,
    required this.Released,
    required this.Runtime,
    required this.Genre,
    required this.Director,
    required this.Writer,
    required this.Actors,
    required this.Plot,
    required this.Language,
    required this.Country,
    required this.Awards,
    required this.Poster,
    required this.Metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.Type,
    required this.DVD,
    required this.BoxOffice,
    required this.Production,
    required this.Website,
    required this.Response,
  });
}

var filmList = [
  DataFilm(
      Title: 'Atonement',
      Year: '2007',
      Rated: 'R',
      Released: '11 Jan 2008',
      Runtime: '123 min',
      Genre: [
        'Drama',
        'Mystery',
        'Romance'
      ],
      Director: 'Joe Wright',
      Writer: 'Ian McEwan, Christopher Hampton',
      Actors: 'Keira Knightley, James McAvoy, Brenda Blethyn',
      Plot: "Thirteen-year-old fledgling writer Briony Tallis irrevocably changes the course of several lives when she accuses her older sister's lover of a crime he did not commit.",
      Language: 'English, French',
      Country: 'United Kingdom, France, United States',
      Awards: 'Won 1 Oscar. 52 wins & 150 nominations total',
      Poster: 'images/atonement-1.jpg',
      Metascore: '85',
      imdbRating: '7.8',
      imdbVotes: '291,511',
      imdbID: 'tt0783233',
      Type: 'movie',
      DVD: '01 Dec 2015',
      BoxOffice: '50,927,067',
      Production: 'N/A',
      Website: 'N/A',
      Response: 'True',
      imageUrls: [
        'images/atonement-2.jpg',
        'images/atonement-3.jpg',
        'images/atonement-4.jpg',
        'images/atonement-5.jpg',
        'images/atonement-6.jpg',
        'images/atonement-7.jpg',
        'images/atonement-8.jpg',
        'images/atonement-9.jpg',
        'images/atonement-10.jpg',
      ]
  ),
  DataFilm(
      Title: "The Great Dictator",
      Year: "1940",
      Rated: "G",
      Released: "07 Mar 1941",
      Runtime: "125 min",
      Genre: [
        'Comedy',
        'Drama',
        'War'
      ],
      Director: "Charles Chaplin",
      Writer: "Charles Chaplin",
      Actors: "Charles Chaplin, Paulette Goddard, Jack Oakie",
      Plot: "Dictator Adenoid Hynkel tries to expand his empire while a poor Jewish barber tries to avoid persecution from Hynkel's regime.",
      Language: "English, Esperanto, Latin",
      Country: "United States",
      Awards: "Nominated for 5 Oscars. 7 wins & 6 nominations total",
      Poster: "images/the-great-dictator-1.jpg",
      Metascore: "N/A",
      imdbRating: "8.4",
      imdbVotes: "231,652",
      imdbID: "tt0032553",
      Type: "movie",
      DVD: "22 May 2017",
      BoxOffice: "N/A",
      Production: "N/A",
      Website: "N/A",
      Response: "True",
      imageUrls: [
        'images/the-great-dictator-2.jpg',
        'images/the-great-dictator-3.jpg',
        'images/the-great-dictator-4.jpg',
        'images/the-great-dictator-5.jpg',
        'images/the-great-dictator-6.jpg',
        'images/the-great-dictator-7.jpg',
      ]
  ),
  DataFilm(
      Title: "The Shawshank Redemption",
      Year: "1994",
      Rated: "R",
      Released: "14 Oct 1994",
      Runtime: "142 min",
      Genre: [
        'Drama'
      ],
      Director: "Frank Darabont",
      Writer: "Stephen King, Frank Darabont",
      Actors: "Tim Robbins, Morgan Freeman, Bob Gunton",
      Plot: "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.",
      Language: "English",
      Country: "United States",
      Awards: "Nominated for 7 Oscars. 21 wins & 42 nominations total",
      Poster: "images/the-shawshank-redemption-1.jpg",
      Metascore: "82",
      imdbRating: "9.3",
      imdbVotes: "2,802,199",
      imdbID: "tt0111161",
      Type: "movie",
      DVD: "15 Aug 2008",
      BoxOffice: "28,767,189",
      Production: "N/A",
      Website: "N/A",
      Response: "True",
      imageUrls: [
        'images/the-shawshank-redemption-2.jpg',
        'images/the-shawshank-redemption-3.jpg',
        'images/the-shawshank-redemption-4.jpg',
        'images/the-shawshank-redemption-5.jpg',
        'images/the-shawshank-redemption-6.jpg',
        'images/the-shawshank-redemption-7.jpg',
        'images/the-shawshank-redemption-8.jpg',
        'images/the-shawshank-redemption-9.jpg',
        'images/the-shawshank-redemption-10.jpg',
        'images/the-shawshank-redemption-11.jpg',
        'images/the-shawshank-redemption-12.jpg',
        'images/the-shawshank-redemption-13.jpg',
      ]
  )
];