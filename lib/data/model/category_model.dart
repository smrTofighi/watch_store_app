class CategoryModel {
  int id;
  String title;
  String image;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> slide) {
    return CategoryModel(
      id: slide['id'] as int,
      title: slide['title'] as String,
      image: slide['image'] as String,
    );
  }
   Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id']= id;
    data['title']= title;
    data['image']= image;
   
    return data;
  }
}
