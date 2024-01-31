class ReviewModel {
  int? rate;
  String? comment;

  ReviewModel({this.rate, this.comment});

  factory ReviewModel.fromJson(Map<String, dynamic>? tripRivew) {
    return ReviewModel(
        rate: tripRivew?["rate"], comment: tripRivew?["comment"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "rate": rate,
      "comment": comment,
    };
  }
}
