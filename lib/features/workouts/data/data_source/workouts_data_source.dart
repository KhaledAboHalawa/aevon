import 'package:aevon/core/network/api_executer.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/muscle_group.dart';

@lazySingleton
class WorkoutsDataSource {
  final Dio _dio;
  WorkoutsDataSource(this._dio);

  Future<Result<MuscleGroupResponse>> getMuscleGroups() async {
    return await executeApiCall(
      apiCall: () async => await _dio.get(ApiConstants.allMuscleGroups),
      parser: (data) => MuscleGroupResponse.fromJson(data),
    );
  }
}