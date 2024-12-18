import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;

import 'package:menu_navegacion_principal/models/popular_serie_response.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {

  late Future<PopularSerieResponse> popularSerieResponse;

  @override
  void initState() {
    super.initState();
    popularSerieResponse = getPopularSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 0, 68),

        child: FutureBuilder<PopularSerieResponse>(
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
        ),
      ),

    );
  }

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
                          child: Image.network("https://image.tmdb.org/t/p/original/${popularSerieResponse.listaSeries![index].posterPath}",
                            height: 100,
                          fit: BoxFit.cover),
                        ),  
                      title: Text("${popularSerieResponse.listaSeries![index].name}", 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle:
                       LayoutBuilder(builder: (context, constraints){
                        if(popularSerieResponse.listaSeries![index].overview == ""){
                          return const Text("Sinopsis no disponible.\n\n");
                        }else{
                          return Text("${popularSerieResponse.listaSeries![index].overview}", 
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          );
                        }
                       }
                      ) 
                       
                    )
                  ],
                ),
              )
            );
          
    });
  }

}