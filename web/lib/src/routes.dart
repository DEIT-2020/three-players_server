import 'package:angular_router/angular_router.dart';
import 'tool_component.template.dart' as tool_template;
import 'route_paths.dart';
import 'tool_list_component.template.dart' as tool_list_template;
import 'dashboard_component.template.dart' as dashboard_template;
export 'route_paths.dart';

class Routes {
  static final tools = RouteDefinition(
    routePath: RoutePaths.tools,
    component: tool_list_template.ToolListComponentNgFactory,
  );
static final dashboard = RouteDefinition(
  routePath: RoutePaths.dashboard,
  component: dashboard_template.DashboardComponentNgFactory,
);
  static final tool = RouteDefinition(
  routePath: RoutePaths.tool,
  component: tool_template.ToolComponentNgFactory,
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