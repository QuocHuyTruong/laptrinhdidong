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
  //   List data =await fetchData();
  //   print(data.map((item) => Photo.fromJson(item)).toList());
  // });
  // test("test_thoi", () async{
  //   var data= await fetchPhotos();
  //   print(data.toString());
  // });
  test("ahihi", ()async {
    var data = await RSS_Helper.fetchRSS();
    print(data.toString());
  });
}
