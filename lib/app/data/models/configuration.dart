import 'class_factories.dart';

class Configuration implements JsonParsableClass {
  String name;
  String data;

  Configuration({
    required this.name,
    required this.data,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Configuration &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          data == other.data);

  @override
  int get hashCode => name.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'Configuration{ name: $name, data: $data,}';
  }

  Configuration copyWith({
    String? name,
    String? data,
  }) {
    return Configuration(
      name: name ?? this.name,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'data': data,
    };
  }

  factory Configuration.fromJson(Map<String, dynamic> map) {
    return Configuration(
      name: map['name'] as String,
      data: map['data'] as String,
    );
  }
}
