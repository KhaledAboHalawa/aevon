import 'dart:developer';

import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/ai_chat/data/datasources/chat_remote_data_source.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/errors_handler.dart';

@LazySingleton(as: ChatRemoteDataSource)
class GeminiDataSource implements ChatRemoteDataSource {
  late final GenerativeModel _model;
  late final ChatSession _chat;

  GeminiDataSource() {
    _model = FirebaseAI.googleAI().generativeModel(model: 'gemini-3.7-flash');

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
}
