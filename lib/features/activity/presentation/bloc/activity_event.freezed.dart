// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivityEvent()';
}


}

/// @nodoc
class $ActivityEventCopyWith<$Res>  {
$ActivityEventCopyWith(ActivityEvent _, $Res Function(ActivityEvent) __);
}


/// Adds pattern-matching-related methods to [ActivityEvent].
extension ActivityEventPatterns on ActivityEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _FetchActivities value)?  fetchActivities,TResult Function( _Refresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FetchActivities() when fetchActivities != null:
return fetchActivities(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _FetchActivities value)  fetchActivities,required TResult Function( _Refresh value)  refresh,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _FetchActivities():
return fetchActivities(_that);case _Refresh():
return refresh(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _FetchActivities value)?  fetchActivities,TResult? Function( _Refresh value)?  refresh,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FetchActivities() when fetchActivities != null:
return fetchActivities(_that);case _Refresh() when refresh != null:
return refresh(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int page,  int perPage,  String? search,  int? sportCategoryId,  int? cityId)?  fetchActivities,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FetchActivities() when fetchActivities != null:
return fetchActivities(_that.page,_that.perPage,_that.search,_that.sportCategoryId,_that.cityId);case _Refresh() when refresh != null:
return refresh();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int page,  int perPage,  String? search,  int? sportCategoryId,  int? cityId)  fetchActivities,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _FetchActivities():
return fetchActivities(_that.page,_that.perPage,_that.search,_that.sportCategoryId,_that.cityId);case _Refresh():
return refresh();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int page,  int perPage,  String? search,  int? sportCategoryId,  int? cityId)?  fetchActivities,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FetchActivities() when fetchActivities != null:
return fetchActivities(_that.page,_that.perPage,_that.search,_that.sportCategoryId,_that.cityId);case _Refresh() when refresh != null:
return refresh();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ActivityEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivityEvent.started()';
}


}




/// @nodoc


class _FetchActivities implements ActivityEvent {
  const _FetchActivities({this.page = 1, this.perPage = 10, this.search, this.sportCategoryId, this.cityId});
  

@JsonKey() final  int page;
@JsonKey() final  int perPage;
 final  String? search;
 final  int? sportCategoryId;
 final  int? cityId;

/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchActivitiesCopyWith<_FetchActivities> get copyWith => __$FetchActivitiesCopyWithImpl<_FetchActivities>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchActivities&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.search, search) || other.search == search)&&(identical(other.sportCategoryId, sportCategoryId) || other.sportCategoryId == sportCategoryId)&&(identical(other.cityId, cityId) || other.cityId == cityId));
}


@override
int get hashCode => Object.hash(runtimeType,page,perPage,search,sportCategoryId,cityId);

@override
String toString() {
  return 'ActivityEvent.fetchActivities(page: $page, perPage: $perPage, search: $search, sportCategoryId: $sportCategoryId, cityId: $cityId)';
}


}

/// @nodoc
abstract mixin class _$FetchActivitiesCopyWith<$Res> implements $ActivityEventCopyWith<$Res> {
  factory _$FetchActivitiesCopyWith(_FetchActivities value, $Res Function(_FetchActivities) _then) = __$FetchActivitiesCopyWithImpl;
@useResult
$Res call({
 int page, int perPage, String? search, int? sportCategoryId, int? cityId
});




}
/// @nodoc
class __$FetchActivitiesCopyWithImpl<$Res>
    implements _$FetchActivitiesCopyWith<$Res> {
  __$FetchActivitiesCopyWithImpl(this._self, this._then);

  final _FetchActivities _self;
  final $Res Function(_FetchActivities) _then;

/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,Object? perPage = null,Object? search = freezed,Object? sportCategoryId = freezed,Object? cityId = freezed,}) {
  return _then(_FetchActivities(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sportCategoryId: freezed == sportCategoryId ? _self.sportCategoryId : sportCategoryId // ignore: cast_nullable_to_non_nullable
as int?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _Refresh implements ActivityEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivityEvent.refresh()';
}


}




// dart format on
