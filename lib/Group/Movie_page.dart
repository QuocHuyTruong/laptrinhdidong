
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/Item_movie.dart';

import 'Movie_data.dart';
import 'Widget.dart';

class MoviePageTrailer extends StatefulWidget {
  const MoviePageTrailer({Key? key}) : super(key: key);

  @override
  State<MoviePageTrailer> createState() => _MoviePageTrailerState();
}

class _MoviePageTrailerState extends State<MoviePageTrailer> {
  late Future<Item_movie> movie;
  @override
  void initState(){
    super.initState();
    movie = fetchMovieList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phim mới nhất"),
      ),
      body: Container(
        child: FutureBuilder<Item_movie>(
          future: movie,
          builder: (context, snapshot){
            if(snapshot.hasError) {
              print("Error" + movie.toString());
              return Text("Error");
            }
            return snapshot.hasData
                ? Container(
              padding: EdgeInsets.all(12),
              child: GridView.count(
                childAspectRatio: (1/1.56),
                crossAxisCount: 1,
                children: List.generate(snapshot.data!.results.length, (index){
                  return buildBurgerscolum(snapshot);
                }),

              ),
              //child: buildBurgers(snapshot),
              //child: layouttest(snapshot),
            )
                : Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }


  Widget? layouttest(snapshot){
    return
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(8),
          color: Colors.black,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: getImage(snapshot.data!.results[0].poster_path),
              ),
              const SizedBox(width: 8,),
              Expanded(child: Text(snapshot.data!.results[0].title ?? "",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),)),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white30,
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Text(snapshot.data!.results[0].title ?? "",),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  Widget buildBurger(snapshot) {
        return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Color(0xFF010101),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getImage(snapshot.data!.results[0].poster_path),
            Text(
              'Beef Burger',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Onion with cheese',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\$24.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBurgers(snapshot) => Row(
    children: [
      Expanded(child: buildBurger(snapshot)),
      const SizedBox(width: 5),
      Expanded(child: buildBurger(snapshot)),
    ],
  );

  Widget buildBurgerscolum(snapshot) => Column(
    children: [
      Expanded(child: buildBurgers(snapshot)),
      const SizedBox(width: 5),
      Expanded(child: buildBurgers(snapshot)),
    ],
  );

}




