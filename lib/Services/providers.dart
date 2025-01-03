import 'package:flutflix/Model/model.dart';
import 'package:flutflix/Services/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<Api>(
  (ref) {
    return Api();
  },
);

final userDataProvider = FutureProvider<List<Movie>>(
  (ref) async {
    return ref.watch(apiProvider).getUpcomingMovies();
  },
);

final userDataProvider2 = FutureProvider<List<Movie>>(
  (ref) async {
    return ref.watch(apiProvider).getPopularMovies();
  },
);

final userDataProvider3 = FutureProvider<List<Movie>>(
  (ref) async {
    return ref.watch(apiProvider).getTopRatedMovies();
  },
);
