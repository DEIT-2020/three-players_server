import 'player.dart';
import 'controller/wrongquestion_controller.dart';

class PlayerChannel extends ApplicationChannel {
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
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    router
        .route('/wrongquestions/[:id]')
        .link(() => WrongquestionsController(context));

    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}
