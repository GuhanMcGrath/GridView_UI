import 'package:flutter/material.dart';
import 'package:grid_view/card.dart';
import 'package:grid_view/data/data.dart';

class NormalGrid extends StatefulWidget {
  NormalGrid();

  @override
  _NormalGridState createState() => _NormalGridState();
}

class _NormalGridState extends State<NormalGrid> {
  Future getData() async {
    var data = await GetData().getDetails();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal Grid"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot? snapShot) {
          if (snapShot!.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  mainAxisExtent: 570,
                ),
                itemCount: snapShot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card1(datas: snapShot.data[index]);
                });
          }
        },
      ),
    );
  }
}
