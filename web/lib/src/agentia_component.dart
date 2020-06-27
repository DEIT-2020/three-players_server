import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'agentia.dart';
import 'package:angular_router/angular_router.dart';
// ···
import 'agentia_service.dart';
import 'route_paths.dart';
@Component(
  selector: 'my-agentia',
  directives: [coreDirectives, formDirectives],
  templateUrl: 'agentia_component.html',
styleUrls: ['agentia_component.css'],

)
class AgentiaComponent implements OnActivate {

  Agentia agentia;
  final AgentiaService _agentiaService;
final Location _location;
AgentiaComponent(this._agentiaService, this._location);

@override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) agentia = await (_agentiaService.get(id));
  }
void goBack() => _location.back();
}