import 'package:angular_router/angular_router.dart';
const idParam = 'id';
class RoutePaths {
  static final tools = RoutePath(path: 'tools');
  static final dashboard = RoutePath(path: 'dashboard');
  static final tool = RoutePath(path: '${tools.path}/:$idParam');
  static final agentias = RoutePath(path: 'agentias');
  static final agentia = RoutePath(path: '${agentias.path}/:$idParam');
  static final experiments = RoutePath(path: 'experiments');
  static final experiment = RoutePath(path: '${experiments.path}/:$idParam');
  
}
int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}