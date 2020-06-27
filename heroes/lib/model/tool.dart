import 'package:heroes/heroes.dart';
import 'package:heroes/model/experiment.dart';

class ExperimentTool extends ManagedObject<_ExperimentTool> implements _ExperimentTool {}
class _ExperimentTool {
  @primaryKey
  int id;  

  @Relate(#experimentTools)
  Experiment experiment;

  @Relate(#experimentTools)
  Tool tool;
}

class Tool extends ManagedObject<_Tool> implements _Tool {}

class _Tool {
  @primaryKey
 int id;

  //@Column(unique: true)
  String name;

  @Column(unique: true)
  String function;

 @Column(unique: true)
  String link;
ManagedSet<ExperimentTool> experimentTools;
}