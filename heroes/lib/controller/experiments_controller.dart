import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class ExperimentsController extends Controller {
  final _experiments = [
    {'id': 11, 'name': '氧气的制取'},
    {'id': 12, 'name': '氢气还原氢氧化铜'},
    {'id': 13, 'name': '二氧化碳的制取'},
    {'id': 14, 'name': '酸碱中和'},
    {'id': 15, 'name': '金属与酸'},    
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_experiments);
  }
  
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

@Operation.post()
Future<Response> createExperiment(@Bind.body(ignore: ["id"]) Experiment inputExperiment) async {
  final query = Query<Experiment>(context)
    ..values = inputExperiment;

  final insertedExperiment = await query.insert();

  return Response.ok(insertedExperiment);
}

}
