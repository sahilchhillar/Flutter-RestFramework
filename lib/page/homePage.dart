import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restapi/model/infoAPI.dart';
import 'package:restapi/page/addInfo.dart';
import 'package:restapi/services/infoData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Info>> _infoData;

  @override
  void initState() {
    _infoData = InfoAPI().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RestAPI Testing'),
      ),
      body: FutureBuilder<List<Info>>(
        future: _infoData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].firstName),
                  subtitle: Text(snapshot.data[index].lastName),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddInfo()));
        },
      ),
    );
  }
}
