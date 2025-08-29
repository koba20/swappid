import 'package:equatable/equatable.dart';

class Meta extends Equatable {
  final int? page;
  final int? limit;
  final int? totalPages;
  final int? totalData;

  final bool? hasNextPage;
  final bool? hasPreviousPage;

  const Meta({
    this.page,
    this.limit,
    this.totalPages,
    this.totalData,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  @override
  List<Object?> get props => [];

  factory Meta.fromMap(Map data) => Meta(
        hasNextPage: data['hasNextPage'],
        hasPreviousPage: data['hasPreviousPage'],
        page: data['page'],
        limit: data['limit'],
        totalPages: data['totalPages'],
        totalData: data['totalData'],
      );
}
