import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';

class TipsController extends Controller {
  final _tips = [
    {'id': 11, 'name': ''},
    {'id': 12, 'name': ''},
    {'id': 13, 'name': ''},
    {'id': 14, 'name': ''},
    {'id': 15, 'name': ''},    
  ];

  @override
  Future<RequestOrResponse> handle(Request request) async {
    return Response.ok(_tips);
  }

   @Operation.get()
Future<Response> getAllTips({@Bind.query('name') String name}) async {
  final heroQuery = Query<Tip>(context);
  if (name != null) {
    heroQuery.where((h) => h.name).contains(name, caseSensitive: false);
  }
  final tips = await heroQuery.fetch();

  return Response.ok(tips);
}
}