// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatSessionCWProxy {
  ChatSession resultsAsJson(List<String> resultsAsJson);

  ChatSession createdDate(DateTime createdDate);

  ChatSession relations(List<String> relations);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatSession(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatSession call({
    List<String>? resultsAsJson,
    DateTime? createdDate,
    List<String>? relations,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatSession.copyWith.fieldName(...)`
class _$ChatSessionCWProxyImpl implements _$ChatSessionCWProxy {
  const _$ChatSessionCWProxyImpl(this._value);

  final ChatSession _value;

  @override
  ChatSession resultsAsJson(List<String> resultsAsJson) =>
      this(resultsAsJson: resultsAsJson);

  @override
  ChatSession createdDate(DateTime createdDate) =>
      this(createdDate: createdDate);

  @override
  ChatSession relations(List<String> relations) => this(relations: relations);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatSession(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatSession call({
    Object? resultsAsJson = const $CopyWithPlaceholder(),
    Object? createdDate = const $CopyWithPlaceholder(),
    Object? relations = const $CopyWithPlaceholder(),
  }) {
    return ChatSession(
      resultsAsJson:
          resultsAsJson == const $CopyWithPlaceholder() || resultsAsJson == null
              ? _value.resultsAsJson
              // ignore: cast_nullable_to_non_nullable
              : resultsAsJson as List<String>,
      createdDate:
          createdDate == const $CopyWithPlaceholder() || createdDate == null
              ? _value.createdDate
              // ignore: cast_nullable_to_non_nullable
              : createdDate as DateTime,
      relations: relations == const $CopyWithPlaceholder() || relations == null
          ? _value.relations
          // ignore: cast_nullable_to_non_nullable
          : relations as List<String>,
    );
  }
}

extension $ChatSessionCopyWith on ChatSession {
  /// Returns a callable class that can be used as follows: `instanceOfChatSession.copyWith(...)` or like so:`instanceOfChatSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatSessionCWProxy get copyWith => _$ChatSessionCWProxyImpl(this);
}
