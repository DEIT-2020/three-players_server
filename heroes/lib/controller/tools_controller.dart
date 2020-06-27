import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/tool.dart';

class ToolsController extends ResourceController {
  ToolsController(this.context);

  final ManagedContext context;
  final _tools = [
    {'id': 1, 'name': '烧杯','function':'放溶液'},
    {'id': 2, 'name': '试管','function':'放少量的溶液'},
    {'id': 4, 'name':'酒精灯','function':'进行加热'}   
  ];

  /*@override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_tools);
  }*/

   @Operation.get()
Future<Response> getAllTools({@Bind.query('name') String name}) async {
  final toolQuery = Query<Tool>(context);
  if (name != null) {
    toolQuery.where((h) => h.name).contains(name, caseSensitive: false);
  }
  final tools = await toolQuery.fetch();

  return Response.ok(tools);
}

 /*@Operation.get('toolid')
Future<Response> getToolByID(@Bind.path('id') int id) async {
  final toolQuery = Query<Tool>(context)
    ..where((h) => h.id).equalTo(id);    

  final tool = await toolQuery.fetchOne();

  if (tool == null) {
    return Response.notFound();
  }
  return Response.ok(tool);
}
 @Operation.get('name')
Future<Response> getNoteByNAME(@Bind.path('name') String name) async {
  final toolQuery = Query<Tool>(context)
    ..where((h) => h.name).equalTo(name);    

  final tool = await toolQuery.fetchOne();

  if (tool == null) {
    return Response.notFound();
  }
  return Response.ok(tool);
}*/
}
