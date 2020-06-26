import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'note.dart';
import 'mock_notes.dart';
import 'note_component.dart';
import 'note_service.dart';
import 'route_paths.dart';
// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-notes',
  directives: [coreDirectives],
  styleUrls: ['note_list_component.css'],
  templateUrl: 'note_list_component.html',
  providers: [ClassProvider(NoteService)],
  pipes: [commonPipes],
)


class NoteListComponent implements OnInit {
final title='my note';
 final NoteService _NoteService;
  final Router _router;
  List<Note> notes;
  Note selected;

  NoteListComponent(this._NoteService, this._router);

  Future<void> _getNotes() async {
    notes = await _noteService.getAll();
  }

  void ngOnInit() => _getNotes();

  void onSelect(Note note) => selected = note;

  String _noteUrl(int noteid) =>
      RoutePaths.note.toUrl(parameters: {idParam: '$noteid'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_noteUrl(selected.noteid));

      

}