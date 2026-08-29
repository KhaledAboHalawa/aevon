import 'package:aevon/core/errors/errors_handler.dart';
import 'package:aevon/core/shared/data/datasource/local_storage/auth_session.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/features/ai_chat/data/model/chat_message_model.dart';
import 'package:aevon/features/ai_chat/data/model/conversation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChatHistoryDataSource {
  final FirebaseFirestore _firestore;
  final AuthSession _authSession;
  String? userId;
  ChatHistoryDataSource({required this._firestore, required this._authSession});

  Future<Result<bool>> saveChatHistory({
    required ChatMessageModel message,
    required String conversationId,
  }) async {
    (await getConversationCollection()).doc(conversationId).update({
      "messages": FieldValue.arrayUnion([message.toJson()]),
      "updatedAt": DateTime.now().toIso8601String(),
    });
    return const Success(true);
  }

  Future<Result<bool>> initConversationCollection({
    required ConversationModel conversation,
  }) async {
    try {
      (await getConversationCollection())
          .doc(conversation.id)
          .set(conversation);
      return const Success(true);
    } catch (e) {
      return Error(
        Failure(
          message: e.toString(),
          statusCode: 1,
          success: false,
          status: 0,
        ),
      );
    }
  }

  Future<Result<bool>> deleteChatHistory({
    required String conversationId,
  }) async {
    try {
      (await getConversationCollection()).doc(conversationId).delete();
      return const Success(true);
    } catch (e) {
      return Error(
        Failure(
          message: e.toString(),
          statusCode: 1,
          success: false,
          status: 0,
        ),
      );
    }
  }

  Future<Result<List<ConversationModel>>> getChatHistory() async {
    try {
      final conversationCollection = await getConversationCollection();
      final result = await conversationCollection
          .orderBy('updatedAt', descending: true)
          .get();
      return Success<List<ConversationModel>>(
        result.docs.map((doc) => doc.data()).toList(),
      );
    } catch (e) {
      return Error(
        Failure(
          message: e.toString(),
          statusCode: 1,
          success: false,
          status: 0,
        ),
      );
    }
  }

  Future<CollectionReference<ConversationModel>>
  getConversationCollection() async {
    try {
      userId ??= _authSession.fetchUserInfo()?.id;
      final result = _firestore
          .collection(ApiConstants.usersCollection)
          .doc(userId)
          .collection(ApiConstants.conversationsCollection)
          .withConverter<ConversationModel>(
            fromFirestore: (snapshot, options) =>
                ConversationModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
