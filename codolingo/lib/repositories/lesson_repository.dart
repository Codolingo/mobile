abstract class LessonRepository {
  int getStarsBySuccess(double successRate);
}

class LessonRepositoryImpl implements LessonRepository {
  int getStarsBySuccess(double successRate) {
    switch (successRate) {
      case <= 0.5:
        return 0;
      case <= 0.75:
        return 1;
      case <= 0.9:
        return 2;
      default:
        return 3;
    }
  }
}
