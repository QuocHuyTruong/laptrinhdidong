import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'json_item.dart';


Future<List<Favorite>> fetchUser() async{
  var response = await rootBundle.loadString('assets/sample.json');
  if(response.isNotEmpty){
    List<Favorite> users;
    var list = jsonDecode(response) as List;
    users = list.map((item) => Favorite.fromJson(item)).toList();
    return users;
  }
  else{
    print("Không tải được dữ liệu");
    throw Exception("Khong tai duoc Album");
  }
}


Future<String> get _directoryPath async {
  Directory directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _jsonFile async {
  final path = await _directoryPath;
  return File('$path/sample.json');
}
Future<String> writeJsonFile() async {
  Favorite favorite = Favorite(id: 9, title: "title",url: "url");

  File file = await _jsonFile;
  var list = jsonEncode(favorite);
  // await file.writeAsStringSync();
  print("da them");
  return "da them";

}

