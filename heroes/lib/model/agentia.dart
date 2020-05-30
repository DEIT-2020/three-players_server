import 'package:heroes/heroes.dart';
import 'package:heroes/model/experiment.dart';

class ExperimentAgentia extends ManagedObject<_ExperimentAgentia> implements _ExperimentAgentia {}
class _ExperimentAgentia {
  @primaryKey
  int id;  

  @Relate(#experimentAgentia)
  Experiment experiment;

  @Relate(#experimentAgentia)
  Agentia agentia;
}

class Agentia extends ManagedObject<_Agentia> implements _Agentia {}

class _Agentia {
  //@primaryKey
 // int agentiaid;

  //@Column(unique: true)
  @primaryKey
  String agentianame;

  @Column(unique: true)
  String function;

ManagedSet<ExperimentAgentia> experimentAgentias;
}