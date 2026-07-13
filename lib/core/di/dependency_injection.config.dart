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
    as _i629;
import 'package:aevon/features/auth/data/datasource/auth_data_source_impl.dart'
    as _i896;
import 'package:aevon/features/auth/data/repositories/auth_repo_impl.dart'
    as _i559;
import 'package:aevon/features/auth/domain/repositories/sign_in_repo.dart'
    as _i639;
import 'package:aevon/features/auth/domain/usecases/sign_in_use_case.dart'
    as _i607;
import 'package:aevon/features/auth/presentation/cubit/auth_cubit.dart'
    as _i310;
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
    gh.lazySingleton<_i629.AuthDataSource>(
      () => _i896.AuthSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i639.AuthRepo>(
      () => _i559.AuthRepoImpl(gh<_i629.AuthDataSource>()),
    );
    gh.lazySingleton<_i705.OnboardingCubit>(
      () => _i705.OnboardingCubit(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i653.LocalizationCubit>(
      () => _i653.LocalizationCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i607.SignInUseCase>(
      () => _i607.SignInUseCase(repo: gh<_i639.AuthRepo>()),
    );
    gh.lazySingleton<_i310.AuthCubit>(
      () => _i310.AuthCubit(signInUseCase: gh<_i607.SignInUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i685.RegisterModule {}
