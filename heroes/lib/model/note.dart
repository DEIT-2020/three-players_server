import 'package:heroes/heroes.dart';
import 'package:heroes/model/user.dart';

class Note extends ManagedObject<_Note> implements _Note {}

class _Note {
  @primaryKey
  int noteid;

  @Column(unique: true)
  String notename;

  @Column(unique: true)
  String notecontent;

  @Relate(#notes)
  User user;



}