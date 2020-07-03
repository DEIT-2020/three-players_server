import 'package:angular/angular.dart';
import 'experiment_service.dart';
import 'experiment.dart';
import 'route_paths.dart';
import 'routes.dart';
import 'package:angular_router/angular_router.dart';
//import 'search_component.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  // ···
  directives: [coreDirectives,  routerDirectives],
  exports: [RoutePaths, Routes],
  providers: [ClassProvider(ExperimentService)],
)
class DashboardComponent implements OnInit {
  List<Experiment> experiments;

  final ExperimentService _experimentService;
  DashboardComponent(this._experimentService);
  String experimentUrl(int id) =>
      RoutePaths.experiment.toUrl(parameters: {idParam: '$id'});
  @override
  void ngOnInit() async {
    experiments = (await _experimentService.getAll()).skip(0).take(6).toList();
  }
}

