import 'package:flutter/material.dart';
import 'package:grid_view/card.dart';
import 'package:grid_view/data/data.dart';

class AnimatedGrid extends StatefulWidget {
  const AnimatedGrid({Key? key}) : super(key: key);

  @override
  _AnimatedGridState createState() => _AnimatedGridState();
}

class _AnimatedGridState extends State<AnimatedGrid>
    with TickerProviderStateMixin {
  List<AnimationController> animationControllerreverse = [];
  List<AnimationController> animationController = [];
  List items = [];
  var data = [];
  Future getData() async {
    data = await GetData().getDetails();
    return data;
  }

  Widget grid(index, begins, ends, controller) {
    return SlideTransition(
        position: Tween<Offset>(begin: begins, end: ends).animate(controller),
        child: Card1(datas: items[index]));
  }

  @override
  void dispose() {
    super.dispose();
    animationController.forEach((element) {
      element.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Grid View"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot? snapShot) {
                if (snapShot!.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return GridView.builder(
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        mainAxisExtent: 570,
                      ),
                      itemBuilder: (BuildContext context, index) {
                        return grid(index, Offset(0, 1), Offset.zero,
                            animationController[index]);
                      });
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (items.length < data.length) {
                          items.add(data[items.length]);
                          animationController.add(AnimationController(
                              vsync: this, duration: Duration(seconds: 1)));
                        }
                      });
                      animationController[items.length - 1].forward();
                    },
                    child: Text("Add Item")),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      if (items.length >= 1) {
                        grid(items.length - 1, Offset(-1, 0), Offset(0, 0),
                            animationController[items.length - 1]);
                        animationController[items.length - 1]
                            .reverse()
                            .then((value) => setState(() {
                                  items.removeAt(items.length - 1);
                                }));
                      }
                    },
                    child: Text("Remove Item")),
              )
            ],
          )
        ],
      ),
    );
  }
}
