class PrimeMoverResponse {
  final int totalMuscles;
  final String message;
  final List<MusclesModel> muscles;

  PrimeMoverResponse({
    required this.totalMuscles,
    required this.message,
    required this.muscles,
  });

  factory PrimeMoverResponse.fromJson(Map<String, dynamic> json) {
    return PrimeMoverResponse(
      totalMuscles: json['totalMuscles'],
      message: json['message'],
      muscles: (json['muscles'] as List<dynamic>)
          .map((dynamic x) => MusclesModel.fromJson(x))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalMuscles': totalMuscles,
      'message': message,
      'muscles': muscles.map((x) => x.toJson()).toList(),
    };
  }
}

class MusclesModel {
  final String image;
  final String name;
  final String id;

  MusclesModel({
    required this.image,
    required this.name,
    required this.id,
  });

  factory MusclesModel.fromJson(Map<String, dynamic> json) {
    return MusclesModel(
      image: json['image'] ?? "",
      name: json['name'] ?? "",
      id: json['_id'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      '_id': id,
    };
  }
}