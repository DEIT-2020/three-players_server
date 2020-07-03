import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'note.dart';

class NoteSearchService {
  final Client _http;

  NoteSearchService(this._http);

  Future<List<Note>> search(String term) async {
    try {
      final response = await _http.get('app/notes/?content=$term');
      return (_extractData(response) as List)
          .map((json) => Note.fromJson(json))
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