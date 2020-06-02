import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration6 extends Migration { 
  @override
  Future upgrade() async {
   	
		database.createTable(SchemaTable("_Tip", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_Experiment", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("name", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
	
		database.addColumn("_Tip", SchemaColumn.relationship("experiment", ManagedPropertyType.bigInteger, relatedTableName: "_Experiment", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
    final tipNames = ["酸有强腐蚀性，注意不要触碰到皮肤。", "氢氧化钠有强腐蚀性，不要触碰到皮肤。", "燃烧实验比较危险，注意安全。"];

  for (final tipName in tipNames) {    
    await database.store.execute("INSERT INTO _Tip (name) VALUES (@name)", substitutionValues: {
      "name": tipName
    });
  }

  }
 

  }
  