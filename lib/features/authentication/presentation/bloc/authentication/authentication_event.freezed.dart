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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchUser value)?  fetchUser,TResult Function( _Logout value)?  logout,TResult Function( _CheckToken value)?  checkToken,TResult Function( _UpdateProfile value)?  updateProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchUser() when fetchUser != null:
return fetchUser(_that);case _Logout() when logout != null:
return logout(_that);case _CheckToken() when checkToken != null:
return checkToken(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchUser value)  fetchUser,required TResult Function( _Logout value)  logout,required TResult Function( _CheckToken value)  checkToken,required TResult Function( _UpdateProfile value)  updateProfile,}){
final _that = this;
switch (_that) {
case _FetchUser():
return fetchUser(_that);case _Logout():
return logout(_that);case _CheckToken():
return checkToken(_that);case _UpdateProfile():
return updateProfile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchUser value)?  fetchUser,TResult? Function( _Logout value)?  logout,TResult? Function( _CheckToken value)?  checkToken,TResult? Function( _UpdateProfile value)?  updateProfile,}){
final _that = this;
switch (_that) {
case _FetchUser() when fetchUser != null:
return fetchUser(_that);case _Logout() when logout != null:
return logout(_that);case _CheckToken() when checkToken != null:
return checkToken(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchUser,TResult Function()?  logout,TResult Function()?  checkToken,TResult Function( String name,  String email,  String? phoneNumber,  String? password,  String? cPassword)?  updateProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchUser() when fetchUser != null:
return fetchUser();case _Logout() when logout != null:
return logout();case _CheckToken() when checkToken != null:
return checkToken();case _UpdateProfile() when updateProfile != null:
return updateProfile(_that.name,_that.email,_that.phoneNumber,_that.password,_that.cPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchUser,required TResult Function()  logout,required TResult Function()  checkToken,required TResult Function( String name,  String email,  String? phoneNumber,  String? password,  String? cPassword)  updateProfile,}) {final _that = this;
switch (_that) {
case _FetchUser():
return fetchUser();case _Logout():
return logout();case _CheckToken():
return checkToken();case _UpdateProfile():
return updateProfile(_that.name,_that.email,_that.phoneNumber,_that.password,_that.cPassword);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchUser,TResult? Function()?  logout,TResult? Function()?  checkToken,TResult? Function( String name,  String email,  String? phoneNumber,  String? password,  String? cPassword)?  updateProfile,}) {final _that = this;
switch (_that) {
case _FetchUser() when fetchUser != null:
return fetchUser();case _Logout() when logout != null:
return logout();case _CheckToken() when checkToken != null:
return checkToken();case _UpdateProfile() when updateProfile != null:
return updateProfile(_that.name,_that.email,_that.phoneNumber,_that.password,_that.cPassword);case _:
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




/// @nodoc


class _UpdateProfile implements AuthenticationEvent {
  const _UpdateProfile({required this.name, required this.email, this.phoneNumber, this.password, this.cPassword});
  

 final  String name;
 final  String email;
 final  String? phoneNumber;
 final  String? password;
 final  String? cPassword;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileCopyWith<_UpdateProfile> get copyWith => __$UpdateProfileCopyWithImpl<_UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.password, password) || other.password == password)&&(identical(other.cPassword, cPassword) || other.cPassword == cPassword));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,phoneNumber,password,cPassword);

@override
String toString() {
  return 'AuthenticationEvent.updateProfile(name: $name, email: $email, phoneNumber: $phoneNumber, password: $password, cPassword: $cPassword)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileCopyWith<$Res> implements $AuthenticationEventCopyWith<$Res> {
  factory _$UpdateProfileCopyWith(_UpdateProfile value, $Res Function(_UpdateProfile) _then) = __$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 String name, String email, String? phoneNumber, String? password, String? cPassword
});




}
/// @nodoc
class __$UpdateProfileCopyWithImpl<$Res>
    implements _$UpdateProfileCopyWith<$Res> {
  __$UpdateProfileCopyWithImpl(this._self, this._then);

  final _UpdateProfile _self;
  final $Res Function(_UpdateProfile) _then;

/// Create a copy of AuthenticationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phoneNumber = freezed,Object? password = freezed,Object? cPassword = freezed,}) {
  return _then(_UpdateProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,cPassword: freezed == cPassword ? _self.cPassword : cPassword // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
