import 'package:player/player.dart';

class Wrongquestion extends ManagedObject<_Wrongquestion>
    implements _Wrongquestion {}

class _Wrongquestion {
  @primaryKey
  int id;

  @Column(unique: true)
  String question;

  @Column(unique: true)
  String answer;

  @Column(unique: true)
  String knowledge;
}
