import 'package:aevon/features/ai_chat/domain/entity/ai_context.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';

extension AiContextMapper on User {
  AiContext toAiContext() {
    return AiContext(
      age: age.toString(),
      weight: weight.toString(),
      height: height.toString(),
      activityLevel: activityLevel?.toIdActivityLevel() ?? '',
      goal: goal?.name ?? '',
    );
  }
}
