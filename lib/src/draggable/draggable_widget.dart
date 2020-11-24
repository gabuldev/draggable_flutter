import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Widget child;
  const DraggableWidget({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double posx = 0.0;
  double posy = 0.0;
  double decrement = 0;
  double scale = 1.0;
  var key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox render = key.currentContext.findRenderObject();
      decrement = render.size.height / 3;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: posy,
      left: posx,
      child: GestureDetector(
        onLongPressMoveUpdate: (details) {
          posx = details.globalPosition.dx - decrement;
          posy = details.globalPosition.dy - decrement;
          setState(() {});
        },
        onPanUpdate: (details) {
          posx = details.globalPosition.dx - decrement;
          posy = details.globalPosition.dy - decrement;
          setState(() {});
        },
        child: Transform.scale(
          scale: scale,
          child: Container(
            constraints: BoxConstraints(
                minHeight: 0.0,
                minWidth: 0.0,
                maxHeight: size.height,
                maxWidth: size.width),
            child: widget.child,
          ),
        ),
      ),
    );
    // return Positioned(
    //   top: posy,
    //   left: posx,
    //   child: Draggable<Color>(
    //     data: Colors.black,
    //     feedback: widget.child,
    //     child: widget.child,
    //     childWhenDragging: Container(
    //       width: 50,
    //       height: 50,
    //       color: Colors.green,
    //     ),
    //     onDragEnd: (details) {
    //       final y = size.height / details.offset.dy;
    //       print(y);
    //       posx = details.offset.dx;
    //       posy = details.offset.dy;
    //       setState(() {});
    //     },
    //   ),
    // );
  }
}
