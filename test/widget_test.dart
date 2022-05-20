// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laptrinhdidong/BaiTap_Rss/RSS_Helper.dart';
import 'package:laptrinhdidong/Group/Movie_data.dart';
import 'package:laptrinhdidong/Movie/models/item_model.dart';
import 'package:laptrinhdidong/Movie/resources/movie_api_provider.dart';
import 'package:laptrinhdidong/jsonphoto/Listdata.dart';
import 'package:laptrinhdidong/jsonphoto/Photo.dart';

import 'package:laptrinhdidong/main.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
  // test("description", () async{
  //   String datafetch = 'photos';
  //   List data =await fetchData(datafetch);
  //   // print(data.map((item) => Photo.fromJson(item)).toList());
  //   print(data.toString());
  // });
  // test("test_thoi", () async{
  //   var data= await fetchPhotos();
  //   print(data.toString());
  // });
  // test("ahihi", ()async {
  //   var data = await RSS_Helper.fetchRSS();
  //   print(data.toString());
  // });
  // test("description1", () async{
  //   String datafetch = 'batman';
  //   var data =(await fetchDataMovie(datafetch));
  //   print(data);
  // });
  // test("description2", () async{
  //   String datafetch = 'batman';
  //   var data = await MovieApiProvider().fetchMovieList(datafetch);
  //   print(data);
  // });
  // test("description3", () async{
  //   ItemModel data = await MovieApiProvider().fetchMovieList();
  //   print(data);
  // });
  // test("bai", () async{
  //   var data = await fetchMovieList();
  //   print(data);
  // });
  test("bai", () async{
    var data = await fetchMovieDetail(785985);
    print(data);
  });
}
