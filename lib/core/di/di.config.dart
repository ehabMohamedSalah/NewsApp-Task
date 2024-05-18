// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../Data_layer/datasource_contract/Articles_datasource.dart' as _i4;
import '../../Data_layer/datasource_impl/Articles_datasource_impl.dart' as _i5;
import '../../Data_layer/repository_impl/Articles_Repo_Impl.dart' as _i7;
import '../../Domain_layer/repository_contract/Articles_Repo.dart' as _i6;
import '../../Domain_layer/usecase/Articles_usecase.dart' as _i8;
import '../../presentation/NewsScreen/News_ViewModel/home_ViewModel_cubit.dart'
    as _i9;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ArticlesDataSource>(
        () => _i5.ArticlesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ArticlesRepo>(
        () => _i7.ArticlesRepoImpl(gh<_i4.ArticlesDataSource>()));
    gh.factory<_i8.ArticlesUsecase>(
        () => _i8.ArticlesUsecase(gh<_i6.ArticlesRepo>()));
    gh.factory<_i9.NewsViewModelCubit>(
        () => _i9.NewsViewModelCubit(gh<_i8.ArticlesUsecase>()));
    return this;
  }
}
