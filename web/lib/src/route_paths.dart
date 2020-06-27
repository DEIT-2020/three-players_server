import 'package:angular_router/angular_router.dart';
<<<<<<< HEAD
const idParam = 'id';
class RoutePaths {
  static final tools = RoutePath(path: 'tools');
  static final dashboard = RoutePath(path: 'dashboard');
  static final tool = RoutePath(path: '${tools.path}/:$idParam');
  
=======

const idParam = 'id';
class RoutePaths {
  static final tools = RoutePath(path: 'tools');
  static final notes = RoutePath(path: 'notes');
  static final dashboard = RoutePath(path: 'dashboard');
  static final tool = RoutePath(path: '${tools.path}/:$idParam');
  static final note = RoutePath(path: '${notes.path}/:$idParam');
>>>>>>> d204b4d3dfa9364f94904cd38dfff7760e536ea4
}
int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}