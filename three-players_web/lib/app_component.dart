import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'src/tool_service.dart';
import 'src/agentia_service.dart';
import 'src/experiment_service.dart';
import 'src/routes.dart';

import 'package:angular_components/angular_components.dart';
import 'src/note_service.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'app_component.css'
  ],
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
    MaterialTemporaryDrawerComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialButtonComponent,
    MaterialProgressComponent,
    MaterialStepperComponent,
    StepDirective,
    SummaryDirective
  ],
  providers: [ClassProvider(NoteService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = '初中生化学实验宝典';
}
