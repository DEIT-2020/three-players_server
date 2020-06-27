import 'package:angular_router/angular_router.dart';
import 'tool_component.template.dart' as tool_template;
import 'agentia_component.template.dart' as agentia_template;
import 'experiment_component.template.dart' as experiment_template;
import 'route_paths.dart';
import 'tool_list_component.template.dart' as tool_list_template;
import 'agentia_list_component.template.dart' as agentia_list_template;
import 'experiment_list_component.template.dart' as experiment_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
export 'route_paths.dart';

class Routes {
  static final tools = RouteDefinition(
    routePath: RoutePaths.tools,
    component: tool_list_template.ToolListComponentNgFactory,
  );
  static final agentias = RouteDefinition(
    routePath: RoutePaths.agentias,
    component: agentia_list_template.AgentiaListComponentNgFactory,
  );
  static final experiments = RouteDefinition(
    routePath: RoutePaths.experiments,
    component: experiment_list_template.ExperimentListComponentNgFactory,
  );
static final dashboard = RouteDefinition(
  routePath: RoutePaths.dashboard,
  component: dashboard_template.DashboardComponentNgFactory,
);
static final tool = RouteDefinition(
  routePath: RoutePaths.tool,
  component: tool_template.ToolComponentNgFactory,
);
static final agentia = RouteDefinition(
  routePath: RoutePaths.agentia,
  component: agentia_template.AgentiaComponentNgFactory,
);
static final experiment = RouteDefinition(
  routePath: RoutePaths.experiment,
  component: experiment_template.ExperimentComponentNgFactory,
);

  static final all = <RouteDefinition>[
   tool,
    dashboard,
    tools,
    
     RouteDefinition.redirect(
    path: '',
    redirectTo: RoutePaths.dashboard.toUrl(),
  ),

  ];


}