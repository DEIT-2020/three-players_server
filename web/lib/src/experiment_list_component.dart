import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
//import 'src/todo_list/todo_list_component.dart';
import 'experiment.dart';
import 'mock_experiments.dart';
import 'package:angular_forms/angular_forms.dart';
import 'experiment_component.dart';
import 'experiment_service.dart';
import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-experiments',
   directives: [coreDirectives],
  styleUrls: ['experiment_list_component.css'],
 templateUrl: 'experiment_list_component.html',
providers: [ClassProvider(ExperimentService)],
pipes: [commonPipes],

  //directives: [TodoListComponent],
)
class ExperimentListComponent implements OnInit {
  /*void ngOnInit() => _getExperiments();


 final title='tour of experiments';
 List<Experiment> experiments;
 // List<Experiment> experiments = mockExperiments;
 void _getExperiments() {
 _experimentService.getAll().then((experiments) => this.experiments = experiments);

}

Experiment selected;
void onSelect(Experiment experiment) => selected = experiment;
final ExperimentService _experimentService;
ExperimentListComponent(this._experimentService);
Future<NavigationResult> gotoDetail() => null;*/
 //Experiment experiment= Experiment(01, '实验室制取氢气','实验室制取氢气常用锌与稀硫酸反应，化学式：Zn+H2SO4=ZnSO4+H2↑','https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=544048339,151333493&fm=26&gp=0.jpg');
final title='tour of experiments';
 final ExperimentService _experimentService;
  final Router _router;
  List<Experiment> experiments;
  Experiment selected;

  ExperimentListComponent(this._experimentService, this._router);

  Future<void> _getExperiments() async {
    experiments = await _experimentService.getAll();
  }

  void ngOnInit() => _getExperiments();

  void onSelect(Experiment experiment) => selected = experiment;

  String _experimentUrl(int id) =>
      RoutePaths.experiment.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_experimentUrl(selected.id));
}