import 'package:flutter/material.dart';
import '../utils/color_schemes.g.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {

  late TransformationController _transformationController;
  TapDownDetails? _tapDownDetails;

  @override
  void initState() {
    super.initState();

    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightColorScheme.primaryContainer,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 10, left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'KRL Jabodetabek Route Map',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: GestureDetector(
                      onDoubleTapDown: (details) => _tapDownDetails = details,
                      onDoubleTap: () {
                        final position = _tapDownDetails!.localPosition;
                        const double scale = 3;
                        final x = -position.dx * (scale - 1);
                        final y = -position.dy * (scale - 1);
                        final zoomed = Matrix4.identity()
                          ..translate(x, y)
                          ..scale(scale);

                        final value = _transformationController.value.isIdentity() ? zoomed : Matrix4.identity();
                        _transformationController.value = value;
                      },
                      child: InteractiveViewer(
                          transformationController: _transformationController,
                          child: Image.asset('assets/krl_routes.png')
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
