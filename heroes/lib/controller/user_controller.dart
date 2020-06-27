import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/user.dart';
import 'package:heroes/model/note.dart';

class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;
  final _tusers = [
    {'userid': 1, 'username': 'lyj', 'userpassword': '123456'},
    {'userid': 2, 'username': '小绿', 'userpassword': '133456'},
    {'userid': 3, 'username': '小黄', 'userpassword': '123656'},
    {'userid': 4, 'username': '小兰', 'userpassword': '123886'},
    {'userid': 5, 'username': '小紫', 'userpassword': '123446'},
  ];

  @Operation.get()
  Future<Response> getAllUsers({@Bind.query('name') String name}) async {
    final query = Query<Tuser>(context)..join(set: (a) => a.tnotes);
    final users = await query.fetch();

    return Response.ok(users);
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int id) async {
    final query = Query<Tuser>(context)
      //..where((h) => h.id).equalTo(id);
      ..join(set: (a) => a.tnotes);

    final user = await query.fetchOne();

    if (user == null) {
      return Response.notFound();
    }
    return Response.ok(user);
  }
}
/*@Operation.get('id')
    Future<Response> getUserByID(@Bind.path('id') int id) async {
      final userQuery = Query<Tuser>(context)..where((h) => h.id).equalTo(id);

      final oneuser = await userQuery.fetchOne();

      if (oneuser == null) {
        return Response.notFound();
      }
      return Response.ok(oneuser);
    }*/
/* @Operation.get()
  Future<Response> getAllNotes({@Bind.query('id') String id}) async {
    final query = Query<TNote>(context)
      ..where((b) => b.noteid).equalTo(1)
      ..join(object: (a) => a.tuser);
    final notes = await query.fetch();

    return Response.ok(notes);
  }*/
/*
 @Operation.get('id')
Future<Response> getUserByID(@Bind.path('id') int id) async {
  final userQuery = Query<User>(context)
    ..where((h) => h.id).equalTo(id);    

  final user = await userQuery.fetchOne();

  if (user == null) {
    return Response.notFound();
  }
  return Response.ok(user);
}

@Operation.post()
Future<Response> createUser(@Bind.body(ignore: ["id"]) User inputUser) async {
  final query = Query<User>(context)
    ..values = inputUser;

  final insertedUser = await query.insert();

  return Response.ok(insertedUser);
}



}


class UserController extends ResourceController {
   UserController(this.context);

  final ManagedContext context;


  @Operation.get()
  Future<Response> getAllUsers() async {
    final heroQuery = Query<User>(context);
    final heroes = await heroQuery.fetch();

    return Response.ok(heroes);
  }

 @Operation.get('userid')
Future<Response> getUserByID(@Bind.path('userid') int userid) async {
  final userQuery = Query<User>(context)
    ..where((h) => h.userid).equalTo(userid);    

  final user = await userQuery.fetchOne();

  if (user == null) {
    return Response.notFound();
  }
  return Response.ok(user);
}

@Operation.post()
Future<Response> createUser() async {
  final Map<String, dynamic> body = await request.body.decode();
  final query = Query<User>(context)
    ..values.username = body['username'] as String;

  final createUser = await query.insert();

  return Response.ok(createUser);
}

*/
