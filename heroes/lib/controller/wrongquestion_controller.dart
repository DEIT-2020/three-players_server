import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/wrongquestion.dart';

class QuestionController extends ResourceController {
  QuestionController(this.context);

  final ManagedContext context;
  final _questions = [
    {'id': 1, 'question': '1+1=', 'answer': '2'},
  ];
}
