import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class RiveLikeButton extends StatefulWidget {
  final bool isLike;
  final void Function(bool isLike) onTapLike;
  const RiveLikeButton(this.isLike, {super.key, required this.onTapLike});

  @override
  State<RiveLikeButton> createState() => _RiveLikeButtonState();
}

class _RiveLikeButtonState extends State<RiveLikeButton> {
  late StateMachineController controller;
  late SMIBool smiPressed;
  late SMIBool smiHover;

  @override
  void didUpdateWidget(covariant RiveLikeButton oldWidget) {
    if(oldWidget.isLike != widget.isLike){
      smiPressed.value = widget.isLike;
      smiHover.value = widget.isLike;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: (){
        widget.onTapLike(!widget.isLike);
      },
      child: RiveAnimation.asset("$baseRivePath/light_like2.riv",
        stateMachines: ['State Machine 1'],
        onInit: (Artboard art){
          controller = StateMachineController.fromArtboard(art, 'State Machine 1')!;
          controller.isActive = true;
          art.addController(controller);
          smiPressed = controller.findInput<bool>('Pressed') as SMIBool;
          smiHover = controller.findInput<bool>('Hover') as SMIBool;
      
        }, // 컨트롤러와 아트보드를 연결해줌
      ),
    );
  }
}
