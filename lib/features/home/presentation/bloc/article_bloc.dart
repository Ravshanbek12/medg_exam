import 'package:bloc/bloc.dart';
import 'package:medg_exam/features/home/domain/entity/entity.dart';
import 'package:medg_exam/features/home/domain/usecase/usecase.dart';


import '../../../../core/injector/injector.dart';


part 'article_event.dart';

part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleInitial> {
  ArticleBloc()
      : super(ArticleInitial(data: [], status: ArticleStatus.pure)) {
    on<GetArticles>((event, emit) async {
      emit(
        state.copyWith(
          status: ArticleStatus.loading,
        ),
      );
      print("Loading success");
      final usecase = sl<ArticleUseCase>();
      final either = await usecase.call(
        GetDataArticle()
      );
      print("Get Success Notifications");
      print("GetData success");
      either.either((failure) {
        print("----------------------------------${failure}----------------------------------------");
        emit(
          state.copyWith(
            status: ArticleStatus.failure,
          ),
        );
      }, (value) {
        int len = value.length;
        print("Value get success");
        emit(
          state.copyWith(
            status: len == 0
                ? ArticleStatus.empty
                : ArticleStatus.success,
            data: value,
          ),
        );
      });
    });
  }
}
