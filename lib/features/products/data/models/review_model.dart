class ReviewModel {
  final double rating;
  final String comment;
  final String reviewerName;

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.reviewerName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'],
      reviewerName: json['reviewerName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'rating': rating, 'comment': comment, 'reviewerName': reviewerName};
  }
}
