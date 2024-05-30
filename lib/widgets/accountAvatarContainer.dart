import 'package:flutter/material.dart';
class accountAvatarContainer extends StatefulWidget {
  final String accountImage;
  const accountAvatarContainer({
    super.key,
    required this.accountImage
  });

  @override
  State<accountAvatarContainer> createState() => _accountAvatarContainerState();
}

class _accountAvatarContainerState extends State<accountAvatarContainer> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _avatarRadiusAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 600 ))..forward();
    _avatarRadiusAnimation = Tween(begin: 0.0,end: 120.0).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    _controller.addListener(() {
      setState(() {

      });
    });
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.stop();
      }else if(status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(4.0, 4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0
            ),
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(4.0, 4.0),
                blurRadius: 10.0,
                spreadRadius: 1.0
            )
          ],
       ),
        child: CircleAvatar(
          radius: _avatarRadiusAnimation.value,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            widget.accountImage,
          ),
        ),
      ),
    );
  }
}
