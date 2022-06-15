
import 'package:flutter/material.dart';
import 'package:laptrinhdidong/Group/Widget.dart';

import 'Models/Item_movie.dart';
import 'Movie_data.dart';

class Saodetail extends StatefulWidget {
  final name;
  final url;
  const Saodetail({required this.name, required this.url});

  @override
  createState() => _SaodetailState(this.name,this.url);
}

class _SaodetailState extends State<Saodetail> {
  var name;
  var url;
  var data;
  _SaodetailState(this.name,this.url);


  @override
  void initState() {
    data = fetchSearchMovie(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context,constraints){
            return Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            child:Image.network(url,fit: BoxFit.cover,),
                          ),
                        ],
                      )
                  ),
                  Container(
                    color: Theme.of(context).primaryColorDark,
                    width: constraints.maxHeight,
                    height: 600,
                    child: FutureBuilder<Item_movie>(
                      future: data,
                      builder: (context,snapshot){
                        return snapshot.hasData ?
                        ListView(
                          children: [
                            for(int i =0; i<snapshot.data!.results.length;i=i+3)
                              movilayout(context,snapshot,i),
                          ],
                        ) :
                        Center(child: CircularProgressIndicator(),);
                      },
                    )
                  )
                ],
              ),
            );
          }
      )
    );
  }
}
