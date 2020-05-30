import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/agentia.dart';

class AgentiaController extends ResourceController {
  AgentiaController(this.context);

  final ManagedContext context;
  final _agentias = [
    {'agentianame': '硫酸','function':'就随便写点什么'},
    {'agentianame': '盐酸','function':'凑个字数吧'},
    {'agentianame': '氢氧化钠','function':'哈哈哈哈哈哈哈'},
    {'agentianame': '氧气','function':'不知道该说什么'},
    {'agentianame': '氢气','function':'就祝你平安喜乐吧'},    
  ];

    @Operation.get()
Future<Response> getAllAgentias({@Bind.query('agentianame') String agentianame}) async {
  final agentiaQuery = Query<Agentia>(context);
  if (agentianame != null) {
    agentiaQuery.where((h) => h.agentianame).contains(agentianame, caseSensitive: false);
  }
  final agentias = await agentiaQuery.fetch();

  return Response.ok(agentias);
}


  @Operation.get('agentianame')
Future<Response> getAgentiaByID(@Bind.path('agentianame') String agentianame) async {
  final agentiaQuery = Query<Agentia>(context)
    ..where((h) => h.agentianame).equalTo(agentianame);    

  final agentia = await agentiaQuery.fetchOne();

  if (agentia == null) {
    return Response.notFound();
  }
  return Response.ok(agentia);
}


}


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


}
*/