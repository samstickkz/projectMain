import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/base.vm.dart';

class DrawEntryPointViewModel extends BaseViewModel{

  late AnimationController controller;
  late Animation<double> animation;

  ConfettiController confettiController = ConfettiController();

  void startConfetti() {
    confettiController.play();
  }

}