import 'package:heroes/heroes.dart';
import 'package:heroes/model/experiment.dart';

class ExperimentTool extends ManagedObject<_ExperimentTool> implements _ExperimentTool {}
class _ExperimentTool {
  @primaryKey
  int id;  

  @Relate(#experimentTool)
  Experiment experiment;

  @Relate(#experimentTool)
  Tool tool;
}


class Tool extends ManagedObject<_Tool> implements _Tool {}

class _Tool {
  @primaryKey
  int toolid;

  @Column(unique: true)
  String toolname;

    @Column(unique: true)
  String function;

   ManagedSet<ExperimentTool> experimentTools;


}

