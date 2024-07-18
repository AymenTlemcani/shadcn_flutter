import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../carousel_example.dart';

class CarouselExample2 extends StatefulWidget {
  const CarouselExample2({super.key});

  @override
  State<CarouselExample2> createState() => _CarouselExample2State();
}

class _CarouselExample2State extends State<CarouselExample2> {
  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlineButton(
              shape: ButtonShape.circle,
              onPressed: () {
                controller.animatePrevious(const Duration(milliseconds: 500));
              },
              child: const Icon(Icons.arrow_upward)),
          gap(24),
          Expanded(
            child: SizedBox(
              width: 200,
              child: Carousel(
                gap: 24,
                snapAlignment: CarouselAlignment.center,
                controller: controller,
                direction: Axis.vertical,
                sizeFactor: 0.8,
                autoplayDuration: const Duration(seconds: 2),
                itemBuilder: (context, index) {
                  return NumberedContainer(index: index);
                },
                duration: const Duration(seconds: 2),
              ),
            ),
          ),
          gap(24),
          OutlineButton(
              shape: ButtonShape.circle,
              onPressed: () {
                controller.animateNext(const Duration(milliseconds: 500));
              },
              child: const Icon(Icons.arrow_downward)),
        ],
      ),
    );
  }
}
