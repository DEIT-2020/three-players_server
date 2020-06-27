import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'tool.dart';
import 'package:angular_router/angular_router.dart';
// ···
import 'tool_service.dart';
import 'route_paths.dart';
@Component(
  selector: 'my-tool',
  directives: [coreDirectives, formDirectives],
  templateUrl: 'tool_component.html',
styleUrls: ['tool_component.css'],

)
class ToolComponent implements OnActivate {

  Tool tool;
  final ToolService _toolService;
final Location _location;
ToolComponent(this._toolService, this._location);

@override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) tool = await (_toolService.get(id));
  }
void goBack() => _location.back();
}