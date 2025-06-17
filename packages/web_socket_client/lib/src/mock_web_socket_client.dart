import 'dart:async';
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:web_socket_client/web_socket_client.dart';

/// A mock client that simulates a WebSocket connection.
///
/// It generates a stream of random odds changes for a predefined list of matches
/// at a regular interval.
class MockWebSocketClient {
  final Random _random = Random();
  final Faker _faker = Faker();
  late final StreamController<OddsUpdate> _controller;
  Timer? _timer;

  Stream<OddsUpdate> get stream => _controller.stream;

  /// Starts the mock WebSocket connection.
  ///
  /// [matchIds] is the list of all match IDs to generate updates for.
  /// [updateInterval] is the duration between each random update.
  void connect({required List<String> matchIds, Duration updateInterval = const Duration(milliseconds: 500)}) {
    _controller = StreamController<OddsUpdate>();
    _timer = Timer.periodic(updateInterval, (_) {
      if (matchIds.isEmpty) return;

      final randomMatchId = matchIds[_random.nextInt(matchIds.length)];

      final newOdds = {
        '1': (_random.nextDouble() * 3) + 1.2,
        'X': (_random.nextDouble() * 2) + 2.5,
        '2': (_random.nextDouble() * 3) + 1.2,
      };

      _controller.add(OddsUpdate(matchId: randomMatchId, newOdds: newOdds));
    });
  }

  void disconnect() {
    _timer?.cancel();
    _controller.close();
  }
}
