class Test {
  int id;
  String question;
  String answer;
  String knowledge;
  String correct;
  Test(this.id, this.knowledge, this.question, this.answer, this.correct);
}

class Wrongquestion {
  final int id;
  String question;
  String answer;
  String knowledge;

  Wrongquestion(this.id, this.question, this.answer, this.knowledge);

  factory Wrongquestion.fromJson(Map<String, dynamic> wrongquestion) =>
      Wrongquestion(_toInt(wrongquestion['id']), wrongquestion['question'],
          wrongquestion['answer'], wrongquestion['knowledge']);

  Map toJson() => {
        'id': id,
        'question': question,
        'answer': answer,
        'knowledge': knowledge
      };
}

int _toInt(id) => id is int ? id : int.parse(id);
