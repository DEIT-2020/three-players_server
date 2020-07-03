import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'src/tool_service.dart';
import 'src/agentia_service.dart';
import 'src/experiment_service.dart';
import 'src/routes.dart';
import 'src/todo_list_component.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'my-app',
  styleUrls:  ['package:angular_components/app_layout/layout.scss.css',
      'app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
    TodoListComponent,
    MaterialTemporaryDrawerComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialButtonComponent,
    MaterialProgressComponent,
    MaterialStepperComponent,
    StepDirective,
    SummaryDirective
    ],
  exports: [RoutePaths, Routes],
  providers: [
    ClassProvider(ToolService),
    ClassProvider(AgentiaService),
    ClassProvider(ExperimentService)
  ],
)
class AppComponent {
  final title = '化学实验宝典';
  
}
