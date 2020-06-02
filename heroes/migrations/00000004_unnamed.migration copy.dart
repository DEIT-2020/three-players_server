import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration4 extends Migration { 
  @override
  Future upgrade() async {
   
  }
  
  @override
  Future downgrade() async {}
  
 @override
  Future seed() async {
   
    await database.store.execute("INSERT INTO _Experiment (username,userpassword) VALUES ('小红','123456')");
  }

  }
