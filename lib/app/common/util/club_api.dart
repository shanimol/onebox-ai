import 'package:dartz/dartz.dart';

typedef ClubApiSuccess<T> = Right<T, T>;
typedef ClubApiFailed<T> = Left<T, T>;
typedef ClubApiResponse<R, L> = Either<R, L>?;
typedef ClubApiFetcher<R, L> = Future<ClubApiResponse<R, L>>;

class ClubApi {
  static ClubApiFetcher parallelFetch(
    List<ClubApiFetcher> fetchers, {
    Function(List<ClubApiResponse> responses)? onAllSuccess,
    Function(List<ClubApiResponse> responses)? onAnyFailed,
  }) async {
    List<ClubApiResponse?> results = await Future.wait<ClubApiResponse?>(
      fetchers,
    );

    if (results.any((result) => result?.isLeft() == true)) {
      onAnyFailed?.call(results);

      return ClubApiFailed(results);
    } else {
      onAllSuccess?.call(results);

      return ClubApiSuccess(results);
    }
  }
}
