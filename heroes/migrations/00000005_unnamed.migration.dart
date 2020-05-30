import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration5 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("_User", SchemaColumn.relationship("note", ManagedPropertyType.bigInteger, relatedTableName: "_Note", relatedColumnName: "noteid", rule: DeleteRule.nullify, isNullable: true, isUnique: true));
		database.deleteColumn("_User", "userpassword");
		database.alterColumn("_User", "username", (c) {c.isUnique = false;});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    