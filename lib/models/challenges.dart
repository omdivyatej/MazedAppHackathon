class Challenge {
  String? title;
  int? challengePeriod;
  int? reward;
  String? description;
  int? level;

  Challenge(
      {required this.title,
      required this.challengePeriod,
      required this.reward,
      required this.description,
      required this.level});
}

class ChallengeAllData {
  final String name;
  final List<Challenge> challenges;

  ChallengeAllData({required this.name, required this.challenges});
}
