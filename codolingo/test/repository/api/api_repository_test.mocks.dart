// Mocks generated by Mockito 5.4.4 from annotations
// in codolingo/test/services/api/api_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;

import 'package:codolingo/model/class/chapter.dart' as _i3;
import 'package:codolingo/model/class/exercise.dart' as _i7;
import 'package:codolingo/model/class/exercise_type_enum.dart' as _i12;
import 'package:codolingo/model/class/lesson.dart' as _i5;
import 'package:codolingo/model/class/linking_exercise.dart' as _i9;
import 'package:codolingo/model/class/mcq_exercise.dart' as _i8;
import 'package:codolingo/model/class/module.dart' as _i4;
import 'package:codolingo/model/class/theme.dart' as _i2;
import 'package:codolingo/services/api/api_service.dart' as _i10;
import 'package:codolingo/transformers/class/answer_transformer.dart' as _i6;
import 'package:codolingo/transformers/class/chapter_transformer.dart' as _i14;
import 'package:codolingo/transformers/class/exercise_transformer.dart' as _i17;
import 'package:codolingo/transformers/class/lesson_transformer.dart' as _i16;
import 'package:codolingo/transformers/class/module_transformer.dart' as _i15;
import 'package:codolingo/transformers/class/theme_transformer.dart' as _i13;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCodolingoTheme_0 extends _i1.SmartFake
    implements _i2.CodolingoTheme {
  _FakeCodolingoTheme_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCodolingoChapter_1 extends _i1.SmartFake
    implements _i3.CodolingoChapter {
  _FakeCodolingoChapter_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCodolingoModule_2 extends _i1.SmartFake
    implements _i4.CodolingoModule {
  _FakeCodolingoModule_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCodolingoLesson_3 extends _i1.SmartFake
    implements _i5.CodolingoLesson {
  _FakeCodolingoLesson_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCodolingoAnswerElementTransformer_4 extends _i1.SmartFake
    implements _i6.CodolingoAnswerElementTransformer {
  _FakeCodolingoAnswerElementTransformer_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCodolingoExercise_5 extends _i1.SmartFake
    implements _i7.CodolingoExercise {
  _FakeCodolingoExercise_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCodolingoMCQExercise_6 extends _i1.SmartFake
    implements _i8.CodolingoMCQExercise {
  _FakeCodolingoMCQExercise_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCodolingoLinkingExercise_7 extends _i1.SmartFake
    implements _i9.CodolingoLinkingExercise {
  _FakeCodolingoLinkingExercise_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i10.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.Future<dynamic> fetchThemes() => (super.noSuchMethod(
        Invocation.method(
          #fetchThemes,
          [],
        ),
        returnValue: _i11.Future<dynamic>.value(),
      ) as _i11.Future<dynamic>);

  @override
  _i11.Future<dynamic> fetchChapters({required int? themeId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchChapters,
          [],
          {#themeId: themeId},
        ),
        returnValue: _i11.Future<dynamic>.value(),
      ) as _i11.Future<dynamic>);

  @override
  _i11.Future<dynamic> fetchModules({required int? chapterId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchModules,
          [],
          {#chapterId: chapterId},
        ),
        returnValue: _i11.Future<dynamic>.value(),
      ) as _i11.Future<dynamic>);

  @override
  _i11.Future<dynamic> fetchLessons({required int? moduleId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchLessons,
          [],
          {#moduleId: moduleId},
        ),
        returnValue: _i11.Future<dynamic>.value(),
      ) as _i11.Future<dynamic>);

  @override
  _i11.Future<dynamic> startLesson({required int? lessonId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #startLesson,
          [],
          {#lessonId: lessonId},
        ),
        returnValue: _i11.Future<dynamic>.value(),
      ) as _i11.Future<dynamic>);

  @override
  _i11.Future<dynamic> endLesson({required int? lessonId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #endLesson,
          [],
          {#lessonId: lessonId},
        ),
        returnValue: _i11.Future<dynamic>.value(),
      ) as _i11.Future<dynamic>);

  @override
  _i11.Future<dynamic> answerQuestion({
    required _i12.CodolingoExerciseTypeEnum? exercice,
    required int? questionId,
    required dynamic answer,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #answerQuestion,
          [],
          {
            #exercice: exercice,
            #questionId: questionId,
            #answer: answer,
          },
        ),
        returnValue: _i11.Future<dynamic>.value(),
      ) as _i11.Future<dynamic>);

  @override
  _i11.Future<bool> login({
    required String? username,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #username: username,
            #password: password,
          },
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);
}

/// A class which mocks [CodolingoThemeTransformer].
///
/// See the documentation for Mockito's code generation for more information.
class MockCodolingoThemeTransformer extends _i1.Mock
    implements _i13.CodolingoThemeTransformer {
  MockCodolingoThemeTransformer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.CodolingoTheme fromJson(Map<String, dynamic>? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [data],
        ),
        returnValue: _FakeCodolingoTheme_0(
          this,
          Invocation.method(
            #fromJson,
            [data],
          ),
        ),
      ) as _i2.CodolingoTheme);

  @override
  List<_i2.CodolingoTheme> fromListJson(List<dynamic>? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromListJson,
          [data],
        ),
        returnValue: <_i2.CodolingoTheme>[],
      ) as List<_i2.CodolingoTheme>);
}

/// A class which mocks [CodolingoChapterTransformer].
///
/// See the documentation for Mockito's code generation for more information.
class MockCodolingoChapterTransformer extends _i1.Mock
    implements _i14.CodolingoChapterTransformer {
  MockCodolingoChapterTransformer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CodolingoChapter fromJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [data],
        ),
        returnValue: _FakeCodolingoChapter_1(
          this,
          Invocation.method(
            #fromJson,
            [data],
          ),
        ),
      ) as _i3.CodolingoChapter);

  @override
  List<_i3.CodolingoChapter> fromListJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromListJson,
          [data],
        ),
        returnValue: <_i3.CodolingoChapter>[],
      ) as List<_i3.CodolingoChapter>);
}

