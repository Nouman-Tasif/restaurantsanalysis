import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:math';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  Interpreter? _interpreter;
  final List<String> _labels = ['Negative', 'Neutral', 'Positive'];
  String _sentimentResult = 'Enter a review to see the sentiment';

  // A mock vocabulary index, typically loaded from a JSON or equivalent
  final Map<String, int> _vocab = {
    'this': 1,
    'is': 2,
    'a': 3,
    'good': 4,
    'bad': 5,
    'movie': 6,
    // Add more words as necessary
  };

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      final modelPath = await _getModelPath('assets/sentiment_model.tflite');
      _interpreter = await Interpreter.fromFile(File(modelPath));
      print('Model loaded successfully');
    } catch (e) {
      print('Error loading model: $e');
      setState(() {
        _sentimentResult = 'Error: Model not loaded. Details: $e';
      });
    }
  }

  Future<String> _getModelPath(String assetName) async {
    final directory = await getApplicationDocumentsDirectory();
    final modelFile = File('${directory.path}/sentiment_model.tflite');

    if (!await modelFile.exists()) {
      final byteData = await rootBundle.load(assetName);
      await modelFile.writeAsBytes(byteData.buffer.asUint8List());
    }

    return modelFile.path;
  }

  List<double> _preprocessReview(String review) {
    // Convert the review to lower case, split it into words, and map each word to its index
    List<String> words = review.toLowerCase().split(' ');
    return words.map((word) => _vocab[word]?.toDouble() ?? 0.0).toList();
  }

  Future<void> _predictSentiment(String review) async {
    if (_interpreter == null) {
      setState(() {
        _sentimentResult = 'Error: Model not loaded';
      });
      return;
    }

    // Preprocess the input text
    List<double> inputTensor = _preprocessReview(review);

    // Check the input shape expected by the model
    var inputShape = _interpreter!.getInputTensor(0).shape;
    int maxLength = inputShape[1]; // Assuming input shape is [1, maxLength]

    // Pad or truncate the input tensor to match the model's input size
    List<double> paddedInput = _padOrTruncateInput(inputTensor, maxLength);

    // Create input and output tensors
    try {
      // Prepare input and output tensors
      var input = [paddedInput];
      var output = List.filled(1 * _labels.length, 0.0).reshape(
          [1, _labels.length]);

      // Run the model inference
      _interpreter!.run(input, output);

      // Find the index of the max score in the output
      int maxIndex = output[0].indexOf(output[0].reduce(max));

      // Update UI with the sentiment result
      setState(() {
        _sentimentResult = _labels[maxIndex];
      });
    } catch (e) {
      setState(() {
        _sentimentResult = 'Error during inference: $e';
      });
    }
  }

  List<double> _padOrTruncateInput(List<double> inputTensor, int maxLength) {
    if (inputTensor.length > maxLength) {
      // Truncate the input
      return inputTensor.sublist(0, maxLength);
    } else {
      // Pad the input
      return inputTensor + List.filled(maxLength - inputTensor.length, 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sentiment Analysis')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (review) {
                  _predictSentiment(review);
                },
                decoration: InputDecoration(
                  hintText: 'Enter a review',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                _sentimentResult,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}