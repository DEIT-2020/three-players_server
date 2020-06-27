import 'experiment.dart';
import 'mock_experiments.dart';

class ExperimentService {
  Future<List<Experiment>> getAll() async => mockExperiments;
Future<Experiment> get(int id) async =>
    (await getAll()).firstWhere((experiment) => experiment.id == id);
}