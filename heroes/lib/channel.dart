import 'heroes.dart';
import 'controller/agentia_controller.dart';
import 'controller/heroes_controller.dart';
import 'controller/experiments_controller.dart';
import 'controller/user_controller.dart';
import 'controller/notes_controller.dart';
import 'package:heroes/controller/register_controller.dart';
import 'package:heroes/model/user.dart';
import 'controller/tools_controller.dart';
//import 'package:aqueduct/managed_auth.dart';
import 'controller/tips_controller.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class HeroesChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  ManagedContext context;
  AuthServer authServer;
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = HeroConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, persistentStore);
    //final authStorage = ManagedAuthDelegate<User>(context);
    // authServer = AuthServer(authStorage);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    /*router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });
     
     
      router
      .route("/notes")//笔记
      .link(()=>NotesController(context));
      router
      .route("/user")
      .link(()=>UserController(context));

       router
      .route("/registration")
      .link(()=>RegistrationController(context, authServer));*/
    router.route("/heroes/[:id]").link(() => HeroesController(context));
    router.route("/experiments").link(() => ExperimentsController(context));
    router
        .route("/agentias") //试剂
        .link(() => AgentiaController(context));
    router.route("/tip").link(() => TipsController(context));
    router
        .route("/tools") //试剂
        .link(() => ToolsController(context));
    // router.route("/user").link(() => UserController(context));
    router.route("/user/[:id]").link(() => UserController(context));
    router
        .route("/notes") //笔记
        .link(() => NotesController(context));
    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}
