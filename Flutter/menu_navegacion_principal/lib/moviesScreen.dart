import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:menu_navegacion_principal/models/popular_movie_response.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

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
        color: const Color.fromARGB(255, 255, 0, 68),

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
                return  _buildPopularMoviesList(snapshot.data!);
            }else{
              return const Center(child: Text('No hay datos disponibles.'));
            }
          },
        ),
      ),

    );
  }

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
        itemCount: popularMovieResponse.listaPeliculas!.length,
        itemBuilder: (context, index) {
          return
            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      minTileHeight: 50,   
                      leading:
                        SizedBox(
                          child: Image.network("https://image.tmdb.org/t/p/original/${popularMovieResponse.listaPeliculas![index].posterPath}",
                            height: 100,
                          fit: BoxFit.cover),
                        ),  
                      title: Text("${popularMovieResponse.listaPeliculas![index].title}", 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text("${popularMovieResponse.listaPeliculas![index].overview}", 
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    )
                  ],
                ),
              )
            );
          
    });
  }

}