import 'package:flutter/material.dart';
import 'package:restapi/model/infoAPI.dart';
import 'package:restapi/services/infoData.dart';

class AddInfo extends StatefulWidget {
  @override
  _AddInfoState createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();

  void addData() {
    print('Hello addData');
    String firstName = fName.text;
    String lastName = lName.text;

    Info info = Info(firstName: firstName, lastName: lastName);
    InfoAPI().createInfo(info);
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: fName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your first name'),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: lName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your last name'),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              color: Colors.blue[400],
              onPressed: () {
                addData();
              },
              child: Text(
                'submit'.toUpperCase(),
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
