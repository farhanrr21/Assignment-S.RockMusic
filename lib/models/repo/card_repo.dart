import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:srock_music/models/model/card_model.dart';

class CardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'services';

  // Fetch all cards
  Future<List<CardModel>> getAllCards() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection(collectionName).orderBy('id').get();
      return snapshot.docs
          .map((doc) => CardModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch cards: $e');
    }
  }

}
