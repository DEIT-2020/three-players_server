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
    final query = Query<Experiment>(context)
      ..where((t) => t.id).equalTo(1)
      ..join(set: (t) => t.experimentTools).join(object: (tp) => tp.tool)
      ..join(set: (t) => t.experimentAgentias).join(object: (tp) => tp.agentia)
      ..join(set: (a) => a.tips);
    final experiment = await query.fetch();

    return Response.ok(experiment);
  }
}

/* @Operation.get('id')
Future<Response> getHeroByID(@Bind.path('id') int id) async {
  final experimentQuery = Query<Experiment>(context)
    ..where((h) => h.id).equalTo(id);    

  final experiment = await experimentQuery.fetchOne();

  if (experiment == null) {
    return Response.notFound();
  }
  return Response.ok(experiment);
}

@Operation.get('id')
Future<Response> getExperimentToolByID(@Bind.path('id') int id) async {
  final query = Query<Experiment>(context)
  ..join(set: (a) => a.experimentTools);
  final experiment = await query.fetch();

  return Response.ok(experiment);
  }

@Operation.get('id')
Future<Response> getExperimentTipsByID(@Bind.path('id') int id) async {
final query = Query<Experiment>(context)
  ..join(set: (a) => a.tips);
  final experiment = await query.fetch();

  return Response.ok(experiment);
  }

@Operation.get('id')
Future<Response> getExperimentAgentiaByID(@Bind.path('id') int id) async {
final query = Query<Experiment>(context)
  ..join(set: (a) => a.experimentAgentias);
  final experiment = await query.fetch();

  return Response.ok(experiment);
  }*/
