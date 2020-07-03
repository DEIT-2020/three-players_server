import 'package:angular_router/angular_router.dart';

const idParam = 'id';


class RoutePaths {

  static final dashboard = RoutePath(path: 'dashboard');
  
  static final notes = RoutePath(path: 'notes');

  static final note = RoutePath(path: '${notes.path}/note:$idParam');
  //
  static final tool = RoutePath(path: '${dashboard.path}/tool:$idParam');

  static final agentia = RoutePath(path: '${dashboard.path}/agentia:$idParam');

  static final experiment =RoutePath(path: '${dashboard.path}/experiment:$idParam');
//测试test
static final test = RoutePath(path: 'test');

}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}

