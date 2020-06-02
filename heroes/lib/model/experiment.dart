import 'package:heroes/heroes.dart';
import 'package:heroes/model/tool.dart';
import 'package:heroes/model/agentia.dart';
import 'package:heroes/model/tips.dart';
class Experiment extends ManagedObject<_Experiment> implements _Experiment {}

class _Experiment {
  //@primaryKey
 // int agentiaid;

  //@Column(unique: true)
  @primaryKey
  int id;

  String name;

ManagedSet<ExperimentTool> experimentTools;

ManagedSet<ExperimentAgentia> experimentAgentias;

 ManagedSet<Tip> tips;

}