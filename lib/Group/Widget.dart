import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Video_youtube.dart';
import 'getMovie.dart';

Widget movieLayout(data,i) {
  print(i);
  if (data.results.length > 0) {
    return Column(
      children: [
        for(int i =0; i<data.results.length;i++)
          getMovie(data: data.results[i],)
      ],
    );
  }
  else
    return Text("Không có kết quả",style: TextStyle(fontSize: 20,color: Colors.white),);
}

Widget getImage(String? url){
  if (url!= null)
    return Image.network("https://image.tmdb.org/t/p/original/$url",fit: BoxFit.cover,);
  else
    return Center(
      child: Icon(Icons.image),
    );
}


Widget trailerLayout(data, context) {
  if (data.results.length > 0) {
    return Column(
      children: [
        for(int i =0; i<data.results.length;i++)
          VideoTrailer(url: data.results[i].key,title: data.results[i].name,type: data.results[i].type,),

      ],
    );
  }
  else
    return Text("kh co data");
}