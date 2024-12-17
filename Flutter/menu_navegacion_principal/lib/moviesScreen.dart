import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:menu_navegacion_principal/models/popular_movie_response.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MoviesScreen> {

  late Future<PopularMovieResponse> popularMoviesResponse;

  @override
  void initState() {
    super.initState();
    popularMoviesResponse = getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 0, 110, 255),

        child: FutureBuilder<PopularMovieResponse>(
          future: popularMoviesResponse,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (snapshot.hasData) {
                return Container(
                  child: snapshot.data!.listaPeliculas!.map(){
                    //FALTA ESTO POR TOCAR.
                  }
                );
            }else{
              return const Center(child: Text('No data available'));
            }
          },
        ),

        /*child: FutureBuilder<PopularMovieResponse>(
          future: pokemonList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.results!.map((pokemon) {
                  return ListTile(
                    title: Text(pokemon.name!),
                  );
                }).toList(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),*/


      ),

    );
  }

  Future<PopularMovieResponse> getPopularMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=b6ade0c27d4b7a194ea46c549cba40e5'));

    if (response.statusCode == 200) {
      return PopularMovieResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
  }else{
      throw Exception('Failed to load movies');
    }
  }

}