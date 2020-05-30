import 'package:heroes/heroes.dart';
import 'package:heroes/model/note.dart';
import 'package:aqueduct/managed_auth.dart';
class User extends ManagedObject<_User> 
    implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input:true, output:false)//只能输入不能输出
  String userpassword;//密码
}
 
  class _User extends ResourceOwnerTableDefinition {



 @primaryKey
  int userid;

 ManagedSet<Note> notes;

}
