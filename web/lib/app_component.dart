import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'src/tool_service.dart';
import 'src/tool_list_component.dart';
import 'src/agentia_service.dart';
import 'src/agentia_list_component.dart';
import 'src/experiment_service.dart';
import 'src/experiment_list_component.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  template: '''
  <h1>{{title}}</h1>
  <nav>
    <a [routerLink]="RoutePaths.dashboard.toUrl()"
       [routerLinkActive]="'active'">Dashboard</a>

    <a [routerLink]="RoutePaths.tools.toUrl()"
       [routerLinkActive]="'active'">Tool</a>
    
    <a [routerLink]="RoutePaths.agentias.toUrl()"
       [routerLinkActive]="'active'">Agentia</a>

    <a [routerLink]="RoutePaths.experiments.toUrl()"
       [routerLinkActive]="'active'">Experiment</a>

<<<<<<< HEAD
=======
    <a [routerLink]="RoutePaths.notes.toUrl()"
       [routerLinkActive]="'active'">Note</a>

>>>>>>> d204b4d3dfa9364f94904cd38dfff7760e536ea4
  </nav>
  <router-outlet [routes]="Routes.all"></router-outlet>
''',

 directives: [routerDirectives],
 exports: [RoutePaths, Routes],
  providers: [ClassProvider(ToolService),ClassProvider(AgentiaService),ClassProvider(ExperimentService)],
)
class AppComponent {
  final title = 'Tour of Tools';
}