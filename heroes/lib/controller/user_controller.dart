import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';

class HeroesController extends ResourceController {
   HeroesController(this.context);

  final ManagedContext context;


  @Operation.get()
Future<Response> getAllUsers({@Bind.query('name') String name}) async {
  final heroQuery = Query<Hero>(context);
  if (name != null) {
    heroQuery.where((h) => h.name).contains(name, caseSensitive: false);
  }
  final heroes = await heroQuery.fetch();

  return Response.ok(heroes);
}

 @Operation.get('id')
Future<Response> getHeroByID(@Bind.path('id') int id) async {
  final userQuery = Query<User>(context)
    ..where((h) => h.id).equalTo(id);    

  final hero = await userQuery.fetchOne();

  if (hero == null) {
    return Response.notFound();
  }
  return Response.ok(user);
}

@Operation.post()
Future<Response> createHero(@Bind.body(ignore: ["id"]) User inputUser) async {
  final query = Query<User>(context)
    ..values = inputUser;

  final insertedUser = await query.insert();

  return Response.ok(insertedUser);
}



}
