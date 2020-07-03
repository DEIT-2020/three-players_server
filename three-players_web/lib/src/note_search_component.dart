import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import 'route_paths.dart';
import 'note_search_service.dart';
import 'note.dart';

@Component(
  selector: 'note-search',
  templateUrl: 'note_search_component.html',
  styleUrls: ['note_search_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(NoteSearchService)],
  pipes: [commonPipes],
)
class NoteSearchComponent implements OnInit {
  NoteSearchService _noteSearchService;
  Router _router;
  Stream<List<Note>> notes;

  StreamController<String> _searchTerms = StreamController<String>.broadcast();

  NoteSearchComponent(this._noteSearchService, this._router) {}

  void search(String term) => _searchTerms.add(term);

  void ngOnInit() async {
    notes = _searchTerms.stream
        .transform(debounce(Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
            ? Stream<List<Note>>.fromIterable([<Note>[]])
            : _noteSearchService.search(term).asStream()))
        .handleError((e) {
      print(e); // for demo purposes only
    });
  }

  String _noteUrl(int id) =>
      RoutePaths.note.toUrl(parameters: {idParam: '$id'});
      
  Future<NavigationResult> gotoDetail(Note note) =>
      _router.navigate(_noteUrl(note.id));
}