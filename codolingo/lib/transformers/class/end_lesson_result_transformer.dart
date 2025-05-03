import 'package:codolingo/model/api/end_lesson_result.dart';

class EndLessonResultTransformer {
  EndLessonResult fromJson(dynamic data) {
    return EndLessonResult(stars: data[EndLessonResult.starsField], progress: data[EndLessonResult.progressField]);
  }
}
