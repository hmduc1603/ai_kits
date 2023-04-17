// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/chat_gpt/entity/chat_session.dart';
import 'src/chat_gpt/entity/prompting_entity.dart';
import 'src/stable_diffusion/entity/image_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 933623351675514438),
      name: 'ImageResult',
      lastPropertyId: const IdUid(5, 7495192306881828374),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5273499039132726855),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5897523025735225399),
            name: 'input',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1481903636559386332),
            name: 'result',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6356996361923861959),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7495192306881828374),
            name: 'isSavedToGallery',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 6198307822093762743),
      name: 'PromptingEntity',
      lastPropertyId: const IdUid(9, 6676325693206209312),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5816841400169067289),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3084487448590898194),
            name: 'rawType',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4563947995518516633),
            name: 'prompt',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3410915321083980630),
            name: 'input',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4748008928688650399),
            name: 'hashtags',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7918178413562807527),
            name: 'mood',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4182708392515938844),
            name: 'result',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 1413941100749591194),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 6676325693206209312),
            name: 'hasError',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 525896355937857294),
      name: 'ChatSession',
      lastPropertyId: const IdUid(5, 5969696846256470571),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7248663862844725630),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 8541672966602051204),
            name: 'createdDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 238554322190816895),
            name: 'resultsAsJson',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5969696846256470571),
            name: 'relations',
            type: 30,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 525896355937857294),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [4579458851321007951],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ImageResult: EntityDefinition<ImageResult>(
        model: _entities[0],
        toOneRelations: (ImageResult object) => [],
        toManyRelations: (ImageResult object) => {},
        getId: (ImageResult object) => object.id,
        setId: (ImageResult object, int id) {
          object.id = id;
        },
        objectToFB: (ImageResult object, fb.Builder fbb) {
          final inputOffset = fbb.writeString(object.input);
          final resultOffset = fbb.writeString(object.result);
          fbb.startTable(6);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, inputOffset);
          fbb.addOffset(2, resultOffset);
          fbb.addInt64(3, object.createdDate.millisecondsSinceEpoch);
          fbb.addBool(4, object.isSavedToGallery);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ImageResult(
              input: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              result: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              createdDate: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)))
            ..id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4)
            ..isSavedToGallery =
                const fb.BoolReader().vTableGet(buffer, rootOffset, 12, false);

          return object;
        }),
    PromptingEntity: EntityDefinition<PromptingEntity>(
        model: _entities[1],
        toOneRelations: (PromptingEntity object) => [],
        toManyRelations: (PromptingEntity object) => {},
        getId: (PromptingEntity object) => object.id,
        setId: (PromptingEntity object, int id) {
          object.id = id;
        },
        objectToFB: (PromptingEntity object, fb.Builder fbb) {
          final rawTypeOffset = fbb.writeString(object.rawType);
          final promptOffset = fbb.writeString(object.prompt);
          final inputOffset = fbb.writeString(object.input);
          final hashtagsOffset = fbb.writeList(
              object.hashtags.map(fbb.writeString).toList(growable: false));
          final moodOffset =
              object.mood == null ? null : fbb.writeString(object.mood!);
          final resultOffset =
              object.result == null ? null : fbb.writeString(object.result!);
          fbb.startTable(10);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, rawTypeOffset);
          fbb.addOffset(2, promptOffset);
          fbb.addOffset(3, inputOffset);
          fbb.addOffset(4, hashtagsOffset);
          fbb.addOffset(5, moodOffset);
          fbb.addOffset(6, resultOffset);
          fbb.addInt64(7, object.createdDate.millisecondsSinceEpoch);
          fbb.addBool(8, object.hasError);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = PromptingEntity(
              mood: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              prompt: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              id: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              input: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              rawType: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              result: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 16),
              createdDate: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0)),
              hasError: const fb.BoolReader().vTableGet(buffer, rootOffset, 20, false),
              hashtags: const fb.ListReader<String>(fb.StringReader(asciiOptimization: true), lazy: false).vTableGet(buffer, rootOffset, 12, []));

          return object;
        }),
    ChatSession: EntityDefinition<ChatSession>(
        model: _entities[2],
        toOneRelations: (ChatSession object) => [],
        toManyRelations: (ChatSession object) => {},
        getId: (ChatSession object) => object.id,
        setId: (ChatSession object, int id) {
          object.id = id;
        },
        objectToFB: (ChatSession object, fb.Builder fbb) {
          final resultsAsJsonOffset = fbb.writeList(object.resultsAsJson
              .map(fbb.writeString)
              .toList(growable: false));
          final relationsOffset = fbb.writeList(
              object.relations.map(fbb.writeString).toList(growable: false));
          fbb.startTable(6);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(2, object.createdDate.millisecondsSinceEpoch);
          fbb.addOffset(3, resultsAsJsonOffset);
          fbb.addOffset(4, relationsOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ChatSession(
              resultsAsJson: const fb.ListReader<String>(
                      fb.StringReader(asciiOptimization: true),
                      lazy: false)
                  .vTableGet(buffer, rootOffset, 10, []),
              createdDate: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0)),
              relations: const fb.ListReader<String>(
                      fb.StringReader(asciiOptimization: true),
                      lazy: false)
                  .vTableGet(buffer, rootOffset, 12, []))
            ..id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ImageResult] entity fields to define ObjectBox queries.
