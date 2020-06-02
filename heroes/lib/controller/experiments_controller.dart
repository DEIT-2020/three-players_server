import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/experiment.dart';


class ExperimentsController extends ResourceController {
  ExperimentsController(this.context);

  final ManagedContext context;
  final _experiments = [
    {'id': 11, 'name': '酸碱中和'},
    {'id': 12, 'name': '在氧气中燃烧'},

  ];

  @Operation.get()
Future<Response> getAllExperiments({@Bind.query('name') String name}) async {
  final experimentQuery = Query<Experiment>(context);
  if (name != null) {
    experimentQuery.where((h) => h.name).contains(name, caseSensitive: false);
  }
  final experiments = await experimentQuery.fetch();

  return Response.ok(experiments);
}

 @Operation.get('id')
Future<Response> getHeroByID(@Bind.path('id') int id) async {
  final experimentQuery = Query<Experiment>(context)
    ..where((h) => h.id).equalTo(id);    

  final experiment = await experimentQuery.fetchOne();

  if (experiment == null) {
    return Response.notFound();
  }
  return Response.ok(experiment);
}
}