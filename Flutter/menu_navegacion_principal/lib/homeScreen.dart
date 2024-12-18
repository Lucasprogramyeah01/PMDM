import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:menu_navegacion_principal/models/popular_movie_response.dart';
import 'package:menu_navegacion_principal/models/popular_serie_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<HomeScreen> {

  late Future<PopularMovieResponse> popularMoviesResponse;

  late Future<PopularSerieResponse> popularSerieResponse;

  @override
  void initState() {
    super.initState();
    popularMoviesResponse = getPopularMovies();
    popularSerieResponse = getPopularSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: double.infinity,
       color: const Color.fromARGB(255, 255, 0, 68),

       child: Column(

        children: [
          FutureBuilder<PopularMovieResponse>(
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
                  return  _buildPopularMoviesList(snapshot.data!);
              }else{
                return const Center(child: Text('No hay datos disponibles.'));
              }
            },
          ),

          /*FutureBuilder<PopularSerieResponse>(
            future: popularSerieResponse,
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
                  return  _buildPopularSeriesList(snapshot.data!);
              }else{
                return const Center(child: Text('No hay datos disponibles.'));
              }
            },
          ),*/
        ]
      ),
      )

    );
  }

  //PELÍCULAS -------------------------------------------------------------------------------------------------------------------------

  Future<PopularMovieResponse> getPopularMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=b6ade0c27d4b7a194ea46c549cba40e5'));

    if (response.statusCode == 200) {
      return PopularMovieResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
  }else{
      throw Exception('Fallo al cargar películas.');
    }
  }

  Widget _buildPopularMoviesList(PopularMovieResponse popularMovieResponse) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
        itemCount: popularMovieResponse.listaPeliculas!.length,
        itemBuilder: (context, index) {
          return const Text("Hola");
    });
  }

  //SERIES -------------------------------------------------------------------------------------------------------------------------

  Future<PopularSerieResponse> getPopularSeries() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=b6ade0c27d4b7a194ea46c549cba40e5'));

    if (response.statusCode == 200) {
      return PopularSerieResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
  }else{
      throw Exception('Fallo al cargar series.');
    }
  }

  Widget _buildPopularSeriesList(PopularSerieResponse popularSerieResponse) {
    return ListView.builder(
        itemCount: popularSerieResponse.listaSeries!.length,
        itemBuilder: (context, index) {
          return const Text("Hola");
    });
  }

}