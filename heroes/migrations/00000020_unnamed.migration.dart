import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration20 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("_Experiment", SchemaColumn("process", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    