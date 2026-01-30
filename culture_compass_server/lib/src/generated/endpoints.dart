/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/brief_endpoint.dart' as _i3;
import '../endpoints/claim_endpoint.dart' as _i4;
import '../endpoints/contradiction_endpoint.dart' as _i5;
import '../endpoints/presence_endpoint.dart' as _i6;
import '../endpoints/room_endpoint.dart' as _i7;
import '../endpoints/source_endpoint.dart' as _i8;
import '../endpoints/suggest_endpoint.dart' as _i9;
import '../greeting_endpoint.dart' as _i10;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i11;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'brief': _i3.BriefEndpoint()
        ..initialize(
          server,
          'brief',
          null,
        ),
      'claim': _i4.ClaimEndpoint()
        ..initialize(
          server,
          'claim',
          null,
        ),
      'contradiction': _i5.ContradictionEndpoint()
        ..initialize(
          server,
          'contradiction',
          null,
        ),
      'presence': _i6.PresenceEndpoint()
        ..initialize(
          server,
          'presence',
          null,
        ),
      'room': _i7.RoomEndpoint()
        ..initialize(
          server,
          'room',
          null,
        ),
      'source': _i8.SourceEndpoint()
        ..initialize(
          server,
          'source',
          null,
        ),
      'suggest': _i9.SuggestEndpoint()
        ..initialize(
          server,
          'suggest',
          null,
        ),
      'greeting': _i10.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'signIn': _i1.MethodConnector(
          name: 'signIn',
          params: {
            'displayName': _i1.ParameterDescription(
              name: 'displayName',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).signIn(
            session,
            params['displayName'],
          ),
        ),
        'getProfile': _i1.MethodConnector(
          name: 'getProfile',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).getProfile(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['brief'] = _i1.EndpointConnector(
      name: 'brief',
      endpoint: endpoints['brief']!,
      methodConnectors: {
        'generateBrief': _i1.MethodConnector(
          name: 'generateBrief',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['brief'] as _i3.BriefEndpoint).generateBrief(
            session,
            params['roomId'],
            params['userId'],
          ),
        ),
        'getLatestBrief': _i1.MethodConnector(
          name: 'getLatestBrief',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['brief'] as _i3.BriefEndpoint).getLatestBrief(
            session,
            params['roomId'],
          ),
        ),
      },
    );
    connectors['claim'] = _i1.EndpointConnector(
      name: 'claim',
      endpoint: endpoints['claim']!,
      methodConnectors: {
        'addClaim': _i1.MethodConnector(
          name: 'addClaim',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sourceId': _i1.ParameterDescription(
              name: 'sourceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'claimText': _i1.ParameterDescription(
              name: 'claimText',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'quote': _i1.ParameterDescription(
              name: 'quote',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['claim'] as _i4.ClaimEndpoint).addClaim(
            session,
            params['roomId'],
            params['sourceId'],
            params['claimText'],
            params['quote'],
            params['userId'],
          ),
        ),
        'listClaims': _i1.MethodConnector(
          name: 'listClaims',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['claim'] as _i4.ClaimEndpoint).listClaims(
            session,
            params['roomId'],
          ),
        ),
      },
    );
    connectors['contradiction'] = _i1.EndpointConnector(
      name: 'contradiction',
      endpoint: endpoints['contradiction']!,
      methodConnectors: {
        'addContradiction': _i1.MethodConnector(
          name: 'addContradiction',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'claimAId': _i1.ParameterDescription(
              name: 'claimAId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'claimBId': _i1.ParameterDescription(
              name: 'claimBId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'explanation': _i1.ParameterDescription(
              name: 'explanation',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contradiction'] as _i5.ContradictionEndpoint)
                  .addContradiction(
            session,
            params['roomId'],
            params['claimAId'],
            params['claimBId'],
            params['type'],
            params['explanation'],
            params['userId'],
          ),
        ),
        'listContradictions': _i1.MethodConnector(
          name: 'listContradictions',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contradiction'] as _i5.ContradictionEndpoint)
                  .listContradictions(
            session,
            params['roomId'],
          ),
        ),
      },
    );
    connectors['presence'] = _i1.EndpointConnector(
      name: 'presence',
      endpoint: endpoints['presence']!,
      methodConnectors: {
        'setStatus': _i1.MethodConnector(
          name: 'setStatus',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['presence'] as _i6.PresenceEndpoint).setStatus(
            session,
            params['roomId'],
            params['userId'],
            params['status'],
          ),
        ),
        'heartbeat': _i1.MethodConnector(
          name: 'heartbeat',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['presence'] as _i6.PresenceEndpoint).heartbeat(
            session,
            params['roomId'],
            params['userId'],
          ),
        ),
        'streamPresence': _i1.MethodStreamConnector(
          name: 'streamPresence',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['presence'] as _i6.PresenceEndpoint).streamPresence(
            session,
            params['roomId'],
          ),
        ),
      },
    );
    connectors['room'] = _i1.EndpointConnector(
      name: 'room',
      endpoint: endpoints['room']!,
      methodConnectors: {
        'createRoom': _i1.MethodConnector(
          name: 'createRoom',
          params: {
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['room'] as _i7.RoomEndpoint).createRoom(
            session,
            params['title'],
            params['description'],
            params['userId'],
          ),
        ),
        'joinByCode': _i1.MethodConnector(
          name: 'joinByCode',
          params: {
            'code': _i1.ParameterDescription(
              name: 'code',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['room'] as _i7.RoomEndpoint).joinByCode(
            session,
            params['code'],
            params['userId'],
          ),
        ),
        'listUserRooms': _i1.MethodConnector(
          name: 'listUserRooms',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['room'] as _i7.RoomEndpoint).listUserRooms(
            session,
            params['userId'],
          ),
        ),
        'getRoom': _i1.MethodConnector(
          name: 'getRoom',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['room'] as _i7.RoomEndpoint).getRoom(
            session,
            params['roomId'],
          ),
        ),
        'listRoomMembers': _i1.MethodConnector(
          name: 'listRoomMembers',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['room'] as _i7.RoomEndpoint).listRoomMembers(
            session,
            params['roomId'],
          ),
        ),
        'publishRoom': _i1.MethodConnector(
          name: 'publishRoom',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['room'] as _i7.RoomEndpoint).publishRoom(
            session,
            params['roomId'],
          ),
        ),
      },
    );
    connectors['source'] = _i1.EndpointConnector(
      name: 'source',
      endpoint: endpoints['source']!,
      methodConnectors: {
        'addSource': _i1.MethodConnector(
          name: 'addSource',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'url': _i1.ParameterDescription(
              name: 'url',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'snippet': _i1.ParameterDescription(
              name: 'snippet',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'regionTag': _i1.ParameterDescription(
              name: 'regionTag',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'disciplineTag': _i1.ParameterDescription(
              name: 'disciplineTag',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'stanceTag': _i1.ParameterDescription(
              name: 'stanceTag',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['source'] as _i8.SourceEndpoint).addSource(
            session,
            params['roomId'],
            params['url'],
            params['snippet'],
            params['userId'],
            params['regionTag'],
            params['disciplineTag'],
            params['stanceTag'],
          ),
        ),
        'listSources': _i1.MethodConnector(
          name: 'listSources',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['source'] as _i8.SourceEndpoint).listSources(
            session,
            params['roomId'],
          ),
        ),
        'streamRoomEvents': _i1.MethodStreamConnector(
          name: 'streamRoomEvents',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['source'] as _i8.SourceEndpoint).streamRoomEvents(
            session,
            params['roomId'],
          ),
        ),
      },
    );
    connectors['suggest'] = _i1.EndpointConnector(
      name: 'suggest',
      endpoint: endpoints['suggest']!,
      methodConnectors: {
        'suggestForClaim': _i1.MethodConnector(
          name: 'suggestForClaim',
          params: {
            'claimId': _i1.ParameterDescription(
              name: 'claimId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['suggest'] as _i9.SuggestEndpoint).suggestForClaim(
            session,
            params['claimId'],
          ),
        )
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i10.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i11.Endpoints()..initializeEndpoints(server);
  }
}
