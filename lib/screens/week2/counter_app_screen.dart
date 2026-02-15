import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_flutter_journey/utils/app_colors.dart';

class CounterAppScreen extends StatefulWidget {
  const CounterAppScreen({super.key});

  @override
  _CounterAppScreenState createState() => _CounterAppScreenState();
}

class _CounterAppScreenState extends State<CounterAppScreen> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  Future<void> _loadCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _count = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _count);
  }

  void _increment() {
    setState(() => _count++);
    _saveCount();
  }

  void _decrement() {
    if (_count > 0) {
      setState(() => _count--);
      _saveCount();
    }
  }

  void _reset() {
    setState(() => _count = 0);
    _saveCount();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Counter App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.week2Gradient[0],
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double boxWidth = constraints.maxWidth * 0.85;
            double paddingV = height * 0.015;
            double titleSize = boxWidth * 0.08;
            double countSize = boxWidth * 0.18;

            return Container(
              width: boxWidth,
              padding: EdgeInsets.symmetric(
                horizontal: boxWidth * 0.04,
                vertical: paddingV,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Current Count',
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: paddingV),
                  FittedBox(
                    child: Text(
                      '$_count',
                      style: TextStyle(
                        fontSize: countSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: paddingV * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          onPressed: _decrement,
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100, 50),
                            backgroundColor: AppColors.danger,
                            padding: EdgeInsets.symmetric(
                              vertical: paddingV * 0.8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Icon(Icons.remove, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: _reset,
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100, 50),
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(
                              vertical: paddingV * 0.8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Icon(Icons.refresh, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: _increment,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.success,
                            fixedSize: Size(100, 50),
                            padding: EdgeInsets.symmetric(
                              vertical: paddingV * 0.8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
