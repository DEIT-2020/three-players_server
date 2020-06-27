import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
//import 'src/todo_list/todo_list_component.dart';
import 'agentia.dart';
import 'mock_agentias.dart';
import 'agentia_service.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-agentias',
   directives: [coreDirectives],
  styleUrls: ['agentia_list_component.css'],
 templateUrl: 'agentia_list_component.html',
providers: [ClassProvider(AgentiaService)],
pipes: [commonPipes],

  //directives: [TodoListComponent],
)
class AgentiaListComponent implements OnInit {
  /*void ngOnInit() => _getAgentias();


 final title='tour of agentias';
 List<Agentia> agentias;
 // List<Agentia> agentias = mockAgentias;
 void _getAgentias() {
 _agentiaService.getAll().then((agentias) => this.agentias = agentias);

}

agentia selected;
void onSelect(Agentia agentia) => selected = agentia;
final AgentiaService _agentiaService;
AgentiaListComponent(this._agentiaService);
Future<NavigationResult> gotoDetail() => null;*/
 //Agentia agentia= Agentia(01, '硫酸','腐蚀金属，与碱中和。');
final title='tour of agentias';
 final AgentiaService _agentiaService;
  final Router _router;
  List<Agentia> agentias;
  Agentia selected;

  AgentiaListComponent(this._agentiaService, this._router);

  Future<void> _getAgentias() async {
    agentias = await _agentiaService.getAll();
  }

  void ngOnInit() => _getAgentias();

  void onSelect(Agentia agentia) => selected = agentia;

  String _agentiaUrl(int id) =>
      RoutePaths.agentia.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_agentiaUrl(selected.id));
}
