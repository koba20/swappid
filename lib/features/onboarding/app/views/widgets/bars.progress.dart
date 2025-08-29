import 'package:flutter/material.dart';

class StoryProgressController {
  StoryProgressBarState? _state;

  void _attach(StoryProgressBarState state) {
    _state = state;
  }

  void _detach() {
    _state = null;
  }

  void start() => _state?.start();
  void pause() => _state?.pause();
  void resume() => _state?.resume();
  void next() => _state?.next();
  void previous() => _state?.previous();
  void reset() => _state?.reset();
  void jumpToIndex(int index) => _state?.jumpToIndex(index);
}

class StoryProgressBar extends StatefulWidget {
  final int length;
  final Duration duration;
  final Function(int) onIndexChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final double height;
  final double spacing;
  final bool autoStart;
  final bool repeat;
  final StoryProgressController? controller;

  const StoryProgressBar({
    Key? key,
    required this.length,
    required this.duration,
    required this.onIndexChanged,
    this.activeColor,
    this.inactiveColor,
    this.height = 3.0,
    this.spacing = 4.0,
    this.autoStart = true,
    this.repeat = false,
    this.controller,
  }) : super(key: key);

  @override
  State<StoryProgressBar> createState() => StoryProgressBarState();
}

class StoryProgressBarState extends State<StoryProgressBar>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller?._attach(this);
    _initializeControllers();
    if (widget.autoStart) {
      start();
    }
  }

  void _initializeControllers() {
    _controllers = List.generate(
      widget.length,
      (index) => AnimationController(
        duration: widget.duration,
        vsync: this,
      ),
    );

    _animations = _controllers
        .map((controller) => Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: controller, curve: Curves.linear),
            ))
        .toList();
  }

  void _setupControllerListener() {
    // Clear any existing listeners to prevent duplicates
    _controllers[_currentIndex].clearStatusListeners();
    
    _controllers[_currentIndex].addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _moveToNext();
      }
    });
  }

  void _moveToNext() {
    if (_currentIndex < widget.length - 1) {
      setState(() {
        _currentIndex++;
      });
      widget.onIndexChanged(_currentIndex);
      _setupControllerListener();
      _controllers[_currentIndex].forward();
    } else {
      // All stories completed
      if (widget.repeat) {
        // Reset and restart the cycle
        _restartCycle();
      } else {
        // Just notify completion without restarting
        widget.onIndexChanged(_currentIndex);
      }
    }
  }

  void _restartCycle() {
    // Reset all controllers
    for (var controller in _controllers) {
      controller.reset();
    }
    
    // Reset current index
    setState(() {
      _currentIndex = 0;
    });
    
    // Notify about the restart
    widget.onIndexChanged(_currentIndex);
    
    // Setup listener and start first animation
    _setupControllerListener();
    _controllers[_currentIndex].forward();
  }

  // Public methods to control the progress bar
  void start() {
    if (_currentIndex < _controllers.length) {
      _setupControllerListener();
      _controllers[_currentIndex].forward();
    }
  }

  void pause() {
    if (_currentIndex < _controllers.length) {
      _controllers[_currentIndex].stop();
    }
  }

  void resume() {
    if (_currentIndex < _controllers.length) {
      _controllers[_currentIndex].forward();
    }
  }

  void next() {
    if (_currentIndex < _controllers.length) {
      _controllers[_currentIndex].stop();
      _controllers[_currentIndex].value = 1.0;
      _moveToNext();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _controllers[_currentIndex].stop();
      _controllers[_currentIndex].reset();

      setState(() {
        _currentIndex--;
      });

      widget.onIndexChanged(_currentIndex);
      _setupControllerListener();
      _controllers[_currentIndex].forward();
    }
  }

  void reset() {
    // Stop current animation
    if (_currentIndex < _controllers.length) {
      _controllers[_currentIndex].stop();
    }
    
    // Reset all controllers
    for (var controller in _controllers) {
      controller.reset();
    }
    
    setState(() {
      _currentIndex = 0;
    });
    
    widget.onIndexChanged(_currentIndex);
  }

  void jumpToIndex(int index) {
    if (index >= 0 && index < widget.length) {
      // Stop current animation
      if (_currentIndex < _controllers.length) {
        _controllers[_currentIndex].stop();
      }

      // Fill all previous bars
      for (int i = 0; i < index; i++) {
        _controllers[i].value = 1.0;
      }

      // Reset current and future bars
      for (int i = index; i < widget.length; i++) {
        _controllers[i].reset();
      }

      setState(() {
        _currentIndex = index;
      });

      widget.onIndexChanged(_currentIndex);
      _setupControllerListener();
      _controllers[_currentIndex].forward();
    }
  }

  @override
  void dispose() {
    widget.controller?._detach();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.length, (index) {
        return Expanded(
          child: AnimatedBuilder(
            animation: _animations[index],
            builder: (context, child) {
              return Container(
                margin: EdgeInsets.only(
                  right: index < widget.length - 1 ? widget.spacing : 0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value:
                        index < _currentIndex ? 1.0 : _animations[index].value,
                    backgroundColor:
                        widget.inactiveColor ?? Colors.grey.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.activeColor ?? Colors.white,
                    ),
                    minHeight: widget.height,
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}