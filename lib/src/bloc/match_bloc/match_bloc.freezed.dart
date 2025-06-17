// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchEvent()';
}


}

/// @nodoc
class $MatchEventCopyWith<$Res>  {
$MatchEventCopyWith(MatchEvent _, $Res Function(MatchEvent) __);
}


/// @nodoc


class MatchesLoaded implements MatchEvent {
  const MatchesLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchesLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MatchEvent.matchesLoaded()';
}


}




/// @nodoc


class FilterChanged implements MatchEvent {
  const FilterChanged({required this.newFilter});
  

 final  SportType? newFilter;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterChangedCopyWith<FilterChanged> get copyWith => _$FilterChangedCopyWithImpl<FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterChanged&&(identical(other.newFilter, newFilter) || other.newFilter == newFilter));
}


@override
int get hashCode => Object.hash(runtimeType,newFilter);

@override
String toString() {
  return 'MatchEvent.filterChanged(newFilter: $newFilter)';
}


}

/// @nodoc
abstract mixin class $FilterChangedCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $FilterChangedCopyWith(FilterChanged value, $Res Function(FilterChanged) _then) = _$FilterChangedCopyWithImpl;
@useResult
$Res call({
 SportType? newFilter
});




}
/// @nodoc
class _$FilterChangedCopyWithImpl<$Res>
    implements $FilterChangedCopyWith<$Res> {
  _$FilterChangedCopyWithImpl(this._self, this._then);

  final FilterChanged _self;
  final $Res Function(FilterChanged) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newFilter = freezed,}) {
  return _then(FilterChanged(
newFilter: freezed == newFilter ? _self.newFilter : newFilter // ignore: cast_nullable_to_non_nullable
as SportType?,
  ));
}


}

/// @nodoc


class OddSelected implements MatchEvent {
  const OddSelected({required this.matchId, required this.oddKey});
  

 final  String matchId;
 final  String oddKey;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OddSelectedCopyWith<OddSelected> get copyWith => _$OddSelectedCopyWithImpl<OddSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OddSelected&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.oddKey, oddKey) || other.oddKey == oddKey));
}


@override
int get hashCode => Object.hash(runtimeType,matchId,oddKey);

@override
String toString() {
  return 'MatchEvent.oddSelected(matchId: $matchId, oddKey: $oddKey)';
}


}

/// @nodoc
abstract mixin class $OddSelectedCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $OddSelectedCopyWith(OddSelected value, $Res Function(OddSelected) _then) = _$OddSelectedCopyWithImpl;
@useResult
$Res call({
 String matchId, String oddKey
});




}
/// @nodoc
class _$OddSelectedCopyWithImpl<$Res>
    implements $OddSelectedCopyWith<$Res> {
  _$OddSelectedCopyWithImpl(this._self, this._then);

  final OddSelected _self;
  final $Res Function(OddSelected) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? matchId = null,Object? oddKey = null,}) {
  return _then(OddSelected(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,oddKey: null == oddKey ? _self.oddKey : oddKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OddsUpdated implements MatchEvent {
  const _OddsUpdated(this.update);
  

 final  OddsUpdate update;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OddsUpdatedCopyWith<_OddsUpdated> get copyWith => __$OddsUpdatedCopyWithImpl<_OddsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OddsUpdated&&(identical(other.update, update) || other.update == update));
}


@override
int get hashCode => Object.hash(runtimeType,update);

@override
String toString() {
  return 'MatchEvent.oddsUpdated(update: $update)';
}


}

/// @nodoc
abstract mixin class _$OddsUpdatedCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory _$OddsUpdatedCopyWith(_OddsUpdated value, $Res Function(_OddsUpdated) _then) = __$OddsUpdatedCopyWithImpl;
@useResult
$Res call({
 OddsUpdate update
});




}
/// @nodoc
class __$OddsUpdatedCopyWithImpl<$Res>
    implements _$OddsUpdatedCopyWith<$Res> {
  __$OddsUpdatedCopyWithImpl(this._self, this._then);

  final _OddsUpdated _self;
  final $Res Function(_OddsUpdated) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? update = null,}) {
  return _then(_OddsUpdated(
null == update ? _self.update : update // ignore: cast_nullable_to_non_nullable
as OddsUpdate,
  ));
}


}

/// @nodoc


class _HighlightExpired implements MatchEvent {
  const _HighlightExpired(this.matchId);
  

 final  String matchId;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HighlightExpiredCopyWith<_HighlightExpired> get copyWith => __$HighlightExpiredCopyWithImpl<_HighlightExpired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HighlightExpired&&(identical(other.matchId, matchId) || other.matchId == matchId));
}


