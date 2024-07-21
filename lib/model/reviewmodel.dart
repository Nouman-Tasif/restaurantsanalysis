// models/review.dart
class Review {
  final String user;
  final String comment;
  final int rating;
  final DateTime date;

  Review({required this.user, required this.comment, required this.rating, required this.date});
}