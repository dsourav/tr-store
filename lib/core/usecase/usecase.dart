import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tr_store/core/errors/failures.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

abstract class UseCase2<T, P> {
  Either<Failure, T> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
