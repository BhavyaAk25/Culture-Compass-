/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'greeting.dart' as _i2;
import 'brief.dart' as _i3;
import 'claim.dart' as _i4;
import 'contradiction.dart' as _i5;
import 'presence.dart' as _i6;
import 'room.dart' as _i7;
import 'room_event.dart' as _i8;
import 'room_member.dart' as _i9;
import 'source.dart' as _i10;
import 'suggested_source.dart' as _i11;
import 'user_profile.dart' as _i12;
import 'package:culture_compass_client/src/protocol/claim.dart' as _i13;
import 'package:culture_compass_client/src/protocol/contradiction.dart' as _i14;
import 'package:culture_compass_client/src/protocol/room.dart' as _i15;
import 'package:culture_compass_client/src/protocol/user_profile.dart' as _i16;
import 'package:culture_compass_client/src/protocol/source.dart' as _i17;
import 'package:culture_compass_client/src/protocol/suggested_source.dart'
    as _i18;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i19;
export 'greeting.dart';
export 'brief.dart';
export 'claim.dart';
export 'contradiction.dart';
export 'presence.dart';
export 'room.dart';
export 'room_event.dart';
export 'room_member.dart';
export 'source.dart';
export 'suggested_source.dart';
export 'user_profile.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.Brief) {
      return _i3.Brief.fromJson(data) as T;
    }
    if (t == _i4.Claim) {
      return _i4.Claim.fromJson(data) as T;
    }
    if (t == _i5.Contradiction) {
      return _i5.Contradiction.fromJson(data) as T;
    }
    if (t == _i6.Presence) {
      return _i6.Presence.fromJson(data) as T;
    }
    if (t == _i7.Room) {
      return _i7.Room.fromJson(data) as T;
    }
    if (t == _i8.RoomEvent) {
      return _i8.RoomEvent.fromJson(data) as T;
    }
    if (t == _i9.RoomMember) {
      return _i9.RoomMember.fromJson(data) as T;
    }
    if (t == _i10.Source) {
      return _i10.Source.fromJson(data) as T;
    }
    if (t == _i11.SuggestedSource) {
      return _i11.SuggestedSource.fromJson(data) as T;
    }
    if (t == _i12.UserProfile) {
      return _i12.UserProfile.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Brief?>()) {
      return (data != null ? _i3.Brief.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Claim?>()) {
      return (data != null ? _i4.Claim.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Contradiction?>()) {
      return (data != null ? _i5.Contradiction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Presence?>()) {
      return (data != null ? _i6.Presence.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Room?>()) {
      return (data != null ? _i7.Room.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.RoomEvent?>()) {
      return (data != null ? _i8.RoomEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.RoomMember?>()) {
      return (data != null ? _i9.RoomMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Source?>()) {
      return (data != null ? _i10.Source.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.SuggestedSource?>()) {
      return (data != null ? _i11.SuggestedSource.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.UserProfile?>()) {
      return (data != null ? _i12.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<_i13.Claim>) {
      return (data as List).map((e) => deserialize<_i13.Claim>(e)).toList()
          as T;
    }
    if (t == List<_i14.Contradiction>) {
      return (data as List)
          .map((e) => deserialize<_i14.Contradiction>(e))
          .toList() as T;
    }
    if (t == List<_i15.Room>) {
      return (data as List).map((e) => deserialize<_i15.Room>(e)).toList() as T;
    }
    if (t == List<_i16.UserProfile>) {
      return (data as List)
          .map((e) => deserialize<_i16.UserProfile>(e))
          .toList() as T;
    }
    if (t == List<_i17.Source>) {
      return (data as List).map((e) => deserialize<_i17.Source>(e)).toList()
          as T;
    }
    if (t == List<_i18.SuggestedSource>) {
      return (data as List)
          .map((e) => deserialize<_i18.SuggestedSource>(e))
          .toList() as T;
    }
    try {
      return _i19.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.Brief) {
      return 'Brief';
    }
    if (data is _i4.Claim) {
      return 'Claim';
    }
    if (data is _i5.Contradiction) {
      return 'Contradiction';
    }
    if (data is _i6.Presence) {
      return 'Presence';
    }
    if (data is _i7.Room) {
      return 'Room';
    }
    if (data is _i8.RoomEvent) {
      return 'RoomEvent';
    }
    if (data is _i9.RoomMember) {
      return 'RoomMember';
    }
    if (data is _i10.Source) {
      return 'Source';
    }
    if (data is _i11.SuggestedSource) {
      return 'SuggestedSource';
    }
    if (data is _i12.UserProfile) {
      return 'UserProfile';
    }
    className = _i19.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'Brief') {
      return deserialize<_i3.Brief>(data['data']);
    }
    if (dataClassName == 'Claim') {
      return deserialize<_i4.Claim>(data['data']);
    }
    if (dataClassName == 'Contradiction') {
      return deserialize<_i5.Contradiction>(data['data']);
    }
    if (dataClassName == 'Presence') {
      return deserialize<_i6.Presence>(data['data']);
    }
    if (dataClassName == 'Room') {
      return deserialize<_i7.Room>(data['data']);
    }
    if (dataClassName == 'RoomEvent') {
      return deserialize<_i8.RoomEvent>(data['data']);
    }
    if (dataClassName == 'RoomMember') {
      return deserialize<_i9.RoomMember>(data['data']);
    }
    if (dataClassName == 'Source') {
      return deserialize<_i10.Source>(data['data']);
    }
    if (dataClassName == 'SuggestedSource') {
      return deserialize<_i11.SuggestedSource>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i12.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i19.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
