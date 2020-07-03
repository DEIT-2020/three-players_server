import 'tool.dart';
import 'mock_tools.dart';
import 'tool.dart';
import 'mock_tools.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'tool.dart';
import 'mock_tools.dart';

class ToolService {
  Future<List<Tool>> getAll() async => mockTools;
  Future<Tool> get(int id) async =>
      (await getAll()).firstWhere((tool) => tool.id == id);
}

/*class ToolService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _toolsUrl =
      'http://127.0.0.1:8888//tools/[:id]'; // URL to web API

  final Client _http;

  ToolService(this._http);

  Future<List<Tool>> getAll() async {
    final response = await _http.get('http://127.0.0.1:8888/tools');
    final tools = (_extractData(response) as List)
        .map((json) => Tool.fromJson(json))
        .toList();
    return tools;
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  Future<Tool> get(int id) async {
    final response = await _http.get('$_http://127.0.0.1:8888/tools/$id');
    return Tool.fromJson(_extractData(response));
  }
  //(await getAll()).firstWhere((tool) => tool.id == id);
}*/
