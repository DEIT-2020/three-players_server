import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';


import 'route_paths.dart';

class Exam{
  final int id;
  String name;
  String choice;
  String answer;

Exam(this.id,this.name,this.choice,this.answer);
}

final mockExams = <Exam>[
  Exam(1,'氢气燃烧的颜色是？','''A.红色 B.淡蓝色 C.蓝绿色 D.黄色''','B'),
  Exam(2,'盐酸的化学式是？','''A.HCL B.H2SO4 C.HNO3 D.HCI''','A'),
  Exam(3,'下列不属于氢氧化钠的性质的是？',
  '''A.白色固体
  B.有强烈的腐蚀性
  C.溶于水时放出大量的热
  D.微溶于水''',
  'D'),
  Exam(4,'下列不是氢氧化钠俗称的是？','''A．火碱 B．烧碱 C．苛性钠 D．纯碱''','D'),
];

@Component(
  selector: 'my-exam',
  directives: [coreDirectives, formDirectives],
  templateUrl: 'exam_component.html',
  styleUrls: ['exam_component.css'],

)

int suijishu(){
String xstr = '1234';
String result = '';
result = result + xstr[Random().nextInt(xstr.length)];
int y=int.parse(result);
return y;
}



class ExamComponent {
  
Exam exam;
  
}