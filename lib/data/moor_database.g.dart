// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Message extends DataClass implements Insertable<Message> {
  final String numbers;
  final String messageText;
  final DateTime timestamp;
  Message({this.numbers, this.messageText, this.timestamp});
  factory Message.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Message(
      numbers:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}numbers']),
      messageText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}message_text']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
    );
  }
  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Message(
      numbers: serializer.fromJson<String>(json['numbers']),
      messageText: serializer.fromJson<String>(json['messageText']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'numbers': serializer.toJson<String>(numbers),
      'messageText': serializer.toJson<String>(messageText),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  @override
  MessagesCompanion createCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      numbers: numbers == null && nullToAbsent
          ? const Value.absent()
          : Value(numbers),
      messageText: messageText == null && nullToAbsent
          ? const Value.absent()
          : Value(messageText),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
    );
  }

  Message copyWith({String numbers, String messageText, DateTime timestamp}) =>
      Message(
        numbers: numbers ?? this.numbers,
        messageText: messageText ?? this.messageText,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('numbers: $numbers, ')
          ..write('messageText: $messageText, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(numbers.hashCode, $mrjc(messageText.hashCode, timestamp.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Message &&
          other.numbers == this.numbers &&
          other.messageText == this.messageText &&
          other.timestamp == this.timestamp);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<String> numbers;
  final Value<String> messageText;
  final Value<DateTime> timestamp;
  const MessagesCompanion({
    this.numbers = const Value.absent(),
    this.messageText = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.numbers = const Value.absent(),
    this.messageText = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  MessagesCompanion copyWith(
      {Value<String> numbers,
      Value<String> messageText,
      Value<DateTime> timestamp}) {
    return MessagesCompanion(
      numbers: numbers ?? this.numbers,
      messageText: messageText ?? this.messageText,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  final GeneratedDatabase _db;
  final String _alias;
  $MessagesTable(this._db, [this._alias]);
  final VerificationMeta _numbersMeta = const VerificationMeta('numbers');
  GeneratedTextColumn _numbers;
  @override
  GeneratedTextColumn get numbers => _numbers ??= _constructNumbers();
  GeneratedTextColumn _constructNumbers() {
    return GeneratedTextColumn(
      'numbers',
      $tableName,
      true,
    );
  }

  final VerificationMeta _messageTextMeta =
      const VerificationMeta('messageText');
  GeneratedTextColumn _messageText;
  @override
  GeneratedTextColumn get messageText =>
      _messageText ??= _constructMessageText();
  GeneratedTextColumn _constructMessageText() {
    return GeneratedTextColumn(
      'message_text',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [numbers, messageText, timestamp];
  @override
  $MessagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'messages';
  @override
  final String actualTableName = 'messages';
  @override
  VerificationContext validateIntegrity(MessagesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.numbers.present) {
      context.handle(_numbersMeta,
          numbers.isAcceptableValue(d.numbers.value, _numbersMeta));
    }
    if (d.messageText.present) {
      context.handle(_messageTextMeta,
          messageText.isAcceptableValue(d.messageText.value, _messageTextMeta));
    }
    if (d.timestamp.present) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableValue(d.timestamp.value, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {timestamp};
  @override
  Message map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Message.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MessagesCompanion d) {
    final map = <String, Variable>{};
    if (d.numbers.present) {
      map['numbers'] = Variable<String, StringType>(d.numbers.value);
    }
    if (d.messageText.present) {
      map['message_text'] = Variable<String, StringType>(d.messageText.value);
    }
    if (d.timestamp.present) {
      map['timestamp'] = Variable<DateTime, DateTimeType>(d.timestamp.value);
    }
    return map;
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(_db, alias);
  }
}

abstract class _$MoorDatabase extends GeneratedDatabase {
  _$MoorDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MessagesTable _messages;
  $MessagesTable get messages => _messages ??= $MessagesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [messages];
}