@override
int get hashCode => Object.hash(runtimeType,matchId);

@override
String toString() {
  return 'MatchEvent.highlightExpired(matchId: $matchId)';
}


}

/// @nodoc
abstract mixin class _$HighlightExpiredCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory _$HighlightExpiredCopyWith(_HighlightExpired value, $Res Function(_HighlightExpired) _then) = __$HighlightExpiredCopyWithImpl;
@useResult
$Res call({
 String matchId
});




}
/// @nodoc
class __$HighlightExpiredCopyWithImpl<$Res>
    implements _$HighlightExpiredCopyWith<$Res> {
  __$HighlightExpiredCopyWithImpl(this._self, this._then);

  final _HighlightExpired _self;
  final $Res Function(_HighlightExpired) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? matchId = null,}) {
  return _then(_HighlightExpired(
null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ManualOddsUpdateRequested implements MatchEvent {
  const ManualOddsUpdateRequested({required this.matchId});
  

 final  String matchId;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManualOddsUpdateRequestedCopyWith<ManualOddsUpdateRequested> get copyWith => _$ManualOddsUpdateRequestedCopyWithImpl<ManualOddsUpdateRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManualOddsUpdateRequested&&(identical(other.matchId, matchId) || other.matchId == matchId));
}


@override
int get hashCode => Object.hash(runtimeType,matchId);

@override
String toString() {
  return 'MatchEvent.manualOddsUpdateRequested(matchId: $matchId)';
}


}

/// @nodoc
abstract mixin class $ManualOddsUpdateRequestedCopyWith<$Res> implements $MatchEventCopyWith<$Res> {
  factory $ManualOddsUpdateRequestedCopyWith(ManualOddsUpdateRequested value, $Res Function(ManualOddsUpdateRequested) _then) = _$ManualOddsUpdateRequestedCopyWithImpl;
@useResult
$Res call({
 String matchId
});




}
/// @nodoc
class _$ManualOddsUpdateRequestedCopyWithImpl<$Res>
    implements $ManualOddsUpdateRequestedCopyWith<$Res> {
  _$ManualOddsUpdateRequestedCopyWithImpl(this._self, this._then);

  final ManualOddsUpdateRequested _self;
  final $Res Function(ManualOddsUpdateRequested) _then;

/// Create a copy of MatchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? matchId = null,}) {
  return _then(ManualOddsUpdateRequested(
matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MatchState {

 MatchStatus get status; List<MatchModel> get allMatches; List<MatchModel> get filteredMatches; SportType? get selectedFilter; Map<String, String> get selectedOdds; Set<String> get recentlyUpdatedMatchIds; Object? get error;
/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchStateCopyWith<MatchState> get copyWith => _$MatchStateCopyWithImpl<MatchState>(this as MatchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.allMatches, allMatches)&&const DeepCollectionEquality().equals(other.filteredMatches, filteredMatches)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&const DeepCollectionEquality().equals(other.selectedOdds, selectedOdds)&&const DeepCollectionEquality().equals(other.recentlyUpdatedMatchIds, recentlyUpdatedMatchIds)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(allMatches),const DeepCollectionEquality().hash(filteredMatches),selectedFilter,const DeepCollectionEquality().hash(selectedOdds),const DeepCollectionEquality().hash(recentlyUpdatedMatchIds),const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'MatchState(status: $status, allMatches: $allMatches, filteredMatches: $filteredMatches, selectedFilter: $selectedFilter, selectedOdds: $selectedOdds, recentlyUpdatedMatchIds: $recentlyUpdatedMatchIds, error: $error)';
}


}

/// @nodoc
abstract mixin class $MatchStateCopyWith<$Res>  {
  factory $MatchStateCopyWith(MatchState value, $Res Function(MatchState) _then) = _$MatchStateCopyWithImpl;
@useResult
$Res call({
 MatchStatus status, List<MatchModel> allMatches, List<MatchModel> filteredMatches, SportType? selectedFilter, Map<String, String> selectedOdds, Set<String> recentlyUpdatedMatchIds, Object? error
});




}
/// @nodoc
class _$MatchStateCopyWithImpl<$Res>
    implements $MatchStateCopyWith<$Res> {
  _$MatchStateCopyWithImpl(this._self, this._then);

  final MatchState _self;
  final $Res Function(MatchState) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? allMatches = null,Object? filteredMatches = null,Object? selectedFilter = freezed,Object? selectedOdds = null,Object? recentlyUpdatedMatchIds = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchStatus,allMatches: null == allMatches ? _self.allMatches : allMatches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,filteredMatches: null == filteredMatches ? _self.filteredMatches : filteredMatches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,selectedFilter: freezed == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as SportType?,selectedOdds: null == selectedOdds ? _self.selectedOdds : selectedOdds // ignore: cast_nullable_to_non_nullable
as Map<String, String>,recentlyUpdatedMatchIds: null == recentlyUpdatedMatchIds ? _self.recentlyUpdatedMatchIds : recentlyUpdatedMatchIds // ignore: cast_nullable_to_non_nullable
as Set<String>,error: freezed == error ? _self.error : error ,
  ));
}

}


/// @nodoc


class _MatchState implements MatchState {
  const _MatchState({this.status = MatchStatus.initial, final  List<MatchModel> allMatches = const [], final  List<MatchModel> filteredMatches = const [], this.selectedFilter, final  Map<String, String> selectedOdds = const {}, final  Set<String> recentlyUpdatedMatchIds = const {}, this.error}): _allMatches = allMatches,_filteredMatches = filteredMatches,_selectedOdds = selectedOdds,_recentlyUpdatedMatchIds = recentlyUpdatedMatchIds;
  

@override@JsonKey() final  MatchStatus status;
 final  List<MatchModel> _allMatches;
@override@JsonKey() List<MatchModel> get allMatches {
  if (_allMatches is EqualUnmodifiableListView) return _allMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allMatches);
}

 final  List<MatchModel> _filteredMatches;
@override@JsonKey() List<MatchModel> get filteredMatches {
  if (_filteredMatches is EqualUnmodifiableListView) return _filteredMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredMatches);
}

@override final  SportType? selectedFilter;
 final  Map<String, String> _selectedOdds;
@override@JsonKey() Map<String, String> get selectedOdds {
  if (_selectedOdds is EqualUnmodifiableMapView) return _selectedOdds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedOdds);
}

 final  Set<String> _recentlyUpdatedMatchIds;
@override@JsonKey() Set<String> get recentlyUpdatedMatchIds {
  if (_recentlyUpdatedMatchIds is EqualUnmodifiableSetView) return _recentlyUpdatedMatchIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_recentlyUpdatedMatchIds);
}

@override final  Object? error;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchStateCopyWith<_MatchState> get copyWith => __$MatchStateCopyWithImpl<_MatchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._allMatches, _allMatches)&&const DeepCollectionEquality().equals(other._filteredMatches, _filteredMatches)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&const DeepCollectionEquality().equals(other._selectedOdds, _selectedOdds)&&const DeepCollectionEquality().equals(other._recentlyUpdatedMatchIds, _recentlyUpdatedMatchIds)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_allMatches),const DeepCollectionEquality().hash(_filteredMatches),selectedFilter,const DeepCollectionEquality().hash(_selectedOdds),const DeepCollectionEquality().hash(_recentlyUpdatedMatchIds),const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'MatchState(status: $status, allMatches: $allMatches, filteredMatches: $filteredMatches, selectedFilter: $selectedFilter, selectedOdds: $selectedOdds, recentlyUpdatedMatchIds: $recentlyUpdatedMatchIds, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MatchStateCopyWith<$Res> implements $MatchStateCopyWith<$Res> {
  factory _$MatchStateCopyWith(_MatchState value, $Res Function(_MatchState) _then) = __$MatchStateCopyWithImpl;
@override @useResult
$Res call({
 MatchStatus status, List<MatchModel> allMatches, List<MatchModel> filteredMatches, SportType? selectedFilter, Map<String, String> selectedOdds, Set<String> recentlyUpdatedMatchIds, Object? error
});




}
/// @nodoc
class __$MatchStateCopyWithImpl<$Res>
    implements _$MatchStateCopyWith<$Res> {
  __$MatchStateCopyWithImpl(this._self, this._then);

  final _MatchState _self;
  final $Res Function(_MatchState) _then;

/// Create a copy of MatchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? allMatches = null,Object? filteredMatches = null,Object? selectedFilter = freezed,Object? selectedOdds = null,Object? recentlyUpdatedMatchIds = null,Object? error = freezed,}) {
  return _then(_MatchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MatchStatus,allMatches: null == allMatches ? _self._allMatches : allMatches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,filteredMatches: null == filteredMatches ? _self._filteredMatches : filteredMatches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,selectedFilter: freezed == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as SportType?,selectedOdds: null == selectedOdds ? _self._selectedOdds : selectedOdds // ignore: cast_nullable_to_non_nullable
as Map<String, String>,recentlyUpdatedMatchIds: null == recentlyUpdatedMatchIds ? _self._recentlyUpdatedMatchIds : recentlyUpdatedMatchIds // ignore: cast_nullable_to_non_nullable
as Set<String>,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
