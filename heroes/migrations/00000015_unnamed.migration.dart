import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration15 extends Migration { 
  @override
  Future upgrade() async {
    database.deleteTable("_ExperimentAgentia");
    database.deleteTable("_ExperimentTool");
   
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    