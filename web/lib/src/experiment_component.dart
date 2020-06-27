import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'experiment.dart';
import 'package:angular_router/angular_router.dart';
// ···
import 'experiment_service.dart';
import 'route_paths.dart';
@Component(
  selector: 'my-experiment',
  directives: [coreDirectives, formDirectives],
  templateUrl: 'experiment_component.html',
styleUrls: ['experiment_component.css'],

)
class ExperimentComponent implements OnActivate {

  Experiment experiment;
  final ExperimentService _experimentService;
final Location _location;
ExperimentComponent(this._experimentService, this._location);

@override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) experiment = await (_experimentService.get(id));
  }
void goBack() => _location.back();
}