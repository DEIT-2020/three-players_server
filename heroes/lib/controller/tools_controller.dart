import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class ToolsController extends Controller {
  final _tools = [
    {'id': 11, 'name': '锥形瓶'},
    {'id': 12, 'name': '试管'},
    {'id': 13, 'name': '滴管'},
    {'id': 14, 'name': '酒精灯'},
    {'id': 15, 'name': '烧杯'},    
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_tools);
  }
   @Operation.get('id')
Future<Response> getToolByID(@Bind.path('id') int id) async {
  final toolQuery = Query<Tool>(context)
    ..where((h) => h.id).equalTo(id);    

  final tool = await toolQuery.fetchOne();

  if (tool == null) {
    return Response.notFound();
  }
  return Response.ok(tool);
}

}
