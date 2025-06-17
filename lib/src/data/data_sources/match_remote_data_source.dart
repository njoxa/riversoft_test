import 'dart:math';
import 'package:faker/faker.dart';
import 'package:riversoft_test/src/data/models/match_model/match_model.dart';
import 'package:riversoft_test/src/data/models/sport_model/sport_model.dart';
import 'package:web_socket_client/web_socket_client.dart';

abstract interface class MatchRemoteDataSource {
  Future<List<MatchModel>> getMatches();

  Stream<OddsUpdate> get oddsUpdates;

  void dispose();
}

/// A mock implementation of [MatchRemoteDataSource].
///
/// real-time updates using the [MockWebSocketClient].
class MockMatchRemoteDataSource implements MatchRemoteDataSource {
  final _faker = Faker();
  final _random = Random();
  final _webSocketClient = MockWebSocketClient();

  List<MatchModel>? _cachedMatches;

  @override
  Future<List<MatchModel>> getMatches() async {
    if (_cachedMatches != null) {
      return _cachedMatches!;
    }

    // Using an async compute function would be ideal here for a real-world scenario
    // to avoid blocking the main isolate, but for this mock, we'll generate it directly.
    print("Generating 10,000 mock matches... This may take a moment.");

    final matches = List.generate(10000, (index) {
      final sportType = SportType.values[_random.nextInt(SportType.values.length)];
      return MatchModel(
        id: 'match_$index',
        sport: SportModel(name: sportType.name.toUpperCase(), type: sportType),
        competitor1: _faker.company.name().split(' ')[0],
        competitor2: _faker.company.name().split(' ')[0],
        score1: _random.nextInt(5),
        score2: _random.nextInt(5),
        startTime: DateTime.now().subtract(Duration(minutes: _random.nextInt(60))),
        odds: {
          '1': (_random.nextDouble() * 3) + 1.2,
          'X': (_random.nextDouble() * 2) + 2.5,
          '2': (_random.nextDouble() * 3) + 1.2,
        },
      );
    });

    print("Mock matches generated.");
    _cachedMatches = matches;

    _webSocketClient.connect(matchIds: matches.map((m) => m.id).toList());

    return matches;
  }

  @override
  Stream<OddsUpdate> get oddsUpdates => _webSocketClient.stream;

  @override
  void dispose() {
    _webSocketClient.disconnect();
  }
}
