
import 'dart:convert';
import 'dart:io';
import 'package:laptrinhdidong/Group/Models/History_item.dart';
import 'package:path_provider/path_provider.dart';


Future<String?> get _directoryPath async {
  Directory? directory = await getExternalStorageDirectory();
  print(directory?.path);
  return directory?.path;
}

Future<File> get _jsonFile async {
  final path = await _directoryPath;
  return File('$path/cheetah.json');
}



Future<List<History>> readJsonFile() async{
  File file = await _jsonFile;
  if(await file.exists()){
    List<History> list;
    String fileContent = await file.readAsString();
    var listdemo = jsonDecode(fileContent) as List;
    list = listdemo.map((e) => History.fromJson(e)).toList();
    return list;
  }else
    return [];
}

Future<List<History>> writeJsonFile(int id,String key,String title) async {
  List<History> list;
  String fileContent;
  final History history =new History(key: key, id: id, title: title);

  File file = await _jsonFile;

  fileContent = await file.readAsString();
  var listdemo = jsonDecode(fileContent) as List;
  list = listdemo.map((e) => History.fromJson(e)).toList();
  list.add(history);
  await file.writeAsString(json.encode(list));
  return [];
}

Future<List<History>> deleteJsonFile(int index) async {
  List<History> list;
  String fileContent;

  File file = await _jsonFile;

  fileContent = await file.readAsString();
  var listdemo = jsonDecode(fileContent) as List;
  list = listdemo.map((e) => History.fromJson(e)).toList();
  list.removeAt(index);
  await file.writeAsString(json.encode(list));
  return [];
}