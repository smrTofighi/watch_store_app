class BannerModel {
  int id;
  String title;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  BannerModel({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

 factory  BannerModel.fromJson(Map<String, dynamic> banner) {
    return BannerModel(
        id: banner['id'] as int,
        title:  banner['title'] as String,
        image:  banner['image'] as String,
        createdAt: DateTime.parse(banner['careated_at']),
        updatedAt:  DateTime.parse(banner['updated_at']));
  }


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic> ();
    data['id']= this.id;
    data['title']= this.title;
    data['image']= this.image;
    data['created_at']= this.createdAt;
    data['updated_at']= this.updatedAt;
    return data;
  }
}
