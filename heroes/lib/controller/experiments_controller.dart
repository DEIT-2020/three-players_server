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
}
