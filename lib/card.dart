import 'package:flutter/material.dart';

class Card1 extends StatefulWidget {
  final datas;
  const Card1({@required this.datas});

  @override
  _Card1State createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 570,
          width: 170,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 50,
                child: Text(widget.datas.doctors_images.substring(0, 1)),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 70,
                color: Color(0xFFEEF7FE),
                child: Text(
                  widget.datas.doctors_is_available,
                  style: TextStyle(fontSize: 20, color: Color(0xFF4A4979)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.datas.doctors_name,
                style: TextStyle(color: Color(0xFF4A4979), fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.datas.doctor_specialist_name,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF4A4999),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.datas.doctors_description,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(color: Colors.blueGrey, fontSize: 20),
              ),
              SizedBox(
                height: 8,
              ),
              Wrap(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.datas.doctor_clinic_name,
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF22215B)),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.datas.doctors_website,
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF22215B)),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.datas.doctors_contact_number,
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF22215B)),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.datas.doctors_address,
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF22215B)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Containers(),
            ],
          ),
        ),
      ),
    );
  }
}

class Containers extends StatefulWidget {
  const Containers({Key? key}) : super(key: key);

  @override
  _ContainersState createState() => _ContainersState();
}

class _ContainersState extends State<Containers> {
  bool connectionState = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 160,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 10,
                  side: BorderSide(color: Color(0xFF22215B)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Row(
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    color: Color(0xFF22215B),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Message",
                      style: TextStyle(fontSize: 20, color: Color(0xFF22215B))),
                ],
              )),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 50,
          width: 160,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  connectionState = !connectionState;
                });
              },
              style: ElevatedButton.styleFrom(
                  primary: connectionState ? Colors.white : Color(0xFF22215B),
                  elevation: 10,
                  shadowColor: Color(0xFF22215B),
                  side: BorderSide(color: Color(0xFF22215B)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: connectionState
                  ? Text(
                      "Pending..",
                      style: TextStyle(fontSize: 20, color: Color(0xFF22215B)),
                    )
                  : Text("Connect", style: TextStyle(fontSize: 20))),
        ),
      ],
    );
  }
}
