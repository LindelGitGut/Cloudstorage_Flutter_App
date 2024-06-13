part of 'file_bloc.dart';

@immutable
sealed class FileState {}

final class FileInitial extends FileState {}

class FileLoading extends FileState {}

class FileLoaded extends FileState {
  final List<String> files;

   FileLoaded(this.files);
  @override
  List<Object> get props => [files];
}

class FileUploadSuccess extends FileState {}

class FileFailure extends FileState {
  final String error;

   FileFailure(this.error);

  @override
  List<Object> get props => [error];
}
