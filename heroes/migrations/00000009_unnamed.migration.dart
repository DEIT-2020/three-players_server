import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration9 extends Migration { 
  @override
  Future upgrade() async {
   
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {
  
    await database.store.execute("INSERT INTO _Agentia (id,name,function) VALUES (1,'硫酸','腐蚀金属，与碱中和。')");

    
  

  }
}
    