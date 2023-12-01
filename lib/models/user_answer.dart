class UserAnswer {
  final String name;
  final String answer;
  final int points;

  UserAnswer(this.name, this.answer, this.points);

  factory UserAnswer.fromJson(Map<String, dynamic> json) {
    return UserAnswer(json['name'], json['answer'], json['points']);
  }
}
