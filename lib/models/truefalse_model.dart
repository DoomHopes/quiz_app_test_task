class TrueFalseQuizModel {
  TrueFalseQuizModel({
    this.id,
    this.question,
    this.rightAnswer,
  });

  int id;
  String question;
  bool rightAnswer;

  factory TrueFalseQuizModel.fromJson(Map<String, dynamic> json) =>
      TrueFalseQuizModel(
        id: json["id"],
        question: json["question"],
        rightAnswer: json["rightAnswer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "rightAnswer": rightAnswer,
      };
}
