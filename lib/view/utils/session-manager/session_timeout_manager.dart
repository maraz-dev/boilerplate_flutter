import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate_flutter/view/utils/session-manager/session_config.dart';

enum SessionState { startListening, stopListening }

class SessionTimeoutManager extends StatefulWidget {
  final SessionConfig _sessionConfig;
  final Widget child;
  final Stream<SessionState>? _sessionStateStream;

  final Duration userActivityDebounceDuration;
  const SessionTimeoutManager(
      {super.key,
      required sessionConfig,
      required this.child,
      sessionStateStream,
      this.userActivityDebounceDuration = const Duration(seconds: 2)})
      : _sessionConfig = sessionConfig,
        _sessionStateStream = sessionStateStream;

  @override
  State<SessionTimeoutManager> createState() => _SessionTimeoutManagerState();
}

class _SessionTimeoutManagerState extends State<SessionTimeoutManager> with WidgetsBindingObserver {
  Timer? _appLostFocusTimer;
  Timer? _userInactivityTimer;
  bool _isListensing = false;

  bool _userTapActivityRecordEnabled = true;

  void _closeAllTimers() {
    if (_isListensing == false) {
      return;
    }

    if (_appLostFocusTimer != null) {
      _clearTimeout(_appLostFocusTimer!);
    }

    if (_userInactivityTimer != null) {
      _clearTimeout(_userInactivityTimer!);
    }

    setState(() {
      _isListensing = false;
      _userTapActivityRecordEnabled = true;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // if there is no stream to handle enabling and disabling of SessionTimeoutManager,
    // we always listen
    if (widget._sessionStateStream == null) {
      _isListensing = true;
    }

    widget._sessionStateStream?.listen((SessionState sessionState) {
      if (sessionState == SessionState.startListening) {
        setState(() {
          _isListensing = true;
        });

        recordPointerEvent();
      } else if (sessionState == SessionState.stopListening) {
        _closeAllTimers();
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (_isListensing == true &&
        (state == AppLifecycleState.inactive || state == AppLifecycleState.paused)) {
      if (widget._sessionConfig.invalidateSessionForAppLostFocus != null) {
        _appLostFocusTimer ??= _setTimeout(
          () => widget._sessionConfig.pushAppFocusTimeout(),
          duration: widget._sessionConfig.invalidateSessionForAppLostFocus!,
        );
      }
    } else if (state == AppLifecycleState.resumed) {
      if (_appLostFocusTimer != null) {
        _clearTimeout(_appLostFocusTimer!);
        _appLostFocusTimer = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Attach Listener only if user wants to invalidate session on user inactivity
    if (_isListensing && widget._sessionConfig.invalidateSessionForUserInactivity != null) {
      return Listener(
        onPointerDown: (_) {
          recordPointerEvent();
        },
        child: widget.child,
      );
    }

    return widget.child;
  }

  void recordPointerEvent() {
    if (_userTapActivityRecordEnabled) {
      if (kDebugMode) {
        print("User Tapped Enabled");
      }

      _userInactivityTimer?.cancel();
      _userInactivityTimer = _setTimeout(
        () => widget._sessionConfig.pushUserInactivityTimeout(),
        duration: widget._sessionConfig.invalidateSessionForUserInactivity!,
      );

      /// lock the button for next [userActivityDebounceDuration] duration
      setState(() {
        _userTapActivityRecordEnabled = false;
      });

      // Enable it after [userActivityDebounceDuration] duration

      Timer(
        widget.userActivityDebounceDuration,
        () => setState(() => _userTapActivityRecordEnabled = true),
      );
    }
  }

  Timer _setTimeout(callback, {required Duration duration}) {
    return Timer(duration, callback);
  }

  void _clearTimeout(Timer t) {
    t.cancel();
  }
}
