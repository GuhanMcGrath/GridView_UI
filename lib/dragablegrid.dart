import 'package:flutter/material.dart';
import 'package:grid_view/card.dart';
import 'package:grid_view/data/data.dart';
import 'package:reorderables/reorderables.dart';

class DragableGrid extends StatefulWidget {
  const DragableGrid({Key? key}) : super(key: key);

  @override
  _DragableGridState createState() => _DragableGridState();
}

class _DragableGridState extends State<DragableGrid> {
  var data;
  List<Widget> reorderableGrid = [];
  Future getData() async {
    if (data == null) {
      data = await GetData().getDetails();
      data.forEach((element) {
        Card1 card = Card1(datas: element);
        reorderableGrid.add(Container(
          key: Key("${reorderableGrid.length}"),
          child: card,
        ));
      });
      reorderableGrid.toSet();
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dragable Grid`")),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot? snapShot) {
          if (snapShot!.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ReorderableWrap(
              spacing: 5,
              children: reorderableGrid,
              onReorder: (int oldIndex, int newIdex) {
                setState(() {
                  var item = reorderableGrid.removeAt(oldIndex);
                  reorderableGrid.insert(newIdex, item);
                });
              },
            );
          }
        },
      ),
    );
  }
}
