import 'package:equatable/equatable.dart';

class OnboardItemsModel extends Equatable {
  final String title;
  final String description;
  final String image;

  const OnboardItemsModel({required this.title, required this.description, required this.image});

  @override
  List<Object?> get props => [title, description, image];
}