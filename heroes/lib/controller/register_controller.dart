/*import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/user.dart';
import 'dart:async';
import 'package:aqueduct/managed_auth.dart';

class RegistrationController extends ResourceController {
  RegistrationController(this.context, this.authServer);

  final ManagedContext context;
  final AuthServer authServer;


  @Operation.post()
  Future<Response> createUser(@Bind.body() User user) async {
    if (user.username == null || user.userpassword == null) {
      return Response.badRequest(
        body: {"error": "username and password required."});
    }

    user
      ..salt = AuthUtility.generateRandomSalt()
      ..hashedPassword = authServer.hashPassword(user.userpassword, user.salt);

    return Response.ok(await Query(context, values: user).insert());
  }
}*/
