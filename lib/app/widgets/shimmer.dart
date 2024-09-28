import 'package:flutter/material.dart';

import '../common/values/app_colors.dart';

class ShimmerTransition extends StatelessWidget {
  final Widget shimmer;
  final Widget view;
  final bool isLoading;
  final Duration? duration;
  final Widget Function(
    Widget child,
    Animation<double> animation,
  )? transitionBuilder;

  ShimmerTransition({
    required this.shimmer,
    required this.view,
    required this.isLoading,
    this.duration,
    this.transitionBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? Duration(milliseconds: 500),
      child: isLoading ? shimmer : view,
      transitionBuilder: transitionBuilder ?? defaultTransitionBuilder,
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.ease,
    );
  }

  Widget defaultTransitionBuilder(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class DealsShimmeringLoadView extends StatelessWidget {
  const DealsShimmeringLoadView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
            ),
            // _buildText(38, 20, titleWidth: 130, subtitleWidth: 170),
            Row(
              children: [
                Expanded(child: _buildCard()),
                SizedBox(
                  width: 16,
                ),
                Expanded(child: _buildCard())
              ],
            ),
            // _buildText(20, 24,
            //     isTwoLine: false, titleWidth: 200, subtitleWidth: 220),
            // SizedBox(
            //   height: 36,
            // ),
            Row(
              children: [
                Expanded(child: _buildCard()),
                SizedBox(
                  width: 16,
                ),
                Expanded(child: _buildCard())
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(
    double titleHeight,
    double subtitleHeight, {
    bool isTwoLine = true,
    double? titleWidth,
    double? subtitleWidth,
    double? thirdLineWidth,
  }) {
    return ShimmerLoadingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: titleWidth ?? double.infinity,
            height: titleHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: subtitleWidth ?? 230,
            height: subtitleHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          if (!isTwoLine) ...[
            SizedBox(
              height: 12,
            ),
            Container(
              width: thirdLineWidth ?? 140,
              height: subtitleHeight,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildCard() {
    return ShimmerLoadingWidget(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildText(21, 17,
                    isTwoLine: false,
                    titleWidth: 100,
                    subtitleWidth: double.infinity,
                    thirdLineWidth: 250),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Container(
                //   width: 200.w,
                //   height: 22.h,
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(16.r),
                //   ),
                // ),
                // SizedBox(
                //   height: 8.h,
                // ),
                // Container(
                //   width: double.infinity,
                //   height: 12.h,
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(16.r),
                //   ),
                // ),
                // SizedBox(
                //   height: 8.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       width: 90.w,
                //       height: 12.h,
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(16.r),
                //       ),
                //     ),
                //     Container(
                //       width: 70.w,
                //       height: 12.h,
                //       decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(16.r),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShimmerLoadingWidget extends StatefulWidget {
  const ShimmerLoadingWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ShimmerLoadingWidget> createState() => _ShimmerLoadingWidgetState();
}

class _ShimmerLoadingWidgetState extends State<ShimmerLoadingWidget> {
  Listenable? _shimmerChanges;
  Offset? offsetWithinShimmer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final shimmer = ShimmerWidget.of(context)!;
      offsetWithinShimmer = shimmer.getDescendantOffset(
        descendant: context.findRenderObject() as RenderBox,
      );
      setState(() {});
      _shimmerChanges = ShimmerWidget.of(context)?.shimmerChanges;
      if (_shimmerChanges != null) {
        _shimmerChanges!.addListener(_onShimmerChange);
      }
    });
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    setState(() {
      // update the shimmer painting.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Collect ancestor shimmer information.
    final shimmer = ShimmerWidget.of(context)!;
    if (!shimmer.isSized || offsetWithinShimmer == null) {
      // The ancestor Shimmer widget isn’t laid
      // out yet. Return an empty box.
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer!.dx,
            -offsetWithinShimmer!.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class ShimmerWidget extends StatefulWidget {
  static ShimmerWidgetState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerWidgetState>();
  }

  const ShimmerWidget({
    super.key,
    this.linearGradient = shimmerGradient,
    this.child,
  });

  final LinearGradient linearGradient;
  final Widget? child;

  @override
  ShimmerWidgetState createState() => ShimmerWidgetState();
}

class ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform:
            SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

const shimmerGradient = LinearGradient(
  colors: [
    AppColors.white,
    AppColors.white,
    AppColors.white50,
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class SlidingGradientTransform extends GradientTransform {
  const SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
