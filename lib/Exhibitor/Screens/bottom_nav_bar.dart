import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medicall_exhibitor/Constants/app_color.dart';
import 'package:medicall_exhibitor/Constants/styles.dart';
import 'package:medicall_exhibitor/Exhibitor/Screens/Event%20Overview/event_overview.dart';
import 'Appointments/my_appointments.dart';
import 'Dashboard/dashboard.dart';

class BottomNavBar extends StatefulWidget {
  int? currentPage;
  BottomNavBar({super.key, this.currentPage});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int currentIndex;
  List screens = [
    Appointment(),
    EventOverview(),
    Dashboard(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentPage ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 1;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: currentIndex == 1 ? AppColor.primary : AppColor.white,
        child: Lottie.asset('assets/lottie/dashboard.json'),
        // const Icon(
        //   Icons.grid_view_outlined,
        //   color: Colors.white,
        //   size: 30,
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Icon(
                    Icons.app_registration_outlined,
                    size: 25,
                    color: currentIndex == 0
                        ? AppColor.primary
                        : Colors.grey.shade400,
                  ),
                ),
                Container(
                  height: 10,
                  child: FittedBox(
                      child: Text(
                        'Appointments',
                        style: currentIndex == 0
                            ? AppTextStyles.buttomMenu
                            : AppTextStyles.menu,
                      )
                  ),
                ),

              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: Icon(
                    Icons.event,
                    size: 25,
                    color: currentIndex == 2
                        ? AppColor.primary
                        : Colors.grey.shade400,
                  ),
                ),
                Container(
                  height: 10,
                  child: FittedBox(
                      child:Text(
                        'Dashboard',
                        style: currentIndex == 2
                            ? AppTextStyles.buttomMenu
                            : AppTextStyles.menu,
                      )
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
