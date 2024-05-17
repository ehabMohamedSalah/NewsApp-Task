import 'package:rootco_task/Domain_layer/entity/SourceEntity.dart';

/// id : "google-news"
/// name : "Google News"

class SourceModel {
  SourceModel({
      this.id, 
      this.name,});

  SourceModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;
SourceModel copyWith({  String? id,
  String? name,
}) => SourceModel(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
  SourceEntity toSourceEntity(){
    return SourceEntity(
      name: name,
      id: id,
    );
  }

}