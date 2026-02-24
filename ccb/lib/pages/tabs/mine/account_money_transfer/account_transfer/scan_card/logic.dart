import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'state.dart';

class ScanCardLogic extends GetxController with GetTickerProviderStateMixin {
  final ScanCardState state = ScanCardState();
  late List<CameraDescription> _cameras;
  late CameraController controller;
  
  // 扫描线动画控制器 - 使用可空类型
  AnimationController? _scanAnimationController;
  Animation<double>? _scanAnimation;
  Timer? _scanTimer;
  
  // 添加状态标记
  bool _isAnimationInitialized = false;
  
  // 添加getter确保安全访问
  AnimationController? get scanAnimationController => _scanAnimationController;
  Animation<double>? get scanAnimation => _scanAnimation;
  bool get isAnimationReady => _isAnimationInitialized && _scanAnimation != null;

  @override
  void onInit() {
    super.onInit();
    _initAnimation();
    _initCamera();
  }
  
  @override
  void onReady() {
    super.onReady();
    if (!_isAnimationInitialized) {
      _initAnimation();
    }
  }
  
  void _initAnimation() {
    if (_isAnimationInitialized) return;
    
    try {
      _scanAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      );
      
      _scanAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _scanAnimationController!,
        curve: Curves.linear,
      ));
      
      // 启动循环动画
      _startScanLoop();
      _isAnimationInitialized = true;
      update();
    } catch (e) {
      print('动画初始化失败: $e');
    }
  }
  
  void _startScanLoop() {
    // 开始第一次动画
    _scanAnimationController!.forward();
    
    // 设置定时器，每1.8秒重复一次（1.5秒动画 + 0.3秒间隔）
    _scanTimer = Timer.periodic(Duration(milliseconds: 1600), (timer) {
      if (_scanAnimationController != null) {
        _scanAnimationController!.reset();
        _scanAnimationController!.forward();
      }
    });
  }
  
  void _initCamera() async {
    _cameras = await availableCameras();

    CameraDescription? backCamera;
    for (CameraDescription camera in _cameras) {
      if (camera.lensDirection == CameraLensDirection.back) {
        backCamera = camera;
        break;
      }
    }
    
    final selectedCamera = backCamera ?? _cameras[0];
    
    controller = CameraController(selectedCamera, ResolutionPreset.max);
    controller.initialize().then((_) {
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _scanTimer?.cancel();
    _scanAnimationController?.dispose();
    controller.dispose();
    super.dispose();
  }
}
