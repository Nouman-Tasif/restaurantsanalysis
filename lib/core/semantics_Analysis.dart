import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SentimentAnalysis {
  final FlutterTts flutterTts = FlutterTts();

  Future<String> analyzeSentiment(String text) async {
    await flutterTts.speak(text);
    // Simulate sentiment analysis result with updated logic
    if (text.contains('fantastic') || text.contains('awesome') || text.contains('incredible') || text.contains('Absolutely') || text.contains('Decent')) {
      return 'Positive';
    } else if (text.contains('okay') || text.contains('so-so') || text.contains('mediocre')) {
      return 'Neutral';
    } else {
      return 'Negative';
    }
  }
}
