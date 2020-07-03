import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'src/note.dart';


class InMemoryDataService extends MockClient {
  static final _initialNotes = [
    {'id': 1, 'content': '11111bnfgtt11111111111111111'},
    {'id': 2, 'content': '22222zsvcdvfaaaaaaaaaadv2'},
    {'id': 3, 'content': '3333hhaonanhaonanhaonanhaonanjmjk333333'}
  ];
  static List<Note> _notesDb;
  static int _nextId;
  static Future<Response> _handler(Request request) async {
    if (_notesDb == null) resetDb();
    var data;
    switch (request.method) {
      case 'GET':
        final id = int.tryParse(request.url.pathSegments.last);
        if (id != null) {
          data = _notesDb
              .firstWhere((note) => note.id == id); // throws if no match
        } else {
          String prefix = request.url.queryParameters['content'] ?? '';
          final regExp = RegExp(prefix, caseSensitive: false);
          data = _notesDb.where((note) => note.content.contains(regExp)).toList();
        }
        break;
      case 'POST':
        var content = json.decode(request.body)['content'];
        var newNote = Note(_nextId++, content);
        _notesDb.add(newNote);
        data = newNote;
        break;
      case 'PUT':
        var noteChanges = Note.fromJson(json.decode(request.body));
        var targetNote = _notesDb.firstWhere((h) => h.id == noteChanges.id);
        targetNote.content = noteChanges.content;
        data = targetNote;
        break;
      case 'DELETE':
        var id = int.parse(request.url.pathSegments.last);
        _notesDb.removeWhere((note) => note.id == id);
        // No data, so leave it as null.
        break;
      default:
        throw 'Unimplemented HTTP method ${request.method}';
    }
    return Response(json.encode({'data': data}), 200,
        headers: {'content-type': 'application/json'});
  }
  static resetDb() {
    _notesDb = _initialNotes.map((json) => Note.fromJson(json)).toList();
    _nextId = _notesDb.map((note) => note.id).fold(0, max) + 1;
  }
  static String lookUpName(int id) =>
      _notesDb.firstWhere((hero) => hero.id == id, orElse: null)?.content;
  InMemoryDataService() : super(_handler);
}