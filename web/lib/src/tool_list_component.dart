import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
//import 'src/todo_list/todo_list_component.dart';
import 'tool.dart';
import 'mock_tools.dart';
import 'package:angular_forms/angular_forms.dart';
import 'tool_component.dart';
import 'tool_service.dart';
import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-tools',
   directives: [coreDirectives],
  styleUrls: ['tool_list_component.css'],
 templateUrl: 'tool_list_component.html',
providers: [ClassProvider(ToolService)],
pipes: [commonPipes],

  //directives: [TodoListComponent],
)
class ToolListComponent implements OnInit {
  /*void ngOnInit() => _getTools();


 final title='tour of tools';
 List<Tool> tools;
 // List<Tool> tools = mockTools;
 void _getTools() {
 _toolService.getAll().then((tools) => this.tools = tools);

}

Tool selected;
void onSelect(Tool tool) => selected = tool;
final ToolService _toolService;
ToolListComponent(this._toolService);
Future<NavigationResult> gotoDetail() => null;*/
 //Tool tool= Tool(1,'烧杯','在实验时盛放较多的液体。','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593010497511&di=f7f077eb7bbbfd46df014fc8cf22ba97&imgtype=0&src=http%3A%2F%2Fstatic.grainger.cn%2Fproduct_images_new%2F1200%2F6E9%2F2017073141.jpg');
final title='tour of tools';
 final ToolService _toolService;
  final Router _router;
  List<Tool> tools;
  Tool selected;

  ToolListComponent(this._toolService, this._router);

  Future<void> _getTools() async {
    tools = await _toolService.getAll();
  }

  void ngOnInit() => _getTools();

  void onSelect(Tool tool) => selected = tool;

  String _toolUrl(int id) =>
      RoutePaths.tool.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_toolUrl(selected.id));
}
