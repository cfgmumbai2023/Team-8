import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/health/screens/health_card_screen.dart';
import '../../models/menu_modal.dart';
import '../../responsive.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Menu({super.key, required this.scaffoldKey});

  @override
  _MenuState createState() => _MenuState();
}

const List<String> list = <String>['A', 'B', 'C', 'D'];


class _MenuState extends State<Menu> {

String dropdownValue = list.first;


  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "Dashboard"),
    // MenuModel(icon: 'assets/svg/profile.svg', title: "Profile"),
    // MenuModel(icon: 'assets/svg/exercise.svg', title: "Exercise"),
    // MenuModel(icon: 'assets/svg/setting.svg', title: "Settings"),
    // MenuModel(icon: 'assets/svg/history.svg', title: "History"),
    // MenuModel(icon: 'assets/svg/signout.svg', title: "Signout"),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey[800]!,
              width: 1,
            ),
          ),
          color: const Color(0xFF171821)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/avatar.png",
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Sunita",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6.0),
                ),
                color: Color(0xFFA9DFD8).withOpacity(0.1),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HealthCardScreen.routeName,
                  );
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 7),
                      child: Icon(Icons.add),
                    ),
                    Text(
                      "Add Student",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6.0),
                ),
                color: Color(0xFFA9DFD8).withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                    child: Icon(Icons.class_),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            for (var i = 0; i < menu.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6.0),
                  ),
                  color: Color(0xFFA9DFD8).withOpacity(0.1),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selected = i;
                    });
                    widget.scaffoldKey.currentState!.closeDrawer();
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 7),
                        child: SvgPicture.asset(
                          menu[i].icon,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        menu[i].title,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: selected == i
                                ? FontWeight.w600
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
          ],
        )),
      ),
    );
  }
}
