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
import 'package:aevon/features/auth/data/datasource/auth_data_source.dart'
    as _i412;
import 'package:aevon/features/auth/data/datasource/auth_data_source_impl.dart'
    as _i125;
import 'package:aevon/features/auth/data/datasource/auth_local_data_source.dart'
    as _i809;
import 'package:aevon/features/auth/data/repositories/auth_repo_impl.dart'
    as _i242;
import 'package:aevon/features/auth/domain/repositories/sign_in_repo.dart'
    as _i973;
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
    gh.lazySingleton<_i1041.ForgetPasswordDataSource>(
      () => _i1041.ForgetPasswordDataSource(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i412.AuthDataSource>(
      () => _i125.AuthDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i809.AuthLocalDataSource>(
      () => _i809.AuthLocalDataSource(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i705.OnboardingCubit>(
      () => _i705.OnboardingCubit(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i653.LocalizationCubit>(
      () => _i653.LocalizationCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i973.AuthRepo>(
      () => _i242.AuthRepoImpl(
        gh<_i412.AuthDataSource>(),
        gh<_i809.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i196.ForgetPasswordRepo>(
      () => _i628.ForgetPasswordRepoImpl(gh<_i1041.ForgetPasswordDataSource>()),
    );
    gh.lazySingleton<_i729.SignInUseCase>(
      () => _i729.SignInUseCase(repo: gh<_i973.AuthRepo>()),
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
    gh.lazySingleton<_i262.AuthCubit>(
      () => _i262.AuthCubit(
        signInUseCase: gh<_i729.SignInUseCase>(),
        signUpUseCase: gh<_i372.SignUpUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i685.RegisterModule {}
