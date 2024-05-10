import 'dart:convert';

class UserModel {
  final String name;
  final String phone;
  final String address;
  final String postalCode;
  final String lat;
  final String lng;
  final image;

  UserModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.postalCode,
    required this.lat,
    required this.lng,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'postal_code': postalCode,
      'address': address,
      'lat': lat,
      'lng': lng,
      'image': image,
    };
  }

  factory UserModel.fromJson(String? jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString!);
    return UserModel(
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      postalCode: map['postal_code'],
      lat: map['lat'],
      lng: map['lng'],
      image: map['image'],
    );
  }
}
