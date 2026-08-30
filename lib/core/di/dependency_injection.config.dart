// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aevon/core/di/dependency_injection_module.dart' as _i685;
import 'package:aevon/core/localization/localization_cubit.dart' as _i653;
import 'package:aevon/core/shared/data/datasource/local_storage/auth_session.dart'
    as _i503;
import 'package:aevon/features/ai_chat/data/datasources/chat_history_data_source.dart'
    as _i851;
import 'package:aevon/features/ai_chat/data/datasources/chat_local_data_source.dart'
    as _i661;
import 'package:aevon/features/ai_chat/data/datasources/chat_remote_data_source.dart'
    as _i23;
import 'package:aevon/features/ai_chat/data/datasources/gemini_data_source.dart'
    as _i246;
import 'package:aevon/features/ai_chat/data/repositories/chat_repo_impl.dart'
    as _i117;
import 'package:aevon/features/ai_chat/domain/repositories/chat_repo.dart'
    as _i416;
import 'package:aevon/features/ai_chat/domain/usecases/get_chat_onboarding_state_use_case.dart'
    as _i453;
import 'package:aevon/features/ai_chat/domain/usecases/get_conversations_history_use_case.dart'
    as _i39;
import 'package:aevon/features/ai_chat/domain/usecases/init_conversation_history_use_case.dart'
    as _i197;
import 'package:aevon/features/ai_chat/domain/usecases/save_message_in_history_use_case.dart'
    as _i418;
import 'package:aevon/features/ai_chat/domain/usecases/send_message_use_case.dart'
    as _i612;
import 'package:aevon/features/ai_chat/domain/usecases/set_chat_onboarding_state_use_case.dart'
    as _i466;
import 'package:aevon/features/ai_chat/domain/usecases/start_new_chat_use_case.dart'
    as _i68;
import 'package:aevon/features/ai_chat/presentation/bloc/ai_chat_bloc.dart'
    as _i623;
import 'package:aevon/features/auth/data/datasource/auth_data_source.dart'
    as _i412;
import 'package:aevon/features/auth/data/datasource/auth_data_source_impl.dart'
    as _i125;
import 'package:aevon/features/auth/data/repositories/auth_repo_impl.dart'
    as _i242;
import 'package:aevon/features/auth/domain/repositories/sign_in_repo.dart'
    as _i973;
import 'package:aevon/features/auth/domain/usecases/fetch_user_info_use_case.dart'
    as _i386;
import 'package:aevon/features/auth/domain/usecases/sign_in_use_case.dart'
    as _i729;
import 'package:aevon/features/auth/domain/usecases/sign_up_use_case.dart'
    as _i372;
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart'
    as _i262;
import 'package:aevon/features/forget_password/data/datasources/forget_password_data_source.dart'
    as _i1041;
import 'package:aevon/features/forget_password/data/repositories/forget_password_repo_impl.dart'
    as _i628;
import 'package:aevon/features/forget_password/domain/repositories/forget_password_repo.dart'
    as _i196;
import 'package:aevon/features/forget_password/domain/usecases/forget_password_use_case.dart'
    as _i389;
import 'package:aevon/features/forget_password/domain/usecases/reset_password_use_case.dart'
    as _i555;
import 'package:aevon/features/forget_password/domain/usecases/verify_code_use_case.dart'
    as _i605;
import 'package:aevon/features/forget_password/presentation/bloc/forget_password_bloc.dart'
    as _i103;
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_cubit.dart'
    as _i705;
import 'package:aevon/features/profile/data/data_source/edit_profile_data_source.dart'
    as _i55;
import 'package:aevon/features/profile/data/data_source/local_edit_profile_data_source.dart'
    as _i192;
import 'package:aevon/features/profile/data/data_source/remote_edit_profile_data_source.dart'
    as _i758;
import 'package:aevon/features/profile/data/reposetory/edit_profile_repo_impl.dart'
    as _i710;
import 'package:aevon/features/profile/domain/reposetory/edit_profile_repo.dart'
    as _i375;
import 'package:aevon/features/profile/domain/use_cases/update_activity_level_use_case.dart'
    as _i923;
import 'package:aevon/features/profile/domain/use_cases/update_email_use_case.dart'
    as _i333;
