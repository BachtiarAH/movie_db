
import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_db/mode/popular_movie.dart';

class ApiProvider { 
  //api key dari browser
  String apiKey = '6fd77c5ba4385bd571dda4eb8665224a'; 
  String baseUrl = 'https://api.themoviedb.org/3/movie/'; 

  Client client = Client();
   
Future<PopularMovie> getPopularMovies() async { 
  // String url = 1$baseUrl/movie/popular?api_key4apiKey'; // print(url); 
  Response response = 
    await client.get(Uri.parse('$baseUrl?api_key=$apiKey&language=en-US&page=1')); 
    if (response.statusCode == 200) {
      return PopularMovie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
}}