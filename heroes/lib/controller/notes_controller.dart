import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class NotesController extends Controller {
  final _notes = [
    {'id': 11, 'name': ''},
    {'id': 12, 'name': ''},
    {'id': 13, 'name': ''},
    {'id': 14, 'name': ''},
    {'id': 15, 'name': ''},    
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_notes);
  }
}