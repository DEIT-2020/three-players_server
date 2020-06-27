import 'package:angular/angular.dart';
import 'package:angular/angular.dart';
import 'route_paths.dart'; 
import 'tool.dart';
import 'experiment.dart';
import 'agentia.dart';
import 'agentia_service.dart';
import 'experiment_service.dart';
import 'tool_service.dart';
import 'routes.dart';
import 'package:angular_router/angular_router.dart';
@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  // ···
  directives: [coreDirectives, routerDirectives],
  exports: [RoutePaths, Routes],
  providers: [ClassProvider(ToolService),ClassProvider(AgentiaService),ClassProvider(ExperimentService)],
)
class DashboardComponent implements OnInit {
  List<Tool> tools;
  List<Agentia> agentias;
  List<Experiment> experiments;

  final ToolService _toolService;
  
  final AgentiaService _agentiaService;
  final ExperimentService _experimentService;

  DashboardComponent(this._toolService,this._agentiaService,this._experimentService);
String toolUrl(int id) => RoutePaths.tool.toUrl(parameters: {idParam: '$id'});
String agentiaUrl(int id) => RoutePaths.agentia.toUrl(parameters: {idParam: '$id'});
String experimentUrl(int id) => RoutePaths.experiment.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    tools = (await _toolService.getAll()).skip(0).take(5).toList();
    agentias = (await _agentiaService.getAll()).skip(0).take(5).toList();
    experiments = (await _experimentService.getAll()).skip(0).take(5).toList();
  }
}