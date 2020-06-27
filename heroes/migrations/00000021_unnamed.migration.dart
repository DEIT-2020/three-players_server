import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration21 extends Migration { 
  @override
  Future upgrade() async {
   
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
    await database.store.execute("INSERT INTO _Experiment (id,name,process) VALUES (1,'酸碱中和','用已知浓度的盐酸来滴定未知浓度的NaOH溶液，以测定NaOH的物质的量浓度。')");
    await database.store.execute("INSERT INTO _Tip (id,name,experiment_id) VALUES (11,'触碰到酸和碱',1)");
    await database.store.execute("INSERT INTO _Tool (id,name,function,link) VALUES (1,'test','test2','test3')");
    await database.store.execute("INSERT INTO _Agentia (id,name,function,link) VALUES (1,'testtest','testtest2','testtest3')");
    await database.store.execute("INSERT INTO _ExperimentTool (id,experiment_id,tool_id) VALUES (1,1,1)");
    await database.store.execute("INSERT INTO _ExperimentAgentia (id,experiment_id,agentia_id) VALUES (1,1,1)");
  }
}
    