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
import 'dart:async' as _i2;
import 'package:culture_compass_client/src/protocol/user_profile.dart' as _i3;
import 'package:culture_compass_client/src/protocol/brief.dart' as _i4;
import 'package:culture_compass_client/src/protocol/claim.dart' as _i5;
import 'package:culture_compass_client/src/protocol/contradiction.dart' as _i6;
import 'package:culture_compass_client/src/protocol/presence.dart' as _i7;
import 'package:culture_compass_client/src/protocol/room.dart' as _i8;
import 'package:culture_compass_client/src/protocol/source.dart' as _i9;
import 'package:culture_compass_client/src/protocol/room_event.dart' as _i10;
import 'package:culture_compass_client/src/protocol/suggested_source.dart'
    as _i11;
import 'package:culture_compass_client/src/protocol/greeting.dart' as _i12;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i13;
import 'protocol.dart' as _i14;

/// Demo auth endpoint for hackathon flows.
/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<_i3.UserProfile> signIn(String displayName) =>
      caller.callServerEndpoint<_i3.UserProfile>(
        'auth',
        'signIn',
        {'displayName': displayName},
      );

  _i2.Future<_i3.UserProfile?> getProfile(int userId) =>
      caller.callServerEndpoint<_i3.UserProfile?>(
        'auth',
        'getProfile',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointBrief extends _i1.EndpointRef {
  EndpointBrief(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'brief';

  _i2.Future<_i4.Brief> generateBrief(
    int roomId,
    int userId,
  ) =>
      caller.callServerEndpoint<_i4.Brief>(
        'brief',
        'generateBrief',
        {
          'roomId': roomId,
          'userId': userId,
        },
      );

  _i2.Future<_i4.Brief?> getLatestBrief(int roomId) =>
      caller.callServerEndpoint<_i4.Brief?>(
        'brief',
        'getLatestBrief',
        {'roomId': roomId},
      );
}

/// {@category Endpoint}
class EndpointClaim extends _i1.EndpointRef {
  EndpointClaim(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'claim';

  _i2.Future<_i5.Claim> addClaim(
    int roomId,
    int sourceId,
    String claimText,
    String quote,
    int userId,
  ) =>
      caller.callServerEndpoint<_i5.Claim>(
        'claim',
        'addClaim',
        {
          'roomId': roomId,
          'sourceId': sourceId,
          'claimText': claimText,
          'quote': quote,
          'userId': userId,
        },
      );

  _i2.Future<List<_i5.Claim>> listClaims(int roomId) =>
      caller.callServerEndpoint<List<_i5.Claim>>(
        'claim',
        'listClaims',
        {'roomId': roomId},
      );
}

/// {@category Endpoint}
class EndpointContradiction extends _i1.EndpointRef {
  EndpointContradiction(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'contradiction';

  _i2.Future<_i6.Contradiction> addContradiction(
    int roomId,
    int claimAId,
    int claimBId,
    String type,
    String explanation,
    int userId,
  ) =>
      caller.callServerEndpoint<_i6.Contradiction>(
        'contradiction',
        'addContradiction',
        {
          'roomId': roomId,
          'claimAId': claimAId,
          'claimBId': claimBId,
          'type': type,
          'explanation': explanation,
          'userId': userId,
        },
      );

  _i2.Future<List<_i6.Contradiction>> listContradictions(int roomId) =>
      caller.callServerEndpoint<List<_i6.Contradiction>>(
        'contradiction',
        'listContradictions',
        {'roomId': roomId},
      );
}

/// {@category Endpoint}
class EndpointPresence extends _i1.EndpointRef {
  EndpointPresence(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'presence';

  _i2.Future<void> setStatus(
    int roomId,
    int userId,
    String status,
  ) =>
      caller.callServerEndpoint<void>(
        'presence',
        'setStatus',
        {
          'roomId': roomId,
          'userId': userId,
          'status': status,
        },
      );

  _i2.Future<void> heartbeat(
    int roomId,
    int userId,
  ) =>
      caller.callServerEndpoint<void>(
        'presence',
        'heartbeat',
        {
          'roomId': roomId,
          'userId': userId,
        },
      );

  _i2.Stream<_i7.Presence> streamPresence(int roomId) => caller
          .callStreamingServerEndpoint<_i2.Stream<_i7.Presence>, _i7.Presence>(
        'presence',
        'streamPresence',
        {'roomId': roomId},
        {},
      );
}

/// {@category Endpoint}
class EndpointRoom extends _i1.EndpointRef {
  EndpointRoom(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'room';

  _i2.Future<_i8.Room> createRoom(
    String title,
    String? description,
    int userId,
  ) =>
      caller.callServerEndpoint<_i8.Room>(
        'room',
        'createRoom',
        {
          'title': title,
          'description': description,
          'userId': userId,
        },
      );

  _i2.Future<_i8.Room?> joinByCode(
    String code,
    int userId,
  ) =>
      caller.callServerEndpoint<_i8.Room?>(
        'room',
        'joinByCode',
        {
          'code': code,
          'userId': userId,
        },
      );

  _i2.Future<List<_i8.Room>> listUserRooms(int userId) =>
      caller.callServerEndpoint<List<_i8.Room>>(
        'room',
        'listUserRooms',
        {'userId': userId},
      );

  _i2.Future<_i8.Room?> getRoom(int roomId) =>
      caller.callServerEndpoint<_i8.Room?>(
        'room',
        'getRoom',
        {'roomId': roomId},
      );

  _i2.Future<List<_i3.UserProfile>> listRoomMembers(int roomId) =>
      caller.callServerEndpoint<List<_i3.UserProfile>>(
        'room',
        'listRoomMembers',
        {'roomId': roomId},
      );

  _i2.Future<_i8.Room?> publishRoom(int roomId) =>
      caller.callServerEndpoint<_i8.Room?>(
        'room',
        'publishRoom',
        {'roomId': roomId},
      );
}

/// {@category Endpoint}
class EndpointSource extends _i1.EndpointRef {
  EndpointSource(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'source';

  _i2.Future<_i9.Source> addSource(
    int roomId,
    String url,
    String? snippet,
    int userId,
    String? regionTag,
    String? disciplineTag,
    String? stanceTag,
  ) =>
      caller.callServerEndpoint<_i9.Source>(
        'source',
        'addSource',
        {
          'roomId': roomId,
          'url': url,
          'snippet': snippet,
          'userId': userId,
          'regionTag': regionTag,
          'disciplineTag': disciplineTag,
          'stanceTag': stanceTag,
        },
      );

  _i2.Future<List<_i9.Source>> listSources(int roomId) =>
      caller.callServerEndpoint<List<_i9.Source>>(
        'source',
        'listSources',
        {'roomId': roomId},
      );

  _i2.Stream<_i10.RoomEvent> streamRoomEvents(int roomId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i10.RoomEvent>,
          _i10.RoomEvent>(
        'source',
        'streamRoomEvents',
        {'roomId': roomId},
        {},
      );
}

/// {@category Endpoint}
class EndpointSuggest extends _i1.EndpointRef {
  EndpointSuggest(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'suggest';

  _i2.Future<List<_i11.SuggestedSource>> suggestForClaim(int claimId) =>
      caller.callServerEndpoint<List<_i11.SuggestedSource>>(
        'suggest',
        'suggestForClaim',
        {'claimId': claimId},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i12.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i12.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i13.Caller(client);
  }

  late final _i13.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i14.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    auth = EndpointAuth(this);
    brief = EndpointBrief(this);
    claim = EndpointClaim(this);
    contradiction = EndpointContradiction(this);
    presence = EndpointPresence(this);
    room = EndpointRoom(this);
    source = EndpointSource(this);
    suggest = EndpointSuggest(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointAuth auth;

  late final EndpointBrief brief;

  late final EndpointClaim claim;

  late final EndpointContradiction contradiction;

  late final EndpointPresence presence;

  late final EndpointRoom room;

  late final EndpointSource source;

  late final EndpointSuggest suggest;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'brief': brief,
        'claim': claim,
        'contradiction': contradiction,
        'presence': presence,
        'room': room,
        'source': source,
        'suggest': suggest,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
