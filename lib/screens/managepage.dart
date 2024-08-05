
import 'package:flutter/material.dart';
import 'package:todoapplication/screens/createpage.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/bwsmallbuttonwidget.dart';
import 'package:todoapplication/widgets/fwsmallbuttonwidget.dart';

class Manage extends StatelessWidget {
  const Manage({super.key});

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Bwsmall(
                name: 'SKIP',
                backpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Create(),
                    ),
                  );
                }, color: Colors.white,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 500,
                  child: Image.asset(
                    'asset/images/2bg.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    height: 5,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 5,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 5,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Center(
                child: Text(
                  'Manage your tasks',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 33),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'You can easily manage all of your daily',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Center(
                child: Text(
                  'tasks in DoMee for free',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Bwsmall(
                      name: 'BACK',
                      backpress: () {
                        Navigator.pop(context);
                      }, color: Colors.white,),
                  SmallButton(
                    name: 'NEXT',
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Create(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
