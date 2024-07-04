class QuestionEntities {
  final int id;
  final String nameQuestion;
  final num point;

  QuestionEntities(this.id, this.nameQuestion, this.point);

  static List<QuestionEntities> mockDataQuestions() {
    return [
      QuestionEntities(1, "cau hoi 1", 10),
      QuestionEntities(1, "cau hoi 3", 10),
      QuestionEntities(1, "cau hoi 4", 10)
    ];
  }
}
