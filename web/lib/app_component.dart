import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
//import 'src/todo_list/todo_list_component.dart';
import 'src/tool.dart';
import 'src/mock_tools.dart';
import 'package:angular_forms/angular_forms.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
   directives: [coreDirectives, formDirectives],
  styleUrls: ['app_component.css'],
 templateUrl: 'app_component.html',


  //directives: [TodoListComponent],
)
class AppComponent {
 final title='tour of tools';
 
  List<Tool> tools = mockTools;
Tool selected;
void onSelect(Tool tool) => selected = tool;
 //Tool tool= Tool(1,'烧杯','在实验时盛放较多的液体。','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593010497511&di=f7f077eb7bbbfd46df014fc8cf22ba97&imgtype=0&src=http%3A%2F%2Fstatic.grainger.cn%2Fproduct_images_new%2F1200%2F6E9%2F2017073141.jpg');
}