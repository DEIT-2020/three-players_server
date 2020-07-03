import 'package:angular_router/angular_router.dart';
import 'tool_component.template.dart' as tool_template;
//<<<<<<< HEAD
import 'route_paths.dart';
//=======
import 'agentia_component.template.dart' as agentia_template;
import 'experiment_component.template.dart' as experiment_template;
//>>>>>>> d204b4d3dfa9364f94904cd38dfff7760e536ea4
import 'dashboard_component.template.dart' as dashboard_template;
export 'route_paths.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';

import 'dashboard_component.template.dart' as dashboard_template;

export 'route_paths.dart';

class Routes {
  ///<<<<<<< HEAD
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );
  static final agentia = RouteDefinition(
    routePath: RoutePaths.agentia,
    component: agentia_template.AgentiaComponentNgFactory,
  );
  static final experiment = RouteDefinition(
    routePath: RoutePaths.experiment,
    component: experiment_template.ExperimentComponentNgFactory,
  );

//=======

  //static final notes = RouteDefinition(
  //routePath: RoutePaths.notes,
  //component: note_list_template.NoteListComponentNgFactory,
  //);

  //static final dashboard = RouteDefinition(
  // routePath: RoutePaths.dashboard,
  //component: dashboard_template.DashboardComponentNgFactory,
//);

//>>>>>>> d204b4d3dfa9364f94904cd38dfff7760e536ea4
  static final tool = RouteDefinition(
    routePath: RoutePaths.tool,
    component: tool_template.ToolComponentNgFactory,
  );

//<<<<<<< HEAD
  //static final all = <RouteDefinition>[
  //tool,
//=======
  //static final note = RouteDefinition(
  //routePath: RoutePaths.note,
  //component: note_template.NoteComponentNgFactory,
//);

  static final all = <RouteDefinition>[
    tool,
//>>>>>>> d204b4d3dfa9364f94904cd38dfff7760e536ea4
    dashboard,
    agentia,
    experiment,

    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
