import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration8 extends Migration { 
  @override
  Future upgrade() async {
    	database.deleteColumn("_Agentia", "agentianame");
   database.addColumn("_Agentia", SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false));
		database.addColumn("_Agentia", SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false));
    database.createTable(SchemaTable("_ExperimentAgentia", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false)]));
		
    database.addColumn("_ExperimentAgentia", SchemaColumn.relationship("experiment", ManagedPropertyType.bigInteger, relatedTableName: "_Experiment", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_ExperimentAgentia", SchemaColumn.relationship("agentia", ManagedPropertyType.bigInteger, relatedTableName: "_Agentia", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.deleteTable("_User");
		database.deleteTable("_Note");
	
	
		database.alterColumn("_Tip", "experiment", (c) {c.deleteRule = DeleteRule.cascade;});
  }
  
  @override
  Future downgrade() async {}
  
  
  Future seed() async {
   final agentiaNames = ["硫酸", "盐酸", "氢氧化钠"];

  for (final agentiaName in agentiaNames) {    
    await database.store.execute("INSERT INTO _Agentia (name) VALUES (@name)", substitutionValues: {
      "name": agentiaName
    });
  }



  }
}
    