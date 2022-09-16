
import 'package:flutter/material.dart';

import 'game_safe_page.dart';

class SetSizePage extends StatefulWidget {
  const SetSizePage({super.key});
  @override
  State<StatefulWidget> createState() => _SetSizePageState();
}
class _SetSizePageState extends State<SetSizePage> {
  int size = 3;

  void _addSize(){
    setState(() {
      ++size;
    });
  }
  void _subSize() {
    setState(() {
      if(size >= 2) {
      --size;
      }
    });
  }
  void _openSafePage(){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => GameSafePage(size: size)),
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget body = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Directionality(textDirection: TextDirection.ltr,
                  child: ElevatedButton(onPressed: _addSize,
                    child: const Icon(Icons.arrow_upward),)),
              Text("$size x $size",textDirection: TextDirection.ltr ,
                style: const TextStyle(fontSize: 22, color: Colors.black),),
              Directionality(textDirection: TextDirection.ltr,
                  child: ElevatedButton(onPressed: _subSize,
                    child: const Icon(Icons.arrow_downward),)),
              Directionality(textDirection: TextDirection.ltr,
                  child: ElevatedButton(onPressed: _openSafePage,
                    child: const Text("Ok",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 22, decoration: null),),)),
            ],
          ),
        ],);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Size select")
      ),
      body: body
    );
  }
}