/// A class which mocks [CodolingoModuleTransformer].
///
/// See the documentation for Mockito's code generation for more information.
class MockCodolingoModuleTransformer extends _i1.Mock
    implements _i15.CodolingoModuleTransformer {
  MockCodolingoModuleTransformer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.CodolingoModule fromJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [data],
        ),
        returnValue: _FakeCodolingoModule_2(
          this,
          Invocation.method(
            #fromJson,
            [data],
          ),
        ),
      ) as _i4.CodolingoModule);

  @override
  List<_i4.CodolingoModule> fromListJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromListJson,
          [data],
        ),
        returnValue: <_i4.CodolingoModule>[],
      ) as List<_i4.CodolingoModule>);
}

/// A class which mocks [CodolingoLessonTransformer].
///
/// See the documentation for Mockito's code generation for more information.
class MockCodolingoLessonTransformer extends _i1.Mock
    implements _i16.CodolingoLessonTransformer {
  MockCodolingoLessonTransformer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.CodolingoLesson fromJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [data],
        ),
        returnValue: _FakeCodolingoLesson_3(
          this,
          Invocation.method(
            #fromJson,
            [data],
          ),
        ),
      ) as _i5.CodolingoLesson);

  @override
  List<_i5.CodolingoLesson> fromListJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromListJson,
          [data],
        ),
        returnValue: <_i5.CodolingoLesson>[],
      ) as List<_i5.CodolingoLesson>);
}

/// A class which mocks [CodolingoExerciseTransformer].
///
/// See the documentation for Mockito's code generation for more information.
class MockCodolingoExerciseTransformer extends _i1.Mock
    implements _i17.CodolingoExerciseTransformer {
  MockCodolingoExerciseTransformer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.CodolingoAnswerElementTransformer get answerElementTransformer =>
      (super.noSuchMethod(
        Invocation.getter(#answerElementTransformer),
        returnValue: _FakeCodolingoAnswerElementTransformer_4(
          this,
          Invocation.getter(#answerElementTransformer),
        ),
      ) as _i6.CodolingoAnswerElementTransformer);

  @override
  set answerElementTransformer(
          _i6.CodolingoAnswerElementTransformer? _answerElementTransformer) =>
      super.noSuchMethod(
        Invocation.setter(
          #answerElementTransformer,
          _answerElementTransformer,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.CodolingoExercise fromJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [data],
        ),
        returnValue: _FakeCodolingoExercise_5(
          this,
          Invocation.method(
            #fromJson,
            [data],
          ),
        ),
      ) as _i7.CodolingoExercise);

  @override
  _i8.CodolingoMCQExercise fromMCQJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromMCQJson,
          [data],
        ),
        returnValue: _FakeCodolingoMCQExercise_6(
          this,
          Invocation.method(
            #fromMCQJson,
            [data],
          ),
        ),
      ) as _i8.CodolingoMCQExercise);

  @override
  _i9.CodolingoLinkingExercise fromLinkingJson(dynamic data) =>
      (super.noSuchMethod(
        Invocation.method(
          #fromLinkingJson,
          [data],
        ),
        returnValue: _FakeCodolingoLinkingExercise_7(
          this,
          Invocation.method(
            #fromLinkingJson,
            [data],
          ),
        ),
      ) as _i9.CodolingoLinkingExercise);

  @override
  List<_i7.CodolingoExercise> fromListJson(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #fromListJson,
          [data],
        ),
        returnValue: <_i7.CodolingoExercise>[],
      ) as List<_i7.CodolingoExercise>);
}
