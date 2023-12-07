class UserAnswer {
  final String name;
  final String answer;
  final int points;
  final int partialPoints;

  UserAnswer(this.name, this.answer, this.points, this.partialPoints);

  factory UserAnswer.fromJson(Map<String, dynamic> json) {
    return UserAnswer(json['name'], json['answer'], json['points'], json['partial_points']);
  }
}
