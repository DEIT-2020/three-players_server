import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/tips.dart';
import 'package:heroes/model/experiment.dart';

class TipsController extends ResourceController {
  TipsController(this.context);

  final ManagedContext context;
  final _tips = [
  {'id':1,'experiment.id':11,'name':'酸有强腐蚀性，注意不要触碰到皮肤。'},
  {'id':2,'experiment.id':11,'name':'氢氧化钠有强腐蚀性，不要触碰到皮肤。'},
  {'id':3,'experiment.id':12,'name':'燃烧实验比较危险，注意安全。'}
  ];
  @Operation.get()
Future<Response> getAllTips({@Bind.query('name') String name}) async {
  final tipQuery = Query<Tip>(context);
  if (name != null) {
    tipQuery.where((h) => h.name).contains(name, caseSensitive: false);
  }
  final tips = await tipQuery.fetch();

  return Response.ok(tips);
}
 @Operation.get('id')
Future<Response> getTipByID(@Bind.path('id') int id) async {
  final tipQuery = Query<Tip>(context)
    ..where((h) => h.id).equalTo(id);    

  final tip = await tipQuery.fetchOne();

  if (tip == null) {
    return Response.notFound();
  }
  return Response.ok(tip);
}


  


}
