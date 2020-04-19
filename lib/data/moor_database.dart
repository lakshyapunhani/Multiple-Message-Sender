import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

// Define tables that can model a database of recipes.

class Messages extends Table{
  TextColumn get numbers => text().nullable()();
  TextColumn get messageText => text().nullable()();
  DateTimeColumn get timestamp => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {timestamp};

}

@UseMoor(
  tables: [Messages],
)
class MoorDatabase extends _$MoorDatabase {
  MoorDatabase()
  // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    // Good for debugging - prints SQL in the console
    logStatements: true,
  )));

  @override
  int get schemaVersion => 1;

  Future<List<Message>> getAllMessages() => select(messages).get();
  Stream<List<Message>> watchAllMessages() => select(messages).watch();
  Future insertMessage(Message message) => into(messages).insert(message);
  Future replaceMessage(Message message) => update(messages).replace(message);
  Future deleteMessage(Message message) => delete(messages).delete(message);
}