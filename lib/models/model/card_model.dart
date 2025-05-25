import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel {
  final String title;
  final String description;
  final String icon;
  final String background;

  CardModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.background,
  });
  
  // Convert CardModel to Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'icon': icon,
      'background': background,
    };
  }

  // Create a CardModel from Firestore document
  factory CardModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CardModel(
      title: data['title'] ?? '', // Default to empty string if not present
      description: data['description'] ?? '',
      icon: data['icon'] ?? '',
      background: data['background'] ?? '',
    );
  }
}