import 'package:aevon/features/profile/domain/use_cases/update_first_name_use_case.dart'
    as _i519;
import 'package:aevon/features/profile/domain/use_cases/update_goal_use_case.dart'
    as _i93;
import 'package:aevon/features/profile/domain/use_cases/update_last_name_use_case.dart'
    as _i284;
import 'package:aevon/features/profile/domain/use_cases/update_profile_image_use_case.dart'
    as _i1032;
import 'package:aevon/features/profile/domain/use_cases/update_weight_use_case.dart'
    as _i14;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerModule.firestore());
    gh.lazySingleton<_i1041.ForgetPasswordDataSource>(
      () => _i1041.ForgetPasswordDataSource(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i55.EditProfileDataSource>(
      () => _i758.RemoteEditProfileDataSource(gh<_i361.Dio>()),
      instanceName: 'remoteEditProfileDataSource',
    );
    gh.singleton<_i661.ChatLocalDataSource>(
      () => _i661.ChatLocalDataSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i503.AuthSession>(
      () => _i503.AuthSession(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i375.EditProfileRepo>(
      () => _i710.EditProfileRepoImpl(
        gh<_i55.EditProfileDataSource>(
          instanceName: 'RemoteEditProfileDataSource',
        ),
        gh<_i55.EditProfileDataSource>(
          instanceName: 'LocalEditProfileDataSource',
        ),
      ),
    );
    gh.lazySingleton<_i55.EditProfileDataSource>(
      () => _i192.LocalEditProfileDataSource(gh<_i460.SharedPreferences>()),
      instanceName: 'localEditProfileDataSource',
    );
    gh.lazySingleton<_i23.ChatRemoteDataSource>(
      () => _i246.GeminiDataSource(authSession: gh<_i503.AuthSession>()),
    );
    gh.lazySingleton<_i705.OnboardingCubit>(
      () => _i705.OnboardingCubit(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i851.ChatHistoryDataSource>(
      () => _i851.ChatHistoryDataSource(
        firestore: gh<_i974.FirebaseFirestore>(),
        authSession: gh<_i503.AuthSession>(),
      ),
    );
    gh.lazySingleton<_i653.LocalizationCubit>(
      () => _i653.LocalizationCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i196.ForgetPasswordRepo>(
      () => _i628.ForgetPasswordRepoImpl(gh<_i1041.ForgetPasswordDataSource>()),
    );
    gh.lazySingleton<_i923.UpdateActivityLevelUseCase>(
      () => _i923.UpdateActivityLevelUseCase(gh<_i375.EditProfileRepo>()),
    );
    gh.lazySingleton<_i333.UpdateEmailUseCase>(
      () => _i333.UpdateEmailUseCase(gh<_i375.EditProfileRepo>()),
    );
    gh.lazySingleton<_i519.UpdateFirstNameUseCase>(
      () => _i519.UpdateFirstNameUseCase(gh<_i375.EditProfileRepo>()),
    );
    gh.lazySingleton<_i93.UpdateGoalUseCase>(
      () => _i93.UpdateGoalUseCase(gh<_i375.EditProfileRepo>()),
    );
    gh.lazySingleton<_i284.UpdateLastNameUseCase>(
      () => _i284.UpdateLastNameUseCase(gh<_i375.EditProfileRepo>()),
    );
    gh.lazySingleton<_i1032.UpdateProfileImageUseCase>(
      () => _i1032.UpdateProfileImageUseCase(gh<_i375.EditProfileRepo>()),
    );
    gh.lazySingleton<_i14.UpdateWeightUseCase>(
      () => _i14.UpdateWeightUseCase(gh<_i375.EditProfileRepo>()),
    );
    gh.lazySingleton<_i412.AuthDataSource>(
      () => _i125.AuthDataSourceImpl(gh<_i361.Dio>(), gh<_i503.AuthSession>()),
    );
    gh.lazySingleton<_i389.ForgetPasswordUseCase>(
      () => _i389.ForgetPasswordUseCase(
        forgetPasswordRepo: gh<_i196.ForgetPasswordRepo>(),
      ),
    );
    gh.lazySingleton<_i555.ResetPasswordUseCase>(
      () => _i555.ResetPasswordUseCase(
        forgetPasswordRepo: gh<_i196.ForgetPasswordRepo>(),
      ),
    );
    gh.lazySingleton<_i605.VerifyCodeUseCase>(
      () => _i605.VerifyCodeUseCase(
        forgetPasswordRepo: gh<_i196.ForgetPasswordRepo>(),
      ),
    );
    gh.lazySingleton<_i973.AuthRepo>(
      () => _i242.AuthRepoImpl(
        gh<_i412.AuthDataSource>(),
        gh<_i503.AuthSession>(),
      ),
    );
    gh.lazySingleton<_i386.FetchUserInfoUseCase>(
      () => _i386.FetchUserInfoUseCase(authRepo: gh<_i973.AuthRepo>()),
    );
    gh.lazySingleton<_i372.SignUpUseCase>(
      () => _i372.SignUpUseCase(authRepo: gh<_i973.AuthRepo>()),
    );
    gh.lazySingleton<_i103.ForgetPasswordCubit>(
      () => _i103.ForgetPasswordCubit(
        forgetPasswordUseCase: gh<_i389.ForgetPasswordUseCase>(),
        resetPasswordUseCase: gh<_i555.ResetPasswordUseCase>(),
        verifyCodeUseCase: gh<_i605.VerifyCodeUseCase>(),
      ),
    );
    gh.singleton<_i416.ChatRepo>(
      () => _i117.ChatRepoImpl(
        gh<_i661.ChatLocalDataSource>(),
        gh<_i23.ChatRemoteDataSource>(),
        gh<_i851.ChatHistoryDataSource>(),
      ),
    );
    gh.singleton<_i39.GetConversationsHistoryUseCase>(
      () => _i39.GetConversationsHistoryUseCase(gh<_i416.ChatRepo>()),
    );
    gh.singleton<_i418.SaveMessageInHistoryUseCase>(
      () => _i418.SaveMessageInHistoryUseCase(gh<_i416.ChatRepo>()),
    );
    gh.singleton<_i68.StartNewChatUseCase>(
      () => _i68.StartNewChatUseCase(gh<_i416.ChatRepo>()),
    );
    gh.lazySingleton<_i729.SignInUseCase>(
      () => _i729.SignInUseCase(repo: gh<_i973.AuthRepo>()),
    );
    gh.lazySingleton<_i197.InitConversationHistoryUseCase>(
      () => _i197.InitConversationHistoryUseCase(gh<_i416.ChatRepo>()),
    );
    gh.lazySingleton<_i262.AuthCubit>(
      () => _i262.AuthCubit(
        signInUseCase: gh<_i729.SignInUseCase>(),
        signUpUseCase: gh<_i372.SignUpUseCase>(),
        fetchUserInfoUseCase: gh<_i386.FetchUserInfoUseCase>(),
      ),
    );
    gh.singleton<_i453.GetChatOnboardingStateUseCase>(
      () => _i453.GetChatOnboardingStateUseCase(gh<_i416.ChatRepo>()),
    );
    gh.singleton<_i466.SetChatOnboardingStateUseCase>(
      () => _i466.SetChatOnboardingStateUseCase(gh<_i416.ChatRepo>()),
    );
    gh.lazySingleton<_i612.SendMessageUseCase>(
      () => _i612.SendMessageUseCase(repository: gh<_i416.ChatRepo>()),
    );
    gh.singleton<_i623.AiChatCubit>(
      () => _i623.AiChatCubit(
        getChatOnboardingStateUseCase:
            gh<_i453.GetChatOnboardingStateUseCase>(),
        setChatOnboardingStateUseCase:
            gh<_i466.SetChatOnboardingStateUseCase>(),
        sendMessageUseCase: gh<_i612.SendMessageUseCase>(),
        startNewChatUseCase: gh<_i68.StartNewChatUseCase>(),
        getChatHistoryUseCase: gh<_i39.GetConversationsHistoryUseCase>(),
        saveMessageInHistoryUseCase: gh<_i418.SaveMessageInHistoryUseCase>(),
        initConversationHistoryUseCase:
            gh<_i197.InitConversationHistoryUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i685.RegisterModule {}
