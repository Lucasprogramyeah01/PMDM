import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:menu_navegacion_principal/models/popular_actor_response.dart';

import 'package:menu_navegacion_principal/models/popular_movie_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<HomeScreen> {

  late Future<PopularMovieResponse> popularMoviesResponse;

  late Future<PopularActorResponse> popularActorResponse;

  @override
  void initState() {
    super.initState();
    popularMoviesResponse = getPopularMovies();
    popularActorResponse = getPopularActors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: double.infinity,
       color: const Color.fromARGB(255, 255, 0, 68),

       child: Column(

        children: [

          const Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Text ("PELÍCULAS POPULARES", 
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
             )
            ),
          ),

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
                  return _buildPopularMoviesList(snapshot.data!);
              }else{
                return const Center(child: Text('No hay datos disponibles.'));
              }
            },
          ),

          const Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Text ("ACTORES POPULARES", 
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
             )
            ),
          ),

          FutureBuilder<PopularActorResponse>(
            future: popularActorResponse,
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
                  return  _buildPopularActorList(snapshot.data!);
              }else{
                return const Center(child: Text('No hay datos disponibles.'));
              }
            },
          ),
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
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
          itemCount: popularMovieResponse.listaPeliculas!.length,
          itemBuilder: (context, index) {
            return
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 5, bottom: 10),

              child: Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 135, 163),
                        width: 4,  
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network('https://image.tmdb.org/t/p/original/${popularMovieResponse.listaPeliculas![index].posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text("${popularMovieResponse.listaPeliculas![index].title}", 
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  )
                ],
              ),
            );
      }),
    );
  }

  //ACTORES -------------------------------------------------------------------------------------------------------------------------

  Future<PopularActorResponse> getPopularActors() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/person/popular?api_key=b6ade0c27d4b7a194ea46c549cba40e5'));

    if (response.statusCode == 200) {
      return PopularActorResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
  }else{
      throw Exception('Fallo al cargar actores.');
    }
  }

  Widget _buildPopularActorList(PopularActorResponse popularActorResponse) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
          itemCount: popularActorResponse.listaActores!.length,
          itemBuilder: (context, index) {
            return
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 5, bottom: 10),

              child: Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 135, 163),
                        width: 4,  
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network('https://image.tmdb.org/t/p/original/${popularActorResponse.listaActores![index].profilePath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              
                  Container(
                    width: 200,
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text("${popularActorResponse.listaActores![index].name}", 
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  )
                ],
              ),
            );
      }),
    );
  }

}