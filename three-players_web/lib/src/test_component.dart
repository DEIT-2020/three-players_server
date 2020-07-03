import 'package:angular/angular.dart';
import 'package:angular_components/utils/color/material.dart';
import 'test_service.dart';
import 'test.dart';
import 'route_paths.dart';
import 'routes.dart';
import 'mock_test.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'search_component.dart';

@Component(
  selector: 'my-tests',
  templateUrl: 'test_component.html',
  styleUrls: ['test_component.css'],
  // ···
  directives: [coreDirectives, routerDirectives, formDirectives],
  exports: [RoutePaths, Routes],
  providers: [WrongquestionService],
  pipes: [commonPipes],
)
class TestComponent {
  //List<int> lista = [1, 2, 3, 4, 5, 6];
  var lista;
  int a1 = 0;
  int a2 = 0;
  int a3 = 0;
  int a4 = 0;
  int a5 = 0;
  int a6 = 0;
  int i = 0;
  String a, b, c, d, e, f;
  int sum = 0;
  bool hadTest = false;
  bool hadReview = false;
  bool hadScore = false;
  bool hadSend = false;
  List<Test> tests = mockTests;
  Test selected;
  final Router _router;
  String errorMessage;
  List<Wrongquestion> wrongquestions = [];
  final WrongquestionService _wrongquestionService;
  TestComponent(this._wrongquestionService, this._router);
  /*final TestService _testService;
  TestComponent(this._testService);*/

  void dotest() {
    hadTest = true;
    hadReview = false;
    hadScore = false;
  }

  Future<void> _getWrongquestions() async {
    hadReview = true;
    hadScore = false;
    hadTest = false;
    wrongquestions = await _wrongquestionService.getAll();
  }

  void review() => _getWrongquestions();

  //hadTest = false;
  //hadScore = false;
  //var wrongquestionUrl = 'http://127.0.0.1:8888/wrongquestions';
  // var result = await http.get('${wrongquestionUrl}/');
  //if (result.statusCode == 200) {
  //  print(jsonDecode(result.body)['wrongquestion[]']);
  //  a = jsonDecode(result.body)['wrongquestion[]'];
  //} else {
  //  print("失败");
  //}

  /* {
    hadReview = true;
    hadTest = false;
    hadScore = false;
    _getWrongquestions();
  }*/

  int onAnswer1(dynamic event) {
    if (event.target.value == '是') {
      a1 = 1;
    } else {
      a1 = 0;
    }
    return (a1);
  }

  int onAnswer2(dynamic event) {
    if (event.target.value == '红棕色') {
      a2 = 1;
    } else {
      a2 = 0;
    }
    return (a2);
  }

  int onAnswer3(dynamic event) {
    if (event.target.value == '是') {
      a3 = 1;
    } else {
      a3 = 0;
    }
    return (a3);
  }

  int onAnswer4(dynamic event) {
    if (event.target.value == '红色') {
      a4 = 1;
    } else {
      a4 = 0;
    }
    return (a4);
  }

  int onAnswer5(dynamic event) {
    if (event.target.value == '化学反应') {
      a5 = 1;
    } else {
      a5 = 0;
    }
    return (a5);
  }

  int onAnswer6(dynamic event) {
    if (event.target.value == '盐') {
      a6 = 1;
    } else {
      a6 = 0;
    }
    return (a6);
  }

  List judge() {
    sum = a1 + a2 + a3 + a4 + a5 + a6;
    hadTest = false;
    hadReview = false;
    hadScore = true;
    if (a1 == 0)
      a = "你答错了";
    else
      a = "你答对了";

    if (a2 == 0)
      b = "你答错了";
    else
      b = "你答对了";

    if (a3 == 0)
      c = "你答错了";
    else
      c = "你答对了";

    if (a4 == 0)
      d = "你答错了";
    else
      d = "你答对了";

    if (a5 == 0)
      e = "你答错了";
    else
      e = "你答对了";

    if (a6 == 0)
      f = "你答错了";
    else
      f = "你答对了";

    lista = [a, b, c, d, e, f];

    return (lista);
  }

  int static(i) {
    i = i + 1;
    return (i);
  }

  void onSelect(Test test) => selected = test;
  void re() {
    hadSend = true;
  }

  int onAnswer7(dynamic event) {}
  int onAnswer8(dynamic event) {}
  int onAnswer9(dynamic event) {}

  Future<void> add(String question, String answer, String knowledge) async {
    question = question.trim();
    answer = answer.trim();
    knowledge = knowledge.trim();
    if (question.isEmpty | answer.isEmpty | knowledge.isEmpty) return null;
    try {
      wrongquestions
          .add(await _wrongquestionService.create(question, answer, knowledge));
    } catch (e) {
      errorMessage = e.toString();
    }
  }

  Future<void> delete(Wrongquestion wrongquestion) async {
    await _wrongquestionService.delete(wrongquestion.id);
    wrongquestions.remove(wrongquestion);
    if (selected == wrongquestion) selected = null;
  }
}
