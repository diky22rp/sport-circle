// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryEvent {

 int get page; int get perPage;
/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryEventCopyWith<CategoryEvent> get copyWith => _$CategoryEventCopyWithImpl<CategoryEvent>(this as CategoryEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryEvent&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}


@override
int get hashCode => Object.hash(runtimeType,page,perPage);

@override
String toString() {
  return 'CategoryEvent(page: $page, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class $CategoryEventCopyWith<$Res>  {
  factory $CategoryEventCopyWith(CategoryEvent value, $Res Function(CategoryEvent) _then) = _$CategoryEventCopyWithImpl;
@useResult
$Res call({
 int page, int perPage
});




}
/// @nodoc
class _$CategoryEventCopyWithImpl<$Res>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._self, this._then);

  final CategoryEvent _self;
  final $Res Function(CategoryEvent) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? perPage = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryEvent].
extension CategoryEventPatterns on CategoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchCategories value)?  fetch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchCategories() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchCategories value)  fetch,}){
final _that = this;
switch (_that) {
case FetchCategories():
return fetch(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchCategories value)?  fetch,}){
final _that = this;
switch (_that) {
case FetchCategories() when fetch != null:
return fetch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page,  int perPage)?  fetch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchCategories() when fetch != null:
return fetch(_that.page,_that.perPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page,  int perPage)  fetch,}) {final _that = this;
switch (_that) {
case FetchCategories():
return fetch(_that.page,_that.perPage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page,  int perPage)?  fetch,}) {final _that = this;
switch (_that) {
case FetchCategories() when fetch != null:
return fetch(_that.page,_that.perPage);case _:
  return null;

}
}

}

/// @nodoc


class FetchCategories implements CategoryEvent {
  const FetchCategories({this.page = 1, this.perPage = 5});
  

@override@JsonKey() final  int page;
@override@JsonKey() final  int perPage;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchCategoriesCopyWith<FetchCategories> get copyWith => _$FetchCategoriesCopyWithImpl<FetchCategories>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchCategories&&(identical(other.page, page) || other.page == page)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}


@override
int get hashCode => Object.hash(runtimeType,page,perPage);

@override
String toString() {
  return 'CategoryEvent.fetch(page: $page, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class $FetchCategoriesCopyWith<$Res> implements $CategoryEventCopyWith<$Res> {
  factory $FetchCategoriesCopyWith(FetchCategories value, $Res Function(FetchCategories) _then) = _$FetchCategoriesCopyWithImpl;
@override @useResult
$Res call({
 int page, int perPage
});




}
/// @nodoc
class _$FetchCategoriesCopyWithImpl<$Res>
    implements $FetchCategoriesCopyWith<$Res> {
  _$FetchCategoriesCopyWithImpl(this._self, this._then);

  final FetchCategories _self;
  final $Res Function(FetchCategories) _then;

/// Create a copy of CategoryEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? perPage = null,}) {
  return _then(FetchCategories(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
