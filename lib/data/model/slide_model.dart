class SlideModel {
  int id;
  String title;
  String image;

  SlideModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory SlideModel.fromJson(Map<String, dynamic> slide) {
    return SlideModel(
      id: slide['id'] as int,
      title: slide['title'] as String,
      image: slide['image'] as String,
    );
  }
}
