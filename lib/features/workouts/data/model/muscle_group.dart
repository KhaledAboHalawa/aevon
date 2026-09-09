class MuscleGroupResponse {
  final String? message;
  final List<MusclesGroupModel?>? musclesGroup;

  MuscleGroupResponse({this.message, this.musclesGroup});

  factory MuscleGroupResponse.fromJson(Map<String, dynamic> json) =>
      MuscleGroupResponse(
        message: json['message'],
        musclesGroup: json['musclesGroup']
            ?.map<MusclesGroupModel?>((x) => MusclesGroupModel.fromJson(x))
            .toList(),
      );
  Map<String, dynamic> toJson() => {
    'message': message,
    'musclesGroup': musclesGroup,
  };
}

class MusclesGroupModel {
  final String? id;
  final String? name;

  MusclesGroupModel({this.id, this.name});

  factory MusclesGroupModel.fromJson(Map<String, dynamic> json) =>
      MusclesGroupModel(id: json['_id'], name: json['name']);
  Map<String, dynamic> toJson() => {'_id': id, 'name': name};
}
