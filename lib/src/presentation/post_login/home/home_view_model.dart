import 'dart:async';

import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  bool isMineStarted = false;

  /// State
  final Rx<DateTime> _start = DateTime.now().obs;

  DateTime get start => _start.value;

  late DateTime _end;

  DateTime get end => _end;
  final bool clampAtZero = true;

  final Rx<Duration> remaining = Duration.zero.obs;

  Timer? _timer;

  /// Set/replace the start time and (re)start the ticker.
  void setStart(DateTime startTime) {
    _start.value = startTime;
    _end = startTime.add(const Duration(hours: 24));
    _startTicker();
  }

  /// Stop the ticker (e.g., when leaving the screen manually).
  void stop() => _stopTicker();

  /// Strings (auto-updated via `remaining`)
  String get hhmmss => _fmtHHMMSS(remaining.value);

  String get hmsLetters => _fmtHmsLetters(remaining.value);

  @override
  void onInit() {
    super.onInit();

    print("HomeViewModel initialized");
  }

  void startMining() {
    isMineStarted = true;
    setStart(start);
    update();
    // Future.delayed(Duration(seconds: 5), () {
    //   isMineStarted = false;
    //   stop();
    //   update();
    // });
  }

  @override
  void onClose() {
    _stopTicker();
    super.onClose();
  }

  String _pad2(int n) => n.toString().padLeft(2, '0');

  void _startTicker() {
    _stopTicker(); // avoid duplicates
    _tick(); // immediate first update
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _stopTicker() {
    _timer?.cancel();
    _timer = null;
  }

  void _tick() {
    var diff = _end.difference(DateTime.now());

    if (clampAtZero && diff.isNegative) {
      diff = Duration.zero;
      remaining.value = diff;
      _stopTicker(); // auto-stop at 00:00:00
      return;
    }

    remaining.value = diff;
  }

  String _fmtHHMMSS(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    final s = d.inSeconds % 60;
    return "${_pad2(h)} ${_pad2(m)} ${_pad2(s)}";
  }

  String _fmtHmsLetters(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    final s = d.inSeconds % 60;
    return "${_pad2(h)}h ${_pad2(m)}m ${_pad2(s)}s";
  }
}
