import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'note.dart';
import 'mock_notes.dart';
import 'note_component.dart';
import 'note_service.dart';
import 'route_paths.dart';
import 'note_search_component.dart';


@Component(
   selector: 'my-notes',
   templateUrl: 'note_list_component.html',
   styleUrls: ['note_list_component.css'],
   directives: [coreDirectives,NoteSearchComponent],
   providers: [ClassProvider(NoteService)],
    pipes: [commonPipes],
)

class NoteListComponent implements OnInit{
  final title = '查看我的笔记';
  
  List<Note> notes;
  Note  selected;

  void onSelect(Note note) => selected = note;


  final NoteService _noteService;
  NoteListComponent(this._noteService,this._router);

  Future<void> _getNotes() async {
  notes = await _noteService.getAll();
}

  final Router _router;
  void ngOnInit() => _getNotes();

  String _noteUrl(int id) =>
      RoutePaths.note.toUrl(parameters: {idParam: '$id'});


  Future<NavigationResult> gotoDetail() => _router.navigate(_noteUrl(selected.id));

Future<void> add(String content) async {
  content = content.trim();
  if (content.isEmpty) return null;
  notes.add(await _noteService.create(content));
  selected = null;
}

Future<void> delete(Note note) async {
  await _noteService.delete(note.id);
  notes.remove(note);
  if (selected == note) selected = null;
}


}


