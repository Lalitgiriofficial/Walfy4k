import 'dart:convert';

import 'package:flutter/material.dart';

class Photos {
  int id;
  String url;
  String photographer;

  int photographer_id;
  Src src;
  Photos({
    required this.id,
    required this.url,
    required this.photographer,
    required this.photographer_id,
    required this.src,
  });

  Photos copyWith({
    int? id,
    String? url,
    String? photographer,
    int? photographer_id,
    Src? src,
  }) {
    return Photos(
      id: id ?? this.id,
      url: url ?? this.url,
      photographer: photographer ?? this.photographer,
      photographer_id: photographer_id ?? this.photographer_id,
      src: src ?? this.src,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'photographer': photographer,
      'photographer_id': photographer_id,
      'src': src.toMap(),
    };
  }

  factory Photos.fromMap(Map<String, dynamic> map) {
    return Photos(
      id: map['id'],
      url: map['url'],
      photographer: map['photographer'],
      photographer_id: map['photographer_id'],
      src: Src.fromMap(map['src']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Photos.fromJson(String source) => Photos.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Photos(id: $id, url: $url, photographer: $photographer, photographer_id: $photographer_id, src: $src)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Photos &&
        other.id == id &&
        other.url == url &&
        other.photographer == photographer &&
        other.photographer_id == photographer_id &&
        other.src == src;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    url.hashCode ^
    photographer.hashCode ^
    photographer_id.hashCode ^
    src.hashCode;
  }
}

class Src {
  String original;
  String small;
  String portrait;
  Src({
    required this.original,
    required this.small,
    required this.portrait,
  });

  Src copyWith({
    String? original,
    String? small,
    String? portrait,
  }) {
    return Src(
      original: original ?? this.original,
      small: small ?? this.small,
      portrait: portrait ?? this.portrait,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'original': original,
      'small': small,
      'portrait': portrait,
    };
  }

  factory Src.fromMap(Map<String, dynamic> map) {
    return Src(
      original: map['original'],
      small: map['small'],
      portrait: map['portrait'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Src.fromJson(String source) => Src.fromMap(json.decode(source));

  @override
  String toString() =>
      'Src(original: $original, small: $small, portrait: $portrait)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Src &&
        other.original == original &&
        other.small == small &&
        other.portrait == portrait;
  }

  @override
  int get hashCode => original.hashCode ^ small.hashCode ^ portrait.hashCode;
}
