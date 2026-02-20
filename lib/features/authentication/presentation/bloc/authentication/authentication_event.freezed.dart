// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent()';
}


}

/// @nodoc
class $AuthenticationEventCopyWith<$Res>  {
$AuthenticationEventCopyWith(AuthenticationEvent _, $Res Function(AuthenticationEvent) __);
}


/// Adds pattern-matching-related methods to [AuthenticationEvent].
extension AuthenticationEventPatterns on AuthenticationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchUser value)?  fetchUser,TResult Function( _Logout value)?  logout,TResult Function( _CheckToken value)?  checkToken,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchUser() when fetchUser != null:
return fetchUser(_that);case _Logout() when logout != null:
return logout(_that);case _CheckToken() when checkToken != null:
return checkToken(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchUser value)  fetchUser,required TResult Function( _Logout value)  logout,required TResult Function( _CheckToken value)  checkToken,}){
final _that = this;
switch (_that) {
case _FetchUser():
return fetchUser(_that);case _Logout():
return logout(_that);case _CheckToken():
return checkToken(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchUser value)?  fetchUser,TResult? Function( _Logout value)?  logout,TResult? Function( _CheckToken value)?  checkToken,}){
final _that = this;
switch (_that) {
case _FetchUser() when fetchUser != null:
return fetchUser(_that);case _Logout() when logout != null:
return logout(_that);case _CheckToken() when checkToken != null:
return checkToken(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchUser,TResult Function()?  logout,TResult Function()?  checkToken,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchUser() when fetchUser != null:
return fetchUser();case _Logout() when logout != null:
return logout();case _CheckToken() when checkToken != null:
return checkToken();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchUser,required TResult Function()  logout,required TResult Function()  checkToken,}) {final _that = this;
switch (_that) {
case _FetchUser():
return fetchUser();case _Logout():
return logout();case _CheckToken():
return checkToken();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchUser,TResult? Function()?  logout,TResult? Function()?  checkToken,}) {final _that = this;
switch (_that) {
case _FetchUser() when fetchUser != null:
return fetchUser();case _Logout() when logout != null:
return logout();case _CheckToken() when checkToken != null:
return checkToken();case _:
  return null;

}
}

}

/// @nodoc


class _FetchUser implements AuthenticationEvent {
  const _FetchUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent.fetchUser()';
}


}




/// @nodoc


class _Logout implements AuthenticationEvent {
  const _Logout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent.logout()';
}


}




/// @nodoc


class _CheckToken implements AuthenticationEvent {
  const _CheckToken();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckToken);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationEvent.checkToken()';
}


}




// dart format on
