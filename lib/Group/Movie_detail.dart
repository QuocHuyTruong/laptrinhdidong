
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Movie_data.dart';

class Moviedetail extends StatefulWidget {
  final anh;
  final id;
  const Moviedetail({this.id, this.anh});

  @override
  createState() => _MoviedetailState(this.id,this.anh);
}

class _MoviedetailState extends State<Moviedetail> {
  String anh;
  int id;
  var data;
  _MoviedetailState(this.id, this.anh);

  @override
  void initState() {
    super.initState();
    data = fetchMovieDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text id"),
      ),
      body: Column(
        children: [
          Text("ID nay ne ${data}"),
          _getImage(anh)
        ],
      ),
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
