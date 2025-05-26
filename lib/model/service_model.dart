import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

typedef MapJson = Map<String, dynamic>;

class ServiceModel extends Equatable {
  const ServiceModel({
    required this.title,
    required this.description,
    required this.assetPath,
  });

  final String title;
  final String description;
  final String assetPath;

  factory ServiceModel.fromFirestore(
    DocumentSnapshot<MapJson> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ServiceModel(
      title: data?['title'],
      description: data?['description'],
      assetPath: data?['asset_path'],
    );
  }

  MapJson toFirestore() {
    return {
      "title": title,
      "description": description,
      "asset_path": assetPath,
    };
  }

  @override
  List<Object?> get props => [title, description, assetPath];
}
