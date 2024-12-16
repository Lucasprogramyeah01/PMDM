import 'package:flutter/material.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

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
        width: double.infinity,
        child: SizedBox(
          width: double.infinity,
          child: GridView.count(
            /*gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
            ),
          
            itemCount: peopleResponse.results!.length,
            itemBuilder: (context, index){*/

            padding: const EdgeInsets.only(left: 10, right: 10),
            crossAxisCount: 3, // number of items in each row
            mainAxisSpacing: 8.0, // spacing between rows
            crossAxisSpacing: 8.0, // spacing between columns
            childAspectRatio: 20/55,
          
            children: [
              /*return*/ Column(
                children: [
                  Container(
                    height: 250,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFdba90d),
                        width: 4,  
                      ),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network('https://cloudfront-us-east-1.images.arcpublishing.com/copesa/LS6NAJWL4ZA4PMRN4MTK5YYLBE.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 200,
                    child: Text("Darth Vader", 
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  )
                ],
              ),
            ],
              
            //}
          ),
        )

      )
    );
  }
}