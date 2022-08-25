class UserModel {
  final String uid;

  UserModel({required this.uid});
}

class UserData {
  final String uid;
  final int level;
  final String name;
  final int totalCoins;

  UserData(
      {required this.uid,
      required this.level,
      required this.name,
      required this.totalCoins}
      );
}
