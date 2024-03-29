part of 'article_bloc.dart';



class ArticleInitial  {
  final List<ArticleEntity> data;

  @override
  String toString() {
    return 'ArticleInitial{data: $data, status: $status}';
  }

  final ArticleStatus status;

  ArticleInitial({
    required this.data,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleInitial &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          status == other.status;

  @override
  int get hashCode => data.hashCode ^ status.hashCode;

  ArticleInitial copyWith({
    List<ArticleEntity>? data,
    ArticleStatus? status,
  }) {
    return ArticleInitial(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
}

enum ArticleStatus {
  pure,
  loading,
  success,
  failure,
  empty,
}
