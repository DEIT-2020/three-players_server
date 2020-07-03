import 'package:heroes/heroes.dart';

class Question extends ManagedObject<_Question> implements _Question {}

class _Question {
  @primaryKey
  int id;

  @Column(unique: true)
  String question;

  @Column(unique: true)
  String answer;
}
