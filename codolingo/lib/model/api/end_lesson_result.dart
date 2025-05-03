class EndLessonResult {
  static const String starsField = "nbStarsUnlocked";
  static const String progressField = "progression";

  int stars;
  double progress;

  EndLessonResult({required this.stars, required this.progress});
}
