part of 'storage_bloc.dart';

sealed class StorageState extends Equatable {
  const StorageState();
}

final class StorageInitial extends StorageState {
  @override
  List<Object> get props => [];
}
