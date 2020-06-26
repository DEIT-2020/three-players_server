import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
// ···
import 'note_service.dart';
import 'note.dart';
import 'route_paths.dart';


@Component(
  selector: 'my-note',
  directives: [coreDirectives, formDirectives],
  templateUrl: 'note_component.html',
  styleUrls: ['note_component.css'],

)
class NoteComponent implements OnActivate {

  Note note;
  final NoteService _noteService;
  NoteComponent(this._noteService);
  String errorMessage;

@override
  void onActivate(_, RouterState current) async {
    final noteid = getId(current.parameters);
    if (noteid != null) note = await (_noteService.get(noteid));
  }

  void ngOnInit()=>_getNotes();

  Future<void> _getNotes() async {
    try{ 
      note = await _noteService.getAll();
    } catch(e){
      errorMessage=e.toString;
    }
  }
  Future<void>add(String notename,String notecontent)async{
    notename=notename.trim();
    notecontent=notecontent.trim();
    if(notename.isEmpty) return null;
    try{
      note.add(await  _noteService.create(note));
    }catch(e){
      errorMessage=e.toString;
    }
  }

}