import 'package:flutter/material.dart';
import 'package:grid_view/animatedGrid.dart';
import 'package:grid_view/dragablegrid.dart';
import 'package:grid_view/normalgrid.dart';

// @dart=2.9
void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}

class ListButtons extends StatefulWidget {
  const ListButtons({Key? key}) : super(key: key);

  @override
  _ListButtonsState createState() => _ListButtonsState();
}

class _ListButtonsState extends State<ListButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListButtons"),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                title: "Normal Grid",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NormalGrid()));
                }),
            SizedBox(
              height: 20,
            ),
            Container(
                title: "Reordorable Grid",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DragableGrid()));
                }),
            SizedBox(
              height: 20,
            ),
            Container(
                title: "Animated Grid",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnimatedGrid()));
                }),
          ],
        ),
      )),
    );
  }
}

class Container extends StatelessWidget {
  String? title;
  Function? onTap;
  Container({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        height: 80,
        child: ElevatedButton(
            onPressed: () {
              onTap!();
            },
            child: Text(
              title!,
              style: TextStyle(fontSize: 25),
            )));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ListButtons()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage("assets/ic_launcher.png"),
        ),
      ),
    );
  }
}
