import 'package:angular_router/angular_router.dart';

const idParam = 'id';
class RoutePaths {
  static final tools = RoutePath(path: 'tools');
  static final notes = RoutePath(path: 'notes');
  static final dashboard = RoutePath(path: 'dashboard');
  static final tool = RoutePath(path: '${tools.path}/:$idParam');
  static final note = RoutePath(path: '${notes.path}/:$idParam');
}
int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}