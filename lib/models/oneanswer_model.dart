class OneAnswerQuizModel {
  OneAnswerQuizModel({
    this.id,
    this.question,
    this.answers,
    this.rightAnswer,
  });

  int id;
  String question;
  List<String> answers;
  String rightAnswer;

  factory OneAnswerQuizModel.fromJson(Map<String, dynamic> json) =>
      OneAnswerQuizModel(
        id: json["id"],
        question: json["question"],
        answers: List<String>.from(json["answers"].map((x) => x)),
        rightAnswer: json["rightAnswer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x)),
        "rightAnswer": rightAnswer,
      };
}
