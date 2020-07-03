import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';

import 'note_list_component.template.dart' as note_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
import 'note_component.template.dart' as note_template;
import 'tool_component.template.dart' as tool_template;
import 'agentia_component.template.dart' as agentia_template;
import 'experiment_component.template.dart' as experiment_template;
import 'test_component.template.dart' as test_template;

export 'route_paths.dart';

class Routes {
  static final notes = RouteDefinition(
    routePath: RoutePaths.notes,
    component: note_list_template.NoteListComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final note = RouteDefinition(
    routePath: RoutePaths.note,
    component: note_template.NoteComponentNgFactory,
  );

//
  static final agentia = RouteDefinition(
    routePath: RoutePaths.agentia,
    component: agentia_template.AgentiaComponentNgFactory,
  );
  static final experiment = RouteDefinition(
    routePath: RoutePaths.experiment,
    component: experiment_template.ExperimentComponentNgFactory,
  );
  static final tool = RouteDefinition(
    routePath: RoutePaths.tool,
    component: tool_template.ToolComponentNgFactory,
  );
//测试test
  static final test = RouteDefinition(
    routePath: RoutePaths.test,
    component: test_template.TestComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    notes,
    dashboard,
    note,
//
    tool,
    agentia,
    experiment,
    //测试test
    test,

    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
