import 'package:angular/angular.dart';
import 'package:angular/angular.dart';
import 'route_paths.dart'; 
import 'tool.dart';
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
  providers: [ClassProvider(ToolService)],
)
class DashboardComponent implements OnInit {
  List<Tool> tools;

  final ToolService _toolService;

  DashboardComponent(this._toolService);
String toolUrl(int id) => RoutePaths.tool.toUrl(parameters: {idParam: '$id'});
  @override
  void ngOnInit() async {
    tools = (await _toolService.getAll()).skip(0).take(5).toList();
  }
}