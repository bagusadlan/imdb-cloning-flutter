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
  List<Map<String, String>> Ratings;
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
    required this.Ratings,
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
      Ratings: [
      {
        "Source": "Internet Movie Database",
        "Value": "7.8/10"
      },
      {
        "Source": "Rotten Tomatoes",
        "Value": "83%"
      },
      {
        "Source": "Metacritic",
        "Value": "85/100"
      }
      ],
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
      Ratings: [
        {
          "Source": "Internet Movie Database",
          "Value": "8.4/10"
        },
        {
          "Source": "Rotten Tomatoes",
          "Value": "92%"
        }
      ],
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
      Ratings: [
        {
          "Source": "Internet Movie Database",
          "Value": "9.3/10"
        },
        {
          "Source": "Rotten Tomatoes",
          "Value": "91%"
        },
        {
          "Source": "Metacritic",
          "Value": "82/100"
        }
      ],
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
  ),
  DataFilm(
      Title: "What's Eating Gilbert Grape",
      Year: '1993',
      Rated: 'PG-13',
      Released: '04 Mar 1994',
      Runtime: '118 min',
      Genre: [
        'Drama'
      ],
      Director: 'Lasse Hallström',
      Writer: 'Peter Hedges',
      Actors: 'Johnny Depp, Leonardo DiCaprio, Juliette Lewis',
      Plot: 'A young man in a small Midwestern town struggles to care for his mentally-disabled younger brother and morbidly obese mother while attempting to pursue his own happiness.',
      Language: 'English',
      Country: 'United States',
      Awards: 'Nominated for 1 Oscar. 8 wins & 7 nominations total',
      Poster: 'images/whats-eating-gilbert-grape-1.jpg',
      Ratings: [
        {
          "Source": "Internet Movie Database",
          "Value": "7.7/10"
        },
        {
          "Source": "Rotten Tomatoes",
          "Value": "90%"
        },
        {
          "Source": "Metacritic",
          "Value": "73/100"
        }
      ],
      Metascore: '73',
      imdbRating: '7.7',
      imdbVotes: '247,715',
      imdbID: 'tt0108550',
      Type: 'movie',
      DVD: '01 Aug 2013',
      BoxOffice: '10,032,765',
      Production: 'N/A',
      Website: 'N/A',
      Response: 'True',
      imageUrls: [
        'images/whats-eating-gilbert-grape-1.jpg',
        'images/whats-eating-gilbert-grape-2.jpg',
        'images/whats-eating-gilbert-grape-3.jpg',
        'images/whats-eating-gilbert-grape-4.jpg',
        'images/whats-eating-gilbert-grape-5.jpg',
        'images/whats-eating-gilbert-grape-6.jpg',
        'images/whats-eating-gilbert-grape-7.jpg',
        'images/whats-eating-gilbert-grape-8.jpg',
        'images/whats-eating-gilbert-grape-9.jpg',
        'images/whats-eating-gilbert-grape-10.jpg',
        'images/whats-eating-gilbert-grape-11.jpg',
      ]
  ),
  DataFilm(
      Title: "Good Will Hunting",
      Year: "1997",
      Rated: "R",
      Released: "09 Jan 1998",
      Runtime: "126 min",
      Genre: [
        "Drama",
        "Romance"
      ],
      Director: "Gus Van Sant",
      Writer: "Matt Damon, Ben Affleck",
      Actors: "Robin Williams, Matt Damon, Ben Affleck",
      Plot: "Will Hunting, a janitor at M.I.T., has a gift for mathematics, but needs help from a psychologist to find direction in his life.",
      Language: "English",
      Country: "United States",
      Awards: "Won 2 Oscars. 24 wins & 61 nominations total",
      Poster: "images/good-will-hunting-1.jpg",
      Ratings: [
        {
          "Source": "Internet Movie Database",
          "Value": "8.3/10"
        },
        {
          "Source": "Rotten Tomatoes",
          "Value": "97%"
        },
        {
          "Source": "Metacritic",
          "Value": "70/100"
        }
      ],
      Metascore: "70",
      imdbRating: "8.3",
      imdbVotes: "1,024,873",
      imdbID: "tt0119217",
      Type: "movie",
      DVD: "14 Apr 2016",
      BoxOffice: "138,433,435",
      Production: "N/A",
      Website: "N/A",
      Response: "True",
      imageUrls: [
        'images/good-will-hunting-1.jpg'
      ]
  )
];