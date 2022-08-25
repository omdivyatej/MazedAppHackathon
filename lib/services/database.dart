import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mazed_health_app/models/my_challenges.dart';
import 'package:mazed_health_app/models/user_model.dart';
import 'package:mazed_health_app/screens/home/leaderboard_model.dart';

import "dart:math";

import '../models/challenges.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference challengesCollection =
      FirebaseFirestore.instance.collection("challenges");

  //-----------------------------------------------------Profile-------------------------------------------------
  Future<void> profileCreation() async{
    List<String> nameList = ["Arun","Seema","Arunia","Fira","Alok","Singhal"];
    var name = (nameList..shuffle()).first;
    print(name);
    List<int> totalCoinsList= [100,350,456,765,543,123,865,876,544];
    var total_coins= (totalCoinsList..shuffle()).first;
    print(total_coins);
    List<int> level_list= [0,1,2,3,4,5,6,7,8,9,10];
    var level = (level_list..shuffle()).first;
    print(level);
    var ref = userCollection.doc(uid).set({
      "name":name,
      "total_coins":total_coins,
      "level":level,
    });
   return await ref;
  }

  //-------------------------------------------------------homepageData-------------------------------------------------

  //Stream - Get Homepage User Data
  Stream<UserData?> get userHomeData {
    return userCollection.doc(uid).snapshots().map(convertToUserDataModel);
  }

  //Convert Stream Homepage Data to UserDataModel
  UserData convertToUserDataModel(DocumentSnapshot documentSnapshot) {
    return UserData(
        uid: uid,
        level: documentSnapshot['level'],
        name: documentSnapshot['name'],
        totalCoins: documentSnapshot['total_coins']);
  }

  //----------------------------------------------------Challenges---------------------------------------------------------------

  //Stream - Get All challenges data
  Stream<List<Challenge?>> get allChallengesStream2 {
    return challengesCollection
        .doc("all")
        .snapshots()
        .map(convertToChallengeObject);
  }

  // convert firestore data to a list of Challenge objects
  List<Challenge> convertToChallengeObject(DocumentSnapshot documentSnapshot) {
    final ref = documentSnapshot.get("Challenges") as List<dynamic>;
    return ref.map((data) {
      return Challenge(
        title: data["title"] ?? "",
        challengePeriod: data["challengePeriod"] ?? 0,
        reward: data?["reward"] ?? 0,
        description: data?["description"] ?? "",
        level: data?["level"] ?? 0,
      );
    }).toList();
  }


  // Join Challenge
  Future<void> joinChallenge(String title, String description)async {
    var val=[];
    var data= {
      "title":title,
      "description":description,
    };
    val.add(data);
    print(val);
    userCollection.doc(uid).update({
      "MyChallenges": FieldValue.arrayUnion(val),
    });

  }

  //---------------------------------------------------MyChallenges------------------------------------------------------

// Stream My Challenges
  Stream<List<MyChallenges?>> get myChallengesStream {
    try {
      print("keutta");
      print(
          userCollection.doc(uid).snapshots().map(convertToMyChallengeObject));
      return userCollection
          .doc(uid)
          .snapshots()
          .map(convertToMyChallengeObject);
    } catch (e) {
      print(e.toString());
      return Stream.error(e);
    }
  }

  // convert firestore data to a list of MyChallenge objects
  List<MyChallenges> convertToMyChallengeObject(
      DocumentSnapshot documentSnapshot) {
    final ref = documentSnapshot.get("MyChallenges") as List<dynamic>;
    print(ref);
    return ref.map((data) {
      // Timestamp stamp = data["time_joined"];
      // DateTime date = stamp.toDate();
      return MyChallenges(
        title: data["title"] ?? "",
        description: data["description"] ?? "",
        time_period: data["time_period"] ?? 0,
        reward: data["reward"] ?? 0,
        status: data["status"] ?? 0,
        calories: data["calories"] ?? 0,
        sessions: data["sessions"] ?? 0,

        everyday: data["everyday"] ?? false,
      );
    }).toList();
  }

//----------------------------------------------------Leaderboard------------------------------------------------------------
  Stream<List<Leaderboard>> get listOfUserNameRanking {
    return userCollection
        .orderBy("total_coins", descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((e) {
        return Leaderboard(userName: e["name"]);
      }).toList();
    });
  }
}
