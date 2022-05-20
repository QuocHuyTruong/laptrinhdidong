import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/Item_movie.dart';
import 'package:laptrinhdidong/jsonphoto/Photo.dart';

class MovieList extends StatelessWidget {
  List<Result>? phim;
  MovieList({Key? key,required this.phim}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 300,
      padding: EdgeInsets.all((5)),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(phim!.length, (index) => Container(decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
        child: _getImage(phim![index].poster_path),)),
    );
  }
}

Widget _getImage(String? url){
  if (url!= null)
    return Image.network("https://image.tmdb.org/t/p/original/$url",fit: BoxFit.fill,);
  else
    return Center(
      child: Icon(Icons.image),
    );
}