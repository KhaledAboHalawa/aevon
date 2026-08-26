import 'package:aevon/core/shared/data/model/result.dart';
import 'package:firebase_ai/firebase_ai.dart';

abstract class ChatRemoteDataSource {
  Stream<Result<String>> sendMessage({required String message});
  Result<bool> startNewChat({List<Content>? history});
}
