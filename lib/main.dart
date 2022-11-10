import 'package:flutter/material.dart';
import 'package:movie_db/data/api_profider.dart';
import 'package:movie_db/mode/popular_movie.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiProvider apiProvider = ApiProvider();
  late Future<PopularMovie> PopularMovies;

  String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  void initState(){
    PopularMovies = apiProvider.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
      ),
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("Has Date : ${snapshot.hasData}");
          return ListView.builder(itemBuilder: (context, index) {
            return movies
          },)
        }
      },),
    );
  }

  Widget moviesItem(
    {
      required String poster,
      required String title,
      required String date,
      required String vote_average,
      required Function()? onTap}){
        return InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Card(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Cached,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      }
    }
  )
}