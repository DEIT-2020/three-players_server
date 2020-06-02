import 'package:heroes/heroes.dart';
import 'package:heroes/model/experiment.dart';

class Tip extends ManagedObject<_Tip> implements _Tip {}
class _Tip {
  @primaryKey
  int id;

  String name;

  @Relate(#tips,onDelete: DeleteRule.cascade)
  Experiment experiment;
}
