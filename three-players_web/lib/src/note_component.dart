import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'note.dart';
import 'note_service.dart';
import 'route_paths.dart';


@Component(
  selector: 'my-note',
  templateUrl: 'note_component.html',
  styleUrls: ['note_component.css'],
  directives: [coreDirectives, formDirectives],
)
class NoteComponent implements OnActivate{
  Note note;

  final NoteService _noteService;
  final Location _location;

  NoteComponent(this._noteService, this._location);

  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) note = await (_noteService.get(id));
  }

  Future<void> save() async {
  await _noteService.update(note);
  goBack();
}

  void goBack() => _location.back();

}
