// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatSessionCWProxy {
  ChatSession createdDate(DateTime createdDate);

  ChatSession relations(List<String> relations);

  ChatSession resultsAsJson(List<String> resultsAsJson);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatSession(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatSession call({
    DateTime? createdDate,
    List<String>? relations,
    List<String>? resultsAsJson,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatSession.copyWith.fieldName(...)`
class _$ChatSessionCWProxyImpl implements _$ChatSessionCWProxy {
  final ChatSession _value;

  const _$ChatSessionCWProxyImpl(this._value);

  @override
  ChatSession createdDate(DateTime createdDate) =>
      this(createdDate: createdDate);

  @override
  ChatSession relations(List<String> relations) => this(relations: relations);

  @override
  ChatSession resultsAsJson(List<String> resultsAsJson) =>
      this(resultsAsJson: resultsAsJson);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatSession(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatSession call({
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? relations = const $CopyWithPlaceholder(),
    Object? resultsAsJson = const $CopyWithPlaceholder(),
  }) {
    return ChatSession(
      createdDate:
          createdDate == const $CopyWithPlaceholder() || createdDate == null
              ? _value.createdDate
              // ignore: cast_nullable_to_non_nullable
              : createdDate as DateTime,
      relations: relations == const $CopyWithPlaceholder() || relations == null
          ? _value.relations
          // ignore: cast_nullable_to_non_nullable
          : relations as List<String>,
      resultsAsJson:
          resultsAsJson == const $CopyWithPlaceholder() || resultsAsJson == null
              ? _value.resultsAsJson
              // ignore: cast_nullable_to_non_nullable
              : resultsAsJson as List<String>,
    );
  }
}

extension $ChatSessionCopyWith on ChatSession {
  /// Returns a callable class that can be used as follows: `instanceOfChatSession.copyWith(...)` or like so:`instanceOfChatSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatSessionCWProxy get copyWith => _$ChatSessionCWProxyImpl(this);
}
