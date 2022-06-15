import 'package:flutter/foundation.dart';

import '../History/History_data.dart';

class History{
  late String key;
  late int id;
  late String title;

  History.fromJson(Map<String, dynamic> json){
    key = json['key'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() =>{
    'key': key,
    'id': id,
    'title': title,
  };

  History({required this.key,required this.id,required this.title});
}

class QLHistory extends ChangeNotifier{
  List<History> _list= [];

  List<History> get list => _list;

  void readHistori() async{
    _list = await readJsonFile().whenComplete(() {
      notifyListeners();
    });
  }

  Future<List<History>> writeHistory(History history)async{
    await writeJsonFile(history.id, history.key, history.title).whenComplete(()async{
      _list = await readJsonFile().whenComplete(() {
        notifyListeners();
      });
    });
    return [];
  }

  Future<List<History>> deleteHistory(int index)async{
    await deleteJsonFile(index).whenComplete(()async{
      _list = await readJsonFile().whenComplete(() {
        notifyListeners();
      });
    });
    return [];
  }
}