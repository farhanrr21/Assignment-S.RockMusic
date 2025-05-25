import 'package:flutter/material.dart';
import 'package:srock_music/models/model/card_model.dart';
import 'package:srock_music/models/repo/card_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final CardRepository _cardRepository;
  List<CardModel> _cards = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<CardModel> get cards => _cards;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  HomeViewModel(this._cardRepository);

  // Fetch cards from Firestore and update state
  Future<void> fetchCards() async {
    _isLoading = true;

    try {
      // Simulate async fetch or real Firestore call
      final cards = await _cardRepository.getAllCards();
      _cards = cards;
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
