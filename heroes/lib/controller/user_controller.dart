import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/user.dart';

class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;
  final _users = [
    {'userid': 11, 'username': '小红','userpassword':'123456'},
    {'userid': 12, 'username': '小绿','userpassword':'133456'},
    {'userid': 13, 'username': '小黄','userpassword':'123656'},
    {'userid': 14, 'username': '小兰','userpassword':'123886'},
    {'userid': 15, 'username': '小紫','userpassword':'123446'},
  ];

  @Operation.get()
Future<Response> getAllUsers({@Bind.query('username') String username}) async {
  final userQuery = Query<User>(context);
  if (username != null) {
    userQuery.where((h) => h.username).contains(username, caseSensitive: false);
  }
  final users = await userQuery.fetch();

  return Response.ok(users);
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
Future<Response> createUser(@Bind.body(ignore: ["userid"]) User inputUser) async {
  final query = Query<User>(context)
    ..values = inputUser;

  final insertedUser = await query.insert();

  return Response.ok(insertedUser);
}



}


/*class UserController extends ResourceController {
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



}
*/