import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:image_search_clean/clean/domain/model/photo.dart';

part 'home_state.freezed.dart';

part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Photo> photos,
    @Default(false) bool isLoading,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, Object?> json) => _$HomeStateFromJson(json);
}