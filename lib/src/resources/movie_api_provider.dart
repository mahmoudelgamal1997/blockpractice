import 'dart:async';
import 'package:blockpractice/src/model/ItemModel.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '66575115dec5f4cb026c527ef6750e9d';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client
        .get("https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


}