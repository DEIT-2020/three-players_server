import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class AgentiaController extends Controller {
  final _agentias = [
    {'id': 11, 'name': '硫酸'},
    {'id': 12, 'name': '盐酸'},
    {'id': 13, 'name': '氢氧化钠'},
    {'id': 14, 'name': '氧气'},
    {'id': 15, 'name': '氢气'},    
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_agentias);
  }
}
