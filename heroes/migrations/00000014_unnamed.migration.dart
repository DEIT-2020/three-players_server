import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration14 extends Migration { 
  @override
  Future upgrade() async {
   
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
await database.store.execute("INSERT INTO _Tuser (id,name,password) VALUES (1,'lyj','123456')");
await database.store.execute("INSERT INTO _TNote (noteid,notename,notecontent,tuser_id) VALUES (11,'硫酸实验','碰到手躲开',1)");
  }
}
    