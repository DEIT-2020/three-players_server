import 'package:heroes/heroes.dart';
import 'package:heroes/model/experiment.dart';

class ExperimentAgentia extends ManagedObject<_ExperimentAgentia> implements _ExperimentAgentia {}
class _ExperimentAgentia {
  @primaryKey
  int id;  

  @Relate(#experimentAgentias)
  Experiment experiment;

  @Relate(#experimentAgentias)
  Agentia agentia;
}

class Agentia extends ManagedObject<_Agentia> implements _Agentia {}

class _Agentia {
  @primaryKey
 int id;

  //@Column(unique: true)
  String name;

  @Column(unique: true)
  String function;

ManagedSet<ExperimentAgentia> experimentAgentias;
}