import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'experiment.dart';
import 'tool.dart';
import 'agentia.dart';
import 'package:angular_router/angular_router.dart';
// ···
import 'experiment_service.dart';
import 'tool_service.dart';
import 'agentia_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-experiment',
  directives: [coreDirectives, formDirectives,routerDirectives],
  templateUrl: 'experiment_component.html',
  styleUrls: ['experiment_component.css'],
)
class ExperimentComponent implements OnActivate {
  Experiment experiment;
  List<Tool> tools;
  List<Agentia> agentias;
  final ExperimentService _experimentService;
  final ToolService _toolService;
  final AgentiaService _agentiaService;
  final Location _location;
  ExperimentComponent(this._experimentService, this._location, this._toolService, this._agentiaService);

  String toolUrl(int id) => RoutePaths.tool.toUrl(parameters: {idParam: '$id'});
  String agentiaUrl(int id) => RoutePaths.agentia.toUrl(parameters: {idParam: '$id'});

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) experiment = await (_experimentService.get(id));
        tools = (await _toolService.getAll()).skip(0).take(5).toList();
        agentias = (await _agentiaService.getAll()).skip(0).take(5).toList();
    
  }

  void goBack() => _location.back();
}
