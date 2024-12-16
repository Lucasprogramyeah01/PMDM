import 'package:flutter/material.dart';
import 'package:star_wars/models/people_response/result.dart';

class PeopleDetailScreen extends StatefulWidget {
  final People peopleItem;
  final int indexDetail;
  const PeopleDetailScreen({super.key, required this.peopleItem, required this.indexDetail});

  @override
  State<PeopleDetailScreen> createState() => _PeopleDetailScreenState();
}

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFFdba90d),
        ),
        title: Text(widget.peopleItem.name!.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFFdba90d),
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0)
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://e0.pxfuel.com/wallpapers/870/330/desktop-wallpaper-star-background-aesthetic-star-wars.jpg'),
            fit: BoxFit.cover
            )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [

            Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4.0,
                  color: const Color(0xFFdba90d),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://starwars-visualguide.com/assets/img/characters/${widget.indexDetail + 1}.jpg',
                  width: 310,
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 25.0, right: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(text: "Fecha de Nacimiento: ",
                      style: const TextStyle(
                        color: Color(0xFFdba90d),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children:[
                        TextSpan(text: widget.peopleItem.birthYear,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal
                          )
                        ),
                      ] 
                    )
                  ),

                  const SizedBox(height: 8),

                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(text: "Altura: ",
                      style: const TextStyle(
                        color: Color(0xFFdba90d),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children:[
                        TextSpan(text: "${widget.peopleItem.height} cm",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal
                          )
                        ),
                      ] 
                    )
                  ),

                  const SizedBox(height: 8),

                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(text: "Peso: ",
                      style: const TextStyle(
                        color: Color(0xFFdba90d),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children:[
                        TextSpan(text: "${widget.peopleItem.mass} Kg" ,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal
                          )
                        ),
                      ] 
                    )
                  ),             

                  const SizedBox(height: 8),

                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(text: "Género: ",
                      style: const TextStyle(
                        color: Color(0xFFdba90d),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children:[
                        TextSpan(text: widget.peopleItem.gender,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal
                          )
                        ),
                      ] 
                    )
                  ),

                  const SizedBox(height: 8),

                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(text: "Color de ojos: ",
                      style: const TextStyle(
                        color: Color(0xFFdba90d),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children:[
                        TextSpan(text: widget.peopleItem.eyeColor,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal
                          )
                        ),
                      ] 
                    )
                  ),

                  const SizedBox(height: 8),

                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(text: "Color de pelo: ",
                      style: const TextStyle(
                        color: Color(0xFFdba90d),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children:[
                        TextSpan(text: widget.peopleItem.hairColor,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal
                          )
                        ),
                      ] 
                    )
                  ),

                  const SizedBox(height: 8),

                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(text: "Color de piel: ",
                      style: const TextStyle(
                        color: Color(0xFFdba90d),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children:[
                        TextSpan(text: widget.peopleItem.skinColor,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal
                          )
                        ),
                      ] 
                    )
                  ),

                ],
                
              ),
            ),

          ],

        ),
      ),
    );
  }
}