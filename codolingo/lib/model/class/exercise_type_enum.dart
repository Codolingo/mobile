enum CodolingoExerciseTypeEnum {
  mcqExercise("MCQ_EXERCISE"),
  blockExercise("BLOCK_EXERCISE"),
  inputExercise("INPUT_EXERCISE"),
  linkingExercise("LINKING_EXERCISE"),
  comparatingExercise("COMPARATING_EXERCISE");

  const CodolingoExerciseTypeEnum(this.apiValue);

  final String apiValue;
}
