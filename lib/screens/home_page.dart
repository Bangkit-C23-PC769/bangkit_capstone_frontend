import 'package:flutter/material.dart';
import '../utils/color_schemes.g.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../utils/station_list.dart';
import 'dummy_loading/dummy_loading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TimeOfDay _userTime = TimeOfDay.now();

  List<String> stations = stationList;

  void _showTimePicker() {
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    ).then((value) {
      setState(() {
        _userTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColorScheme.primaryContainer,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10, left: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, John!',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Where are you going today?',
                            style: Theme.of(context).textTheme.titleLarge,
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 10, left: 25, right: 25),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'At what time?',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                _userTime.format(context).toString(),
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilledButton.tonal(
                                onPressed: _showTimePicker,
                                child: const Text('Pick a Time')
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupPropsMultiSelection.bottomSheet(
                            showSearchBox: true,
                            showSelectedItems: true,
                            searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                    hintText: "Choose your departure station"
                                ),
                                padding: EdgeInsets.all(15),
                            ),
                          ),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? items) {
                            if (items == null || items.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          clearButtonProps: const ClearButtonProps(isVisible: true),
                          items: stations,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Departure Station",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          onChanged: print,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Row(
                            children: [
                              Text(
                                'Choose your departure station',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupPropsMultiSelection.bottomSheet(
                            showSearchBox: true,
                            showSelectedItems: true,
                            searchFieldProps: TextFieldProps(
                                decoration: InputDecoration(
                                    hintText: "Choose your destination station"
                                ),
                                padding: EdgeInsets.all(15),
                            ),
                          ),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? items) {
                            if (items == null || items.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          clearButtonProps: const ClearButtonProps(isVisible: true),
                          items: stations,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Destination Station",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          onChanged: print,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Row(
                            children: [
                              Text(
                                'Choose your destination station',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilledButton.tonal(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return const DummyLoadingPage();
                                      })
                                  );
                                },
                                child: const Text('GO', style: TextStyle(fontWeight: FontWeight.bold),)
                            ),
                          ],
                        ),
                      ],
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
