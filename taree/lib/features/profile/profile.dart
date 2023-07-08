import 'package:flutter/material.dart';
import 'package:taree/features/health/screens/health_card_screen.dart';
import 'package:taree/features/profile/widgets/scheduled.dart';
import 'package:taree/theme/pallete.dart';

import '../../responsive.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
          topLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
        ),
        color: Pallete.backgroundColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
                "Summer",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 2,
              ),
              InkWell(
                onTap: () {
                  print("hi");
                  Navigator.pushNamed(
                    context,
                    HealthCardScreen.routeName,
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      "Add Student",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Responsive.isMobile(context) ? 20 : 40,
              ),
              Scheduled()
            ],
          ),
        ),
      ),
    );
  }
}
