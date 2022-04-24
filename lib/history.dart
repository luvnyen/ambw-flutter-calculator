import 'package:flutter/material.dart';
import 'package:c14190033_calculator/main.dart';

class History extends StatefulWidget {
  final Map<String, String> history;

  const History({Key? key, required this.history}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    darkMode ? darkMode = false : darkMode = true;
                  });
                },
                child: _switchMode(),
              ),
              const SizedBox(height: 20),
              Text(
                'History',
                style: TextStyle(
                  fontSize: 30,
                  color: darkMode ? colorLight : colorDark,
                ),
              ),
              Expanded(
                child: widget.history.isEmpty
                    ? const Center(
                        child: Text(
                          'No history',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.history.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              widget.history.keys.elementAt(index),
                              style: TextStyle(
                                fontSize: 20,
                                color: darkMode ? colorLight : colorDark,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            subtitle: Text(
                              '=${widget.history.values.elementAt(index)}',
                              style: TextStyle(
                                fontSize: 25,
                                color: darkMode
                                    ? Colors.greenAccent
                                    : Colors.redAccent,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 20),
              widget.history.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.history.clear();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.delete_forever,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Clear History',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: darkMode ? colorLight : colorDark,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 20,
                        color: darkMode ? colorDark : colorLight,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NewContainer(
      darkMode: darkMode,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