class ImageResult_ {
  /// see [ImageResult.id]
  static final id =
      QueryIntegerProperty<ImageResult>(_entities[0].properties[0]);

  /// see [ImageResult.input]
  static final input =
      QueryStringProperty<ImageResult>(_entities[0].properties[1]);

  /// see [ImageResult.result]
  static final result =
      QueryStringProperty<ImageResult>(_entities[0].properties[2]);

  /// see [ImageResult.createdDate]
  static final createdDate =
      QueryIntegerProperty<ImageResult>(_entities[0].properties[3]);

  /// see [ImageResult.isSavedToGallery]
  static final isSavedToGallery =
      QueryBooleanProperty<ImageResult>(_entities[0].properties[4]);
}

/// [PromptingEntity] entity fields to define ObjectBox queries.
class PromptingEntity_ {
  /// see [PromptingEntity.id]
  static final id =
      QueryIntegerProperty<PromptingEntity>(_entities[1].properties[0]);

  /// see [PromptingEntity.rawType]
  static final rawType =
      QueryStringProperty<PromptingEntity>(_entities[1].properties[1]);

  /// see [PromptingEntity.prompt]
  static final prompt =
      QueryStringProperty<PromptingEntity>(_entities[1].properties[2]);

  /// see [PromptingEntity.input]
  static final input =
      QueryStringProperty<PromptingEntity>(_entities[1].properties[3]);

  /// see [PromptingEntity.hashtags]
  static final hashtags =
      QueryStringVectorProperty<PromptingEntity>(_entities[1].properties[4]);

  /// see [PromptingEntity.mood]
  static final mood =
      QueryStringProperty<PromptingEntity>(_entities[1].properties[5]);

  /// see [PromptingEntity.result]
  static final result =
      QueryStringProperty<PromptingEntity>(_entities[1].properties[6]);

  /// see [PromptingEntity.createdDate]
  static final createdDate =
      QueryIntegerProperty<PromptingEntity>(_entities[1].properties[7]);

  /// see [PromptingEntity.hasError]
  static final hasError =
      QueryBooleanProperty<PromptingEntity>(_entities[1].properties[8]);
}

/// [ChatSession] entity fields to define ObjectBox queries.
class ChatSession_ {
  /// see [ChatSession.id]
  static final id =
      QueryIntegerProperty<ChatSession>(_entities[2].properties[0]);

  /// see [ChatSession.createdDate]
  static final createdDate =
      QueryIntegerProperty<ChatSession>(_entities[2].properties[1]);

  /// see [ChatSession.resultsAsJson]
  static final resultsAsJson =
      QueryStringVectorProperty<ChatSession>(_entities[2].properties[2]);

  /// see [ChatSession.relations]
  static final relations =
      QueryStringVectorProperty<ChatSession>(_entities[2].properties[3]);
}
