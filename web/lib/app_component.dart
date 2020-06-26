import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'src/tool_service.dart';
import 'src/tool_list_component.dart';
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

    <a [routerLink]="RoutePaths.notes.toUrl()"
       [routerLinkActive]="'active'">Note</a>

  </nav>
  <router-outlet [routes]="Routes.all"></router-outlet>
''',

 directives: [routerDirectives],
 exports: [RoutePaths, Routes],
  providers: [ClassProvider(ToolService)],
)
class AppComponent {
  final title = 'Tour of Tools';
}