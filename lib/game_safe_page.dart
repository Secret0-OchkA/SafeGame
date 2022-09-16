import 'package:flutter/material.dart';

import 'map.dart';

class GameSafePage extends StatefulWidget {
  int size;
  GameSafePage({super.key, required this.size});

  Future<void> compliteDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Open safe'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context)
                  ..pop()
                  ..pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  State<StatefulWidget> createState() => _GameSafePageState(size);
}

class _GameSafePageState extends State<GameSafePage> {
  late Safe safe;
  _GameSafePageState(int size) {
    safe = SafeGame(size);
    safe.generation(size * 2);
  }

  @override
  Widget build(BuildContext context) {
    Column table = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List<Widget>.generate(
            widget.size,
            (i) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List<Widget>.generate(
                    widget.size,
                    (j) => FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              safe.setCell(i, j, safe.getCell(i, j));
                            });
                            if (safe.isWin()) {
                              widget.compliteDialog(context);
                            }
                          },
                          child:
                              safe.getCell(i, j)?
                              const Divider(color: Colors.white,):
                              const VerticalDivider(color: Colors.white),
                        )))));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Safe"),
      ),
      body: table,
    );
  }
}
