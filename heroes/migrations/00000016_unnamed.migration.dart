import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration16 extends Migration { 
  @override
  Future upgrade() async {
   		database.deleteTable("_Agentia");
		database.deleteTable("_Tip");
		database.deleteTable("_Experiment");
		database.deleteTable("_Tool");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    