import 'note.dart';
import 'mock_notes.dart';

class NoteService {
  Future<List<Note>> getAll() async => mockNotes;

  Future<Note> get(int noteid) async =>
    (await getAll()).firstWhere((note) => note.noteid == noteid);

static const _notesUrl = 'api/notes';
  Future<Note> get() async {
    try{
      final response =await _http.get(_notesUrl);
      final note = (_extractData(response) as List).map((value)=>Note.fromJson(value)).toList();
      return note;
    }catch(e){
      throw _handleError(e);
    }
  }

dynamic _extractData(Response resp)=> json.decode(resp.body)['data'];

Future<Note> create(String notename,String notecontent) async {
  try{
    final response = await _http.post(_notesUrl,headers:_headers,body:json.encode({'notename':notename,'notecontent':notecontent}));
    return Note.fromJson(_extractData(response));
  }catch(e){
    throw _handleError(e);
  }
}

}