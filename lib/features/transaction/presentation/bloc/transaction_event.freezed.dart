// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent()';
}


}

/// @nodoc
class $TransactionEventCopyWith<$Res>  {
$TransactionEventCopyWith(TransactionEvent _, $Res Function(TransactionEvent) __);
}


/// Adds pattern-matching-related methods to [TransactionEvent].
extension TransactionEventPatterns on TransactionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _FetchTransactions value)?  fetchTransactions,TResult Function( _FetchTransactionById value)?  fetchTransactionById,TResult Function( _CreateTransaction value)?  createTransaction,TResult Function( _UpdateTransaction value)?  updateTransaction,TResult Function( _UploadProofPayment value)?  uploadProofPayment,TResult Function( _CancelTransaction value)?  cancelTransaction,TResult Function( _Refresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FetchTransactions() when fetchTransactions != null:
return fetchTransactions(_that);case _FetchTransactionById() when fetchTransactionById != null:
return fetchTransactionById(_that);case _CreateTransaction() when createTransaction != null:
return createTransaction(_that);case _UpdateTransaction() when updateTransaction != null:
return updateTransaction(_that);case _UploadProofPayment() when uploadProofPayment != null:
return uploadProofPayment(_that);case _CancelTransaction() when cancelTransaction != null:
return cancelTransaction(_that);case _Refresh() when refresh != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _FetchTransactions value)  fetchTransactions,required TResult Function( _FetchTransactionById value)  fetchTransactionById,required TResult Function( _CreateTransaction value)  createTransaction,required TResult Function( _UpdateTransaction value)  updateTransaction,required TResult Function( _UploadProofPayment value)  uploadProofPayment,required TResult Function( _CancelTransaction value)  cancelTransaction,required TResult Function( _Refresh value)  refresh,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _FetchTransactions():
return fetchTransactions(_that);case _FetchTransactionById():
return fetchTransactionById(_that);case _CreateTransaction():
return createTransaction(_that);case _UpdateTransaction():
return updateTransaction(_that);case _UploadProofPayment():
return uploadProofPayment(_that);case _CancelTransaction():
return cancelTransaction(_that);case _Refresh():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _FetchTransactions value)?  fetchTransactions,TResult? Function( _FetchTransactionById value)?  fetchTransactionById,TResult? Function( _CreateTransaction value)?  createTransaction,TResult? Function( _UpdateTransaction value)?  updateTransaction,TResult? Function( _UploadProofPayment value)?  uploadProofPayment,TResult? Function( _CancelTransaction value)?  cancelTransaction,TResult? Function( _Refresh value)?  refresh,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _FetchTransactions() when fetchTransactions != null:
return fetchTransactions(_that);case _FetchTransactionById() when fetchTransactionById != null:
return fetchTransactionById(_that);case _CreateTransaction() when createTransaction != null:
return createTransaction(_that);case _UpdateTransaction() when updateTransaction != null:
return updateTransaction(_that);case _UploadProofPayment() when uploadProofPayment != null:
return uploadProofPayment(_that);case _CancelTransaction() when cancelTransaction != null:
return cancelTransaction(_that);case _Refresh() when refresh != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( bool isPaginate,  int perPage,  int page)?  fetchTransactions,TResult Function( int id)?  fetchTransactionById,TResult Function( int slot,  int sportActivityId,  int paymentMethodId)?  createTransaction,TResult Function( int id,  String status)?  updateTransaction,TResult Function( int id,  String proofPaymentUrl)?  uploadProofPayment,TResult Function( int id)?  cancelTransaction,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FetchTransactions() when fetchTransactions != null:
return fetchTransactions(_that.isPaginate,_that.perPage,_that.page);case _FetchTransactionById() when fetchTransactionById != null:
return fetchTransactionById(_that.id);case _CreateTransaction() when createTransaction != null:
return createTransaction(_that.slot,_that.sportActivityId,_that.paymentMethodId);case _UpdateTransaction() when updateTransaction != null:
return updateTransaction(_that.id,_that.status);case _UploadProofPayment() when uploadProofPayment != null:
return uploadProofPayment(_that.id,_that.proofPaymentUrl);case _CancelTransaction() when cancelTransaction != null:
return cancelTransaction(_that.id);case _Refresh() when refresh != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( bool isPaginate,  int perPage,  int page)  fetchTransactions,required TResult Function( int id)  fetchTransactionById,required TResult Function( int slot,  int sportActivityId,  int paymentMethodId)  createTransaction,required TResult Function( int id,  String status)  updateTransaction,required TResult Function( int id,  String proofPaymentUrl)  uploadProofPayment,required TResult Function( int id)  cancelTransaction,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _FetchTransactions():
return fetchTransactions(_that.isPaginate,_that.perPage,_that.page);case _FetchTransactionById():
return fetchTransactionById(_that.id);case _CreateTransaction():
return createTransaction(_that.slot,_that.sportActivityId,_that.paymentMethodId);case _UpdateTransaction():
return updateTransaction(_that.id,_that.status);case _UploadProofPayment():
return uploadProofPayment(_that.id,_that.proofPaymentUrl);case _CancelTransaction():
return cancelTransaction(_that.id);case _Refresh():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( bool isPaginate,  int perPage,  int page)?  fetchTransactions,TResult? Function( int id)?  fetchTransactionById,TResult? Function( int slot,  int sportActivityId,  int paymentMethodId)?  createTransaction,TResult? Function( int id,  String status)?  updateTransaction,TResult? Function( int id,  String proofPaymentUrl)?  uploadProofPayment,TResult? Function( int id)?  cancelTransaction,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _FetchTransactions() when fetchTransactions != null:
return fetchTransactions(_that.isPaginate,_that.perPage,_that.page);case _FetchTransactionById() when fetchTransactionById != null:
return fetchTransactionById(_that.id);case _CreateTransaction() when createTransaction != null:
return createTransaction(_that.slot,_that.sportActivityId,_that.paymentMethodId);case _UpdateTransaction() when updateTransaction != null:
return updateTransaction(_that.id,_that.status);case _UploadProofPayment() when uploadProofPayment != null:
return uploadProofPayment(_that.id,_that.proofPaymentUrl);case _CancelTransaction() when cancelTransaction != null:
return cancelTransaction(_that.id);case _Refresh() when refresh != null:
return refresh();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TransactionEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent.started()';
}


}




/// @nodoc


class _FetchTransactions implements TransactionEvent {
  const _FetchTransactions({this.isPaginate = true, this.perPage = 10, this.page = 1});
  

@JsonKey() final  bool isPaginate;
@JsonKey() final  int perPage;
@JsonKey() final  int page;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchTransactionsCopyWith<_FetchTransactions> get copyWith => __$FetchTransactionsCopyWithImpl<_FetchTransactions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTransactions&&(identical(other.isPaginate, isPaginate) || other.isPaginate == isPaginate)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,isPaginate,perPage,page);

@override
String toString() {
  return 'TransactionEvent.fetchTransactions(isPaginate: $isPaginate, perPage: $perPage, page: $page)';
}


}

/// @nodoc
abstract mixin class _$FetchTransactionsCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory _$FetchTransactionsCopyWith(_FetchTransactions value, $Res Function(_FetchTransactions) _then) = __$FetchTransactionsCopyWithImpl;
@useResult
$Res call({
 bool isPaginate, int perPage, int page
});




}
/// @nodoc
class __$FetchTransactionsCopyWithImpl<$Res>
    implements _$FetchTransactionsCopyWith<$Res> {
  __$FetchTransactionsCopyWithImpl(this._self, this._then);

  final _FetchTransactions _self;
  final $Res Function(_FetchTransactions) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPaginate = null,Object? perPage = null,Object? page = null,}) {
  return _then(_FetchTransactions(
isPaginate: null == isPaginate ? _self.isPaginate : isPaginate // ignore: cast_nullable_to_non_nullable
as bool,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _FetchTransactionById implements TransactionEvent {
  const _FetchTransactionById(this.id);
  

 final  int id;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchTransactionByIdCopyWith<_FetchTransactionById> get copyWith => __$FetchTransactionByIdCopyWithImpl<_FetchTransactionById>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchTransactionById&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TransactionEvent.fetchTransactionById(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchTransactionByIdCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory _$FetchTransactionByIdCopyWith(_FetchTransactionById value, $Res Function(_FetchTransactionById) _then) = __$FetchTransactionByIdCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchTransactionByIdCopyWithImpl<$Res>
    implements _$FetchTransactionByIdCopyWith<$Res> {
  __$FetchTransactionByIdCopyWithImpl(this._self, this._then);

  final _FetchTransactionById _self;
  final $Res Function(_FetchTransactionById) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchTransactionById(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CreateTransaction implements TransactionEvent {
  const _CreateTransaction({required this.slot, required this.sportActivityId, required this.paymentMethodId});
  

 final  int slot;
 final  int sportActivityId;
 final  int paymentMethodId;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionCopyWith<_CreateTransaction> get copyWith => __$CreateTransactionCopyWithImpl<_CreateTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransaction&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.sportActivityId, sportActivityId) || other.sportActivityId == sportActivityId)&&(identical(other.paymentMethodId, paymentMethodId) || other.paymentMethodId == paymentMethodId));
}


@override
int get hashCode => Object.hash(runtimeType,slot,sportActivityId,paymentMethodId);

@override
String toString() {
  return 'TransactionEvent.createTransaction(slot: $slot, sportActivityId: $sportActivityId, paymentMethodId: $paymentMethodId)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory _$CreateTransactionCopyWith(_CreateTransaction value, $Res Function(_CreateTransaction) _then) = __$CreateTransactionCopyWithImpl;
@useResult
$Res call({
 int slot, int sportActivityId, int paymentMethodId
});




}
/// @nodoc
class __$CreateTransactionCopyWithImpl<$Res>
    implements _$CreateTransactionCopyWith<$Res> {
  __$CreateTransactionCopyWithImpl(this._self, this._then);

  final _CreateTransaction _self;
  final $Res Function(_CreateTransaction) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slot = null,Object? sportActivityId = null,Object? paymentMethodId = null,}) {
  return _then(_CreateTransaction(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,sportActivityId: null == sportActivityId ? _self.sportActivityId : sportActivityId // ignore: cast_nullable_to_non_nullable
as int,paymentMethodId: null == paymentMethodId ? _self.paymentMethodId : paymentMethodId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateTransaction implements TransactionEvent {
  const _UpdateTransaction({required this.id, required this.status});
  

 final  int id;
 final  String status;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTransactionCopyWith<_UpdateTransaction> get copyWith => __$UpdateTransactionCopyWithImpl<_UpdateTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'TransactionEvent.updateTransaction(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateTransactionCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory _$UpdateTransactionCopyWith(_UpdateTransaction value, $Res Function(_UpdateTransaction) _then) = __$UpdateTransactionCopyWithImpl;
@useResult
$Res call({
 int id, String status
});




}
/// @nodoc
class __$UpdateTransactionCopyWithImpl<$Res>
    implements _$UpdateTransactionCopyWith<$Res> {
  __$UpdateTransactionCopyWithImpl(this._self, this._then);

  final _UpdateTransaction _self;
  final $Res Function(_UpdateTransaction) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,}) {
  return _then(_UpdateTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UploadProofPayment implements TransactionEvent {
  const _UploadProofPayment({required this.id, required this.proofPaymentUrl});
  

 final  int id;
 final  String proofPaymentUrl;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadProofPaymentCopyWith<_UploadProofPayment> get copyWith => __$UploadProofPaymentCopyWithImpl<_UploadProofPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadProofPayment&&(identical(other.id, id) || other.id == id)&&(identical(other.proofPaymentUrl, proofPaymentUrl) || other.proofPaymentUrl == proofPaymentUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,proofPaymentUrl);

@override
String toString() {
  return 'TransactionEvent.uploadProofPayment(id: $id, proofPaymentUrl: $proofPaymentUrl)';
}


}

/// @nodoc
abstract mixin class _$UploadProofPaymentCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory _$UploadProofPaymentCopyWith(_UploadProofPayment value, $Res Function(_UploadProofPayment) _then) = __$UploadProofPaymentCopyWithImpl;
@useResult
$Res call({
 int id, String proofPaymentUrl
});




}
/// @nodoc
class __$UploadProofPaymentCopyWithImpl<$Res>
    implements _$UploadProofPaymentCopyWith<$Res> {
  __$UploadProofPaymentCopyWithImpl(this._self, this._then);

  final _UploadProofPayment _self;
  final $Res Function(_UploadProofPayment) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? proofPaymentUrl = null,}) {
  return _then(_UploadProofPayment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,proofPaymentUrl: null == proofPaymentUrl ? _self.proofPaymentUrl : proofPaymentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CancelTransaction implements TransactionEvent {
  const _CancelTransaction(this.id);
  

 final  int id;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelTransactionCopyWith<_CancelTransaction> get copyWith => __$CancelTransactionCopyWithImpl<_CancelTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelTransaction&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TransactionEvent.cancelTransaction(id: $id)';
}


}

/// @nodoc
abstract mixin class _$CancelTransactionCopyWith<$Res> implements $TransactionEventCopyWith<$Res> {
  factory _$CancelTransactionCopyWith(_CancelTransaction value, $Res Function(_CancelTransaction) _then) = __$CancelTransactionCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$CancelTransactionCopyWithImpl<$Res>
    implements _$CancelTransactionCopyWith<$Res> {
  __$CancelTransactionCopyWithImpl(this._self, this._then);

  final _CancelTransaction _self;
  final $Res Function(_CancelTransaction) _then;

/// Create a copy of TransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_CancelTransaction(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Refresh implements TransactionEvent {
  const _Refresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionEvent.refresh()';
}


}




// dart format on
