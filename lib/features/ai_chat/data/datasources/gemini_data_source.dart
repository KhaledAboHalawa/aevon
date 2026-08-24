import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/data/datasources/chat_remote_data_source.dart';
import 'package:aevon/features/ai_chat/data/mapper/ai_context_mapper.dart';
import 'package:aevon/features/ai_chat/domain/entity/ai_context.dart';
import 'package:aevon/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/errors_handler.dart';

@LazySingleton(as: ChatRemoteDataSource)
class GeminiDataSource implements ChatRemoteDataSource {
  late final GenerativeModel _model;
  late ChatSession _chat;
  final AuthLocalDataSource authDataSource;
  GeminiDataSource({required this.authDataSource}) {
    _model = FirebaseAI.googleAI().generativeModel(
      model: 'gemini-3.7-flash',
      systemInstruction: Content.system(
        buildSystemInstruction(authDataSource.fetchUserInfo()!.toAiContext()),
      ),
    );

    _chat = _model.startChat();
  }

  @override
  Stream<Result<String>> sendMessage({required String message}) async* {
    try {
      final response = _chat.sendMessageStream(Content.text(message));

      await for (final chunk in response) {
        final text = chunk.text;

        if (text != null && text.isNotEmpty) {
          yield Success(text);
        }
      }
    } catch (e) {
      yield Error(
        Failure(
          success: false,
          status: 0,
          statusCode: 0,
          message: e.toString().split(',').first,
        ),
      );
    }
  }

  @override
  Result<bool> startNewChat() {
    try {
      _chat = _model.startChat();
      return const Success(true);
    } catch (e) {
      return Error(
        Failure(
          success: false,
          status: 0,
          statusCode: 0,
          message: e.toString().split(',').first,
        ),
      );
    }
  }

  String buildSystemInstruction(AiContext user) {
    return '''
You are an AI fitness coach inside a fitness application.

Your responsibilities:
- Help the user with general fitness questions.
- Help with workout and training questions.
- Help with general nutrition questions.
- Adapt your answers to the user's fitness profile when relevant.

Rules:
- Do not invent information about the user.
- If required information is missing, ask the user.
- Do not diagnose medical conditions.
- Do not present medical advice as a diagnosis.
- Keep responses practical and easy to understand.

User fitness profile:
- Age: ${user.age}
- Height: ${user.height} cm
- Weight: ${user.weight} kg
- Goal: ${user.goal}
- Activity level: ${user.activityLevel}
''';
  }
}
