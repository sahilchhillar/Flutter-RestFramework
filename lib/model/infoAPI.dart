import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi/services/infoData.dart';

class InfoAPI {
  Future<List<Info>> getData() async {
    String uri = 'http://127.0.0.1:8000/info/';
    List<Info> _info;
    try {
      var response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        _info = data.map((json) => Info.fromJson(json)).toList();
      }
    } catch (Exception) {
      throw Exception('Error occurred');
    }
    return _info;
  }

  void createInfo(Info info) async {
    print('Hello');
    String uri = 'http://127.0.0.1:8000/info/';
    try {
      print('Hello2');
      var response = await http.post(Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(info));
      if (response.statusCode == 201) {
        print('Done');
        getData();
      } else {
        print('Not done');
      }
    } catch (Exception) {
      throw Exception('Error!!!');
    }
  }
}
