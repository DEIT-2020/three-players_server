import 'tool.dart';
import 'mock_tools.dart';

class ToolService {
  Future<List<Tool>> getAll() async => mockTools;
Future<Tool> get(int id) async =>
    (await getAll()).firstWhere((tool) => tool.id == id);
}