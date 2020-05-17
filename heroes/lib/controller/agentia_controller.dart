import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class AgentiaController extends Controller {
  final _agentias = [
    {'id': 11, 'name': '硫酸','function':''},
    {'id': 12, 'name': '盐酸','function':''},
    {'id': 13, 'name': '氢氧化钠','function':''},
    {'id': 14, 'name': '氧气','function':''},
    {'id': 15, 'name': '氢气','function':''},    
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_agentias);
  }
     @Operation.get('id')
Future<Response> getAgentiaByID(@Bind.path('id') int id) async {
  final agentiaQuery = Query<Agentia>(context)
    ..where((h) => h.id).equalTo(id);    

  final agentia = await agentiaQuery.fetchOne();

  if (agentia == null) {
    return Response.notFound();
  }
  return Response.ok(agentia);
}

}
