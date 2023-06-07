import 'package:flutter/material.dart';
import '../utils/color_schemes.g.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightColorScheme.primaryContainer,
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8, top: 10),
                child: Row(
                  children: [
                    BackButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Here\'s the situation that is',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'happening right now',
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
                height: 30,
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
                    padding: const EdgeInsets.only(top: 50, bottom: 25, left: 25, right: 25),
                    child: ListView(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color.fromRGBO(206, 255, 176, 100),
                          ),
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: 'At',
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' Departure',
                                                style: TextStyle(fontWeight: FontWeight.bold)
                                            ),
                                            TextSpan(
                                                text: ' Station:',
                                            )
                                          ]
                                        ),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        'Uncongested',
                                        style: (
                                            TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color.fromRGBO(255, 180, 171, 100),
                          ),
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                            text: 'At',
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: ' Destination',
                                                  style: TextStyle(fontWeight: FontWeight.bold)
                                              ),
                                              TextSpan(
                                                text: ' Station:',
                                              )
                                            ]
                                        ),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        'Congested',
                                        style: (
                                            TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
