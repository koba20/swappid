import 'package:equatable/equatable.dart';
import 'api_data.dart';
import 'meta.dart';

class SystemData<T> extends Equatable {
  final T data;
  final String message;
  final Meta? meta;

  Type get type => data.runtimeType;
  bool get hasData => data != null;

  const SystemData({
    required this.data,
    required this.meta,
    required this.message,
  });

  @override
  List<Object?> get props => [data, meta, message];

  factory SystemData.fromApiService(ApiData data) {
    return SystemData(
      data: data.data,
      meta: data.meta,
      message: data.message,
    );
  }
}
