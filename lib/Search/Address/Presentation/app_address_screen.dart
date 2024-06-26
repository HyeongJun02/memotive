import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memotive/Search/Address/depth/adress_depth_screen.dart';
import 'package:memotive/Search/Address/Step/adress_step_screen.dart';
import 'package:memotive/bottom_navigation_bar.dart';
import 'package:memotive/navigation_service.dart';

class AppAddressScreen extends StatelessWidget {
  const AppAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buttonForm(
              context: context, title: "STEP", widget: AddressStepScreen()),
          _buttonForm(
              context: context,
              title: "DEPTH",
              widget: const AddressDepthScreen()),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onItemTapped: (index) {
          NavigationService.navigateToScreen(context, index);
        },
      ),
    );
  }

  GestureDetector _buttonForm({
    required BuildContext context,
    required String title,
    required Widget widget,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.green),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }
}
