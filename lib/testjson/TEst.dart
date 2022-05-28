import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'json_data.dart';

class TEstthoi extends StatefulWidget {
  const TEstthoi({Key? key}) : super(key: key);

  @override
  State<TEstthoi> createState() => _TEstthoiState();
}

class _TEstthoiState extends State<TEstthoi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("Nhan vao day"),
        onPressed: (){
          writeJsonFile();
        },
      ),
    );
  }
}

