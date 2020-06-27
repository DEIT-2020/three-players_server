import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/note.dart';
import 'package:heroes/model/note.dart';

class NotesController extends ResourceController {
  NotesController(this.context);

  final ManagedContext context;
  final _notes = [
    {'noteid': 11, 'notename': '硫酸实验', 'notecontent': '碰到手躲开', 'tuser_id': 1},
  ];

  @Operation.get()
  Future<Response> getAllTips({@Bind.query('name') String name}) async {
    final noteQuery = Query<TNote>(context);
    if (name != null) {
      noteQuery.where((h) => h.notename).contains(name, caseSensitive: false);
    }
    final notes = await noteQuery.fetch();

    return Response.ok(notes);
  }

  @Operation.post()
  Future<Response> createNote(
      @Bind.body(ignore: ["id"]) TNote inputNote) async {
    final query = Query<TNote>(context)..values = inputNote;

    final insertedNote = await query.insert();

    return Response.ok(insertedNote);
  }
}
/* @Operation.get()
Future<Response> getAllNotes({@Bind.query('notename') String notename}) async {
  final noteQuery = Query<TNote>(context);
  if (notename != null) {
    noteQuery.where((h) => h.notename).contains(notename, caseSensitive: false);
  }
  final notes = await noteQuery.fetch();

  return Response.ok(notes);
}*/

/*
 @Operation.get('noteid')
Future<Response> getNoteByID(@Bind.path('noteid') int noteid) async {
  final noteQuery = Query<Note>(context)
    ..where((h) => h.noteid).equalTo(noteid);    

  final note = await noteQuery.fetchOne();

  if (note == null) {
    return Response.notFound();
  }
  return Response.ok(note);
}

@Operation.post()
Future<Response> createNote() async {
  final Map<String, dynamic> body = await request.body.decode();
  final query = Query<Note>(context)
    ..values.notename = body['notename'] as String 
    ..values.notecontent = body['notecontent'] as String ;

  final insertedNote = await query.insert();

  return Response.ok(insertedNote);

/*@Operation.post()
Future<Response> createNote(@Bind.body(ignore: ["noteid"]) Note inputNote) async {
  final query = Query<Note>(context)
    ..values = inputNote;

  final insertedNote = await query.insert();

  return Response.ok(insertedNote);*/
}

}
/*//奇奇怪怪的尝试
class NotesController extends ResourceController {
  NotesController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllNotes() async {
    final noteQuery = Query<Note>(context);
    final notes = await noteQuery.fetch();

    return Response.ok(notes);
  }

  @Operation.get('noteid')
Future<Response> getNoteByID(@Bind.path('noteid') int noteid) async {
  final noteQuery = Query<Note>(context)
    ..where((h) => h.noteid).equalTo(noteid);    

  final note = await noteQuery.fetchOne();

  if (note == null) {
    return Response.notFound();
  }
  return Response.ok(note);
}

@Operation.post()
Future<Response> createNote() async {
  final Map<String, dynamic> body = await request.body.decode();
  final query = Query<Note>(context)
    ..values.notename = body['notename'] as String 
    ..values.notecontent = body['notecontent'] as String ;

  final insertedNote = await query.insert();

  return Response.ok(insertedNote);
}

}*/*/
