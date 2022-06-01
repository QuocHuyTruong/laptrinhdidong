
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/testmoviedetail.dart';

import 'Movie_detail.dart';
import 'Widget.dart';


class getMovie extends StatefulWidget {
  final data;
  const getMovie({Key? key, this.data});

  @override
  createState() => _getMovieState(this.data);
}

class _getMovieState extends State<getMovie> {
  var _data;

  _getMovieState(this._data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Route route = MaterialPageRoute(builder: (context) => MoviedetailTest(id: _data.id,dataphim: _data,));
            Navigator.push(context, route);
          },
          child: Container(
            height: 550,
            width: 500,
            child: getImage(_data.poster_path),
          ),
        ),
        Text(_data.title ?? "", style: TextStyle(fontSize: 24, color: Colors.white70),),
        Row(
          children: [
            const Text("Đánh giá:",style: TextStyle(fontSize: 15, color: Colors.white70),),
            Text(_data.vote_average.toString(), style: TextStyle(fontSize: 15, color: Colors.white70),),
            Icon(Icons.star, color: Colors.amberAccent,),
          ],
        ),
      ],
    );

  }
}

