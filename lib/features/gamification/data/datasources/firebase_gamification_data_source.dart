import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diga/features/gamification/data/datasources/gamification_remote_data_source.dart';
import 'package:diga/features/gamification/domain/models/gamification_profile.dart';
import 'package:diga/features/gamification/domain/models/leaderboard_entry.dart';

class FirebaseGamificationDataSource implements GamificationRemoteDataSource {
  FirebaseGamificationDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<GamificationProfile?> fetchProfile(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).collection('gamification').doc('profile').get();
    final data = doc.data();
    if (data == null) return null;
    return GamificationProfile.fromJson(data);
  }

  @override
  Future<List<LeaderboardEntry>?> fetchLeaderboard() async {
    // Backend contract ready. Return null for now to let repository fallback to mock ranking.
    return null;
  }

  @override
  Future<void> upsertProfile(GamificationProfile profile) async {
    await _firestore
        .collection('users')
        .doc(profile.userId)
        .collection('gamification')
        .doc('profile')
        .set(profile.toJson(), SetOptions(merge: true));
  }
}
