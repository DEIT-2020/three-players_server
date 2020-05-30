import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration3 extends Migration { 
  @override
  Future upgrade() async {
   
  }
  
  @override
  Future downgrade() async {}
  
 @override
  Future seed() async {
    final userNames = ["小红", "小绿", "小黄", "小兰", "小紫"];

  for (final userName in userNames) {    
    await database.store.execute("INSERT INTO _User (username) VALUES (@username)", substitutionValues: {
      "username": userName
    });
  }

  }
}