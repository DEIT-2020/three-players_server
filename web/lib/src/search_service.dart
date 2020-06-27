import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'experiment.dart'


class SearchService {
  final Client _http;

  SearchService(this._http);

  Future<List<Experiment>> search(String term) async {
    try {
      final response = await _http.get('app/experiment/?name=$term');
      return (_extractData(response) as List)
          .map((json) => Experiment.fromJson(json))
          .toList();
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
}