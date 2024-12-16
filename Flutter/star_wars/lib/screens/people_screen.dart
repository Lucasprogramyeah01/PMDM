import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:star_wars/models/people_response/people_response.dart';
import 'package:http/http.dart' as http;
import 'package:star_wars/models/people_response/result.dart';
import 'package:star_wars/screens/people_detail_screen.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PeopleScreen> {
  late Future<PeopleResponse> peopleResponse;

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network('https://logodownload.org/wp-content/uploads/2015/12/star-wars-logo-3-1.png', width: 100),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://e0.pxfuel.com/wallpapers/870/330/desktop-wallpaper-star-background-aesthetic-star-wars.jpg'),
            fit: BoxFit.cover
            )
        ),

        child: FutureBuilder<PeopleResponse>(
          future: peopleResponse,
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
              return _buildPeopleList(context, snapshot.data!);
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }

  Future<PeopleResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://www.swapi.tech/api/people'));

    if (response.statusCode == 200) {
      // Decodificar el cuerpo de la respuesta a Map<String, dynamic>
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // Usar el Map decodificado para construir PeopleResponse
      return PeopleResponse.fromMap(responseData);
    } else {
      throw Exception('Failed to load people');
    }
  }

  Widget _buildPeopleList(BuildContext context, PeopleResponse peopleResponse) {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
        childAspectRatio: 20/35,
      ),
      itemCount: peopleResponse.results!.length,
      itemBuilder: (context, index) {
        return _buildPeopleItem(context, peopleResponse.results![index], index);
      });
  }
  
  Widget _buildPeopleItem(BuildContext context, People people, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PeopleDetailScreen(peopleItem: people, indexDetail: index),
          ),
        );
      }, 
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFdba90d),
                width: 4,  
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network('https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            width: 200,
            padding: const EdgeInsets.only(top: 7.0),
            child: Text(people.name!.toUpperCase(), 
            textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            )
          )
        ],
      )
  );
  }
}
