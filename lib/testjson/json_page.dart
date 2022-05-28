import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'json_data.dart';
import 'json_item.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Future<List<Favorite>> users;
  @override
  void initState() {
    super.initState();
    users = fetchUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kh co gif"),
      ),
      body:  FutureBuilder<List<Favorite>>(
        future: users,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView(
              children: List.generate(snapshot.data!.length,(index) => Card(
                child: ListTile(
                  title: Text(snapshot.data![index].id.toString()),
                  subtitle: Text(snapshot.data![index].title.toString()),
                  leading: Icon(Icons.contacts),
                ),
              )
              ),
            );
          }
          else if(snapshot.hasError)
            return Text('Lỗi đọc dữ liệu');
          else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
