import 'agentia.dart';
import 'mock_agentias.dart';

class AgentiaService {
  Future<List<Agentia>> getAll() async => mockAgentias;
  Future<Agentia> get(int id) async =>
      (await getAll()).firstWhere((agentia) => agentia.id == id);
}
