import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Setup the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Durasi lebih panjang untuk efek yang lebih jelas
    )..repeat(); // Repeat the animation infinitely

    // Define the animation with a Tween after controller is created
    _animation = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            // Create shader with animated position for shimmer effect
            return _shimmerGradient.createShader(
              Rect.fromLTRB(
                _animation.value * bounds.width, // Move shimmer across the screen
                0.0,
                (1 + _animation.value) * bounds.width, // Adjust the shimmer to go fully across
                bounds.height,
              ),
            );
          },
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to free up resources
    super.dispose();
  }
}

// Gradien dengan kontras yang lebih tinggi agar lebih terlihat pada latar belakang putih
const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFB0B0B0), // Lebih gelap dari sebelumnya
    Color(0xFFF4F4F4),  // Bagian yang lebih terang untuk efek shimmer
    Color(0xFFB0B0B0),  // Kembali ke warna gelap
  ],
  stops: [
    0.1, // Starting point of the shimmer
    0.5, // The "shiny" part should be more prominent
    0.9, // Ending point of the shimmer
  ],
  begin: Alignment(-1.0, 0.0), // Start from the left
  end: Alignment(1.0, 0.0),   // End on the right
  tileMode: TileMode.clamp,    // Ensures the shimmer tiles correctly
);
