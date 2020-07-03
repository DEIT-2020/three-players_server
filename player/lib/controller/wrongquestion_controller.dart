import 'package:aqueduct/aqueduct.dart';
import 'package:player/player.dart';
import 'package:player/model/wrongquestion.dart';

class WrongquestionsController extends ResourceController {
  WrongquestionsController(this.context);

  final ManagedContext context;
  final _wrongquestions = [
    {'id': 1, 'question': '1+1=', 'answer': '2', 'knowlege': '因为1+1=2，所以1+1=2'},
  ];

  @Operation.get()
  Future<Response> getAllWrongquestions(
      {@Bind.query('question') String question}) async {
    final wrongquestionQuery = Query<Wrongquestion>(context);
    if (question != null) {
      wrongquestionQuery
          .where((h) => h.question)
          .contains(question, caseSensitive: false);
    }
    final wrongquestions = await wrongquestionQuery.fetch();

    return Response.ok(wrongquestions);
  }

  @Operation.get('id')
  Future<Response> getWrongquestionByID(@Bind.path('id') int id) async {
    final wrongquestionQuery = Query<Wrongquestion>(context)
      ..where((h) => h.id).equalTo(id);

    final wrongquestion = await wrongquestionQuery.fetchOne();

    if (wrongquestion == null) {
      return Response.notFound();
    }
    return Response.ok(wrongquestion);
  }

  @Operation.post()
  Future<Response> createWrongquestion() async {
    final wrongquestion = Wrongquestion()
      ..read(await request.body.decode(), ignore: ["id"]);
    final query = Query<Wrongquestion>(context)..values = wrongquestion;

    final insertedWrongquestion = await query.insert();

    return Response.ok(insertedWrongquestion);
  }

  /* @Operation.delete()
  Future<Response> deleteWrongquestion(@Bind.body() int id) async {
    final query = Query<Wrongquestion>(context)..where((u) => u.id).equalTo(id);

    int wrongquestionsDeleted = await query.delete();

    return Response.ok(wrongquestionsDeleted);
  }*/
  @Operation.delete('id')
  Future<Response> deleteArticleById(@Bind.path('id') int id) async {
    final query = Query<Wrongquestion>(context)..where((a) => a.id).equalTo(id);
    final result = await query.delete();
    if (result != null && result == 1) {
      return Response.ok("删除成功");
    } else {
      return Response.ok("删除失败，数据不存在");
    }
  }
}
