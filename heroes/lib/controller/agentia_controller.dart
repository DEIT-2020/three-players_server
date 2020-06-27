
import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/agentia.dart';

class AgentiaController extends ResourceController {
  AgentiaController(this.context);

  final ManagedContext context;
  final _agentias = [
    {'id':'1','name': '硫酸','function':'腐蚀金属，与碱中和。'},
    {'id':'2','name': '盐酸','function':'与金属反应，与碱中和。'},
    {'id':'3','name': '氢氧化钠','function':'与酸中和'},
    
  ];

    @Operation.get()
Future<Response> getAllAgentias({@Bind.query('agentianame') String name}) async {
  final agentiaQuery = Query<Agentia>(context);
  if (name != null) {
    agentiaQuery.where((h) => h.name).contains(name, caseSensitive: false);
  }
  final agentias = await agentiaQuery.fetch();

  return Response.ok(agentias);
}


 /* @Operation.get('agentianame')
Future<Response> getAgentiaByID(@Bind.path('agentianame') String agentianame) async {
  final agentiaQuery = Query<Agentia>(context)
    ..where((h) => h.name).equalTo(agentianame);    

  final agentia = await agentiaQuery.fetchOne();

  if (agentia == null) {
    return Response.notFound();
  }
  return Response.ok(agentia);
}


}

*/
/*class AgentiaController extends ResourceController {
  AgentiaController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllAgentia() async {
    final agentiaQuery = Query<Agentia>(context);
    final agentia = await agentiaQuery.fetch();

    return Response.ok(agentia);
  }

 @Operation.get('agentianame')
Future<Response> getAgentiaByNAME(@Bind.path('agentianame') int agentianame) async {
  final agentiaQuery = Query<Agentia>(context)
    ..where((h) => h.agentianame).equalTo(agentianame);    

  final agentia = await agentiaQuery.fetchOne();

  if (agentia == null) {
    return Response.notFound();
  }
  return Response.ok(agentia);
}
}*/

}