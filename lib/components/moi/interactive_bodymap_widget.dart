import 'package:flutter/material.dart';

class BodyInteractionWidget extends StatefulWidget {
  @override
  _BodyInteractionWidgetState createState() => _BodyInteractionWidgetState();
}

class _BodyInteractionWidgetState extends State<BodyInteractionWidget> {
  List<Offset> crosses = [];
  String clickedBodyPart = "";

  // Updated method to detect the body part based on tapped coordinates
  String _detectBodyPart(Offset tapPosition, Size imageSize, BoxConstraints constraints) {
    // Calculate the relative position in terms of the image's dimensions
    double relativeY = tapPosition.dy / constraints.maxHeight;
    double relativeX = tapPosition.dx / constraints.maxWidth;

    // Adjust body part detection based on relative Y position
    if (relativeY < 0.12) return 'Head'; // Top of the image
    if (relativeY < 0.20) return 'Neck';
    if (relativeY < 0.40) return 'Chest';
    if (relativeY < 0.50) return 'Stomach';
    if (relativeY < 0.65 && relativeX < 0.4) return 'Left Arm';
    if (relativeY < 0.65 && relativeX > 0.6) return 'Right Arm';
    if (relativeY > 0.75 && relativeY < 0.85) return 'Knees'; // Midway
    if (relativeY > 0.85) return 'Feet'; // Bottom of the image
    return 'Unknown';
  }

  void _onTapDown(TapDownDetails details, BoxConstraints constraints) {
    setState(() {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final position = renderBox.globalToLocal(details.globalPosition);
      crosses.add(position);
      clickedBodyPart = _detectBodyPart(position, Size(constraints.maxWidth, constraints.maxHeight), constraints);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              GestureDetector(
                onTapDown: (details) => _onTapDown(details, constraints),
                child: Image.asset(
                  'assets/body_image.png', // Path to your body image
                  fit: BoxFit.contain,
                  width: constraints.maxWidth, // Make the image fit the full width
                  height: constraints.maxHeight, // Also set height to match
                ),
              ),
              ...crosses.map((cross) => Positioned(
                left: cross.dx - 10,
                top: cross.dy - 10,
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 20,
                ),
              )),
              if (clickedBodyPart.isNotEmpty)
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    'Last clicked: $clickedBodyPart',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
