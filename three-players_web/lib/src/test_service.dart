import 'test.dart';
import 'mock_test.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as _http;
import 'dart:html' as prefix0;

/*class TestService {
  Future<List<Test>> getAll() async => mockTests;
  Future<Test> get(int id) async =>
      (await getAll()).firstWhere((test) => test.id == id);
}
*/
class WrongquestionService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _wrongquestionsUrl =
      'http://127.0.0.1:8888/wrongquestions'; // URL to web API

  Future<List<Wrongquestion>> getAll() async {
    try {
      final response = await _http.get(_wrongquestionsUrl);
      final wrongquestions = (_extractData(response) as List)
          .map((json) => Wrongquestion.fromJson(json))
          .toList();
      return wrongquestions;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  Future<Wrongquestion> create(
      String question, String answer, String knowledge) async {
    try {
      final response = await _http.post(_wrongquestionsUrl,
          headers: _headers,
          body: json.encode(
            {'question': question, 'answer': answer, 'knowledge': knowledge},
          ));
      return Wrongquestion.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Wrongquestion> create2(String answer) async {
    try {
      final response = await _http.post(_wrongquestionsUrl,
          headers: _headers, body: json.encode({'answer': answer}));
      return Wrongquestion.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Wrongquestion> create3(String knowledge) async {
    try {
      final response = await _http.post(_wrongquestionsUrl,
          headers: _headers, body: json.encode({'knowledge': knowledge}));
      return Wrongquestion.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      final url = '$_wrongquestionsUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }
}

dynamic _extractData(_http.Response resp) => json.decode(resp.body);
