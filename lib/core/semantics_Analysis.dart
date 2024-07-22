import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SentimentAnalysis {
  final FlutterTts flutterTts = FlutterTts();

  Future<String> analyzeSentiment(String text) async {
    await flutterTts.speak(text);
    // Simulate sentiment analysis result
    if (text.contains('great') || text.contains('excellent') || text.contains('loved')) {
      return 'Positive';
    } else if (text.contains('average') || text.contains('not as expected')) {
      return 'Neutral';
    } else {
      return 'Negative';
    }
  }
}
