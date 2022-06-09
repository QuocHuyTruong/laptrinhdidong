import 'package:flutter/material.dart';

class Layouttest extends StatefulWidget {
  const Layouttest({Key? key}) : super(key: key);

  @override
  State<Layouttest> createState() => _LayouttestState();
}

class _LayouttestState extends State<Layouttest> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  // backgroundColor: Colors.cyan[100],
                  backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Taylor%2C_Elizabeth_posed.jpg/800px-Taylor%2C_Elizabeth_posed.jpg"),
                )
            ),
            Text("Elizabeth Taylor",style: TextStyle(color: Colors.white,fontSize: 10),)
          ],
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Container(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  // backgroundColor: Colors.cyan[100],
                  backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Marilyn_Monroe_1961.jpg/800px-Marilyn_Monroe_1961.jpg"),
                )
            ),
            Text("Marilyn Monroe",style: TextStyle(color: Colors.white,fontSize: 10),)
          ],
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Container(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  // backgroundColor: Colors.cyan[100],
                  backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Brig._Gen._James_M._Stewart.jpg/800px-Brig._Gen._James_M._Stewart.jpg"),
                )
            ),
            Text("James Stewart",style: TextStyle(color: Colors.white,fontSize: 10),)
          ],
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Container(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  // backgroundColor: Colors.cyan[100],
                  backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Charlie_Chaplin.jpg/800px-Charlie_Chaplin.jpg"),
                )
            ),
            Text("Charles Chaplin",style: TextStyle(color: Colors.white,fontSize: 10),)
          ],
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Container(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  // backgroundColor: Colors.cyan[100],
                  backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/8/84/Humphrey_Bogart_1940.jpg"),
                )
            ),
            Text("Humphrey Bogart",style: TextStyle(color: Colors.white,fontSize: 10),)
          ],
        ),
      ],
    );
  }
}


class Sao{
  late String ten;
  late String url;
  Sao({required this.ten,required this.url});
}

List<Sao> listSao = [
  Sao(ten: "Elizabeth Taylor", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Taylor%2C_Elizabeth_posed.jpg/800px-Taylor%2C_Elizabeth_posed.jpg"),
  Sao(ten: "Marilyn Monroe", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Marilyn_Monroe_1961.jpg/800px-Marilyn_Monroe_1961.jpg"),
  Sao(ten: "James Stewart", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Brig._Gen._James_M._Stewart.jpg/800px-Brig._Gen._James_M._Stewart.jpg"),
  Sao(ten: "Charles Chaplin", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Charlie_Chaplin.jpg/800px-Charlie_Chaplin.jpg"),
  Sao(ten: "Humphrey Bogart", url: "https://upload.wikimedia.org/wikipedia/commons/8/84/Humphrey_Bogart_1940.jpg"),
];
