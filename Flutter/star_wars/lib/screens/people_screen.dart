import 'package:flutter/material.dart';
import 'package:star_wars/models/people_response/people_response.dart';
import 'package:http/http.dart' as http;

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
        backgroundColor: Colors.black,
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
            if (snapshot.hasData) {
              return _buildPeopleList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
        
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<PeopleResponse> getPeople() async {
    final response = await http
        .get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
  
  Widget _buildPeopleList(PeopleResponse peopleResponse) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),
      
        itemCount: peopleResponse.results!.length,
        itemBuilder: (context, index){
      
          return Container(
            width: 10,
            height: 300,
            color: Colors.red,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Image.network('https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg', width: 10, height: 200)
          );
                
              /*decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.redAccent
              ),*/
        }
      ),
    );
          /*return Text(peopleResponse.results![index].name!);*/
  }
}
