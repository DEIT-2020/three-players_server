import 'package:heroes/heroes.dart';
import 'package:heroes/model/user.dart';

class TNote extends ManagedObject<_TNote> implements _TNote {}

class _TNote {
  @primaryKey
  int noteid;

  @Column(unique: true)
  String notename;

  @Column(unique: true)
  String notecontent;

  @Relate(#tnotes)
  Tuser tuser;



}