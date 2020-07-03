import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';
import 'route_paths.dart';
import 'search_service.dart';
import 'experiment.dart';

@Component(
  selector: 'my-search',
  templateUrl: 'search_component.html',
  styleUrls: ['search_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(SearchService)],
  pipes: [commonPipes],
)
class SearchComponent implements OnInit {
  SearchService _searchService;
  Router _router;
  Stream<List<Experiment>> experiments;
  StreamController<String> _searchTerms = StreamController<String>.broadcast();
  SearchComponent(this._searchService, this._router) {}
  void search(String term) => _searchTerms.add(term);
  void ngOnInit() async {
    experiments = _searchTerms.stream
        .transform(debounce(Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
            ? Stream<List<Experiment>>.fromIterable([<Experiment>[]])
            : _searchService.search(term).asStream()))
        .handleError((e) {
      print(e); // for demo purposes only
    });
  }

  String _experimentUrl(int id) =>
      RoutePaths.experiment.toUrl(parameters: {idParam: '$id'});
  Future<NavigationResult> gotoDetail(Experiment experiment) =>
      _router.navigate(_experimentUrl(experiment.id));
}
