import 'package:flutter/material.dart';
import 'package:parallex_dummy/constants.dart';
import 'package:parallex_dummy/Presentation/screen/bill_payment.dart';
import 'package:parallex_dummy/Presentation/widgets/reusable_tabs.dart';

class BillsPayment extends StatefulWidget {
  const BillsPayment({super.key});

  @override
  State<BillsPayment> createState() => _BillsPaymentState();
}

class _BillsPaymentState extends State<BillsPayment>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int tabIndex = 0;

  @override
  void initState() {
    controller = TabController(length: 4, initialIndex: 0, vsync: this);
    controller.addListener(() {
      setState(() {
        tabIndex = controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBGColor,
          title: const Text(
            'Bills Payment',
            style: TextStyle(color: kHeaderColor, fontWeight: FontWeight.bold,),
          ),
        ),
        backgroundColor: kBGColor,
        body: Column(
          children: [
            Container(
              height: 65,
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Creates border
                    color: kActiveTabColor,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                  isScrollable: true,
                  padding:
                      const EdgeInsets.only(bottom: 10, top: 10,),
                  controller: controller,
                  indicatorColor: Colors.transparent,
                  tabs: [
                    ReusableTabs(
                      text: 'Airtime',
                      color:
                          tabIndex == 0 ? kActiveTabColor : kInactiveTabColor,
                    ),
                    ReusableTabs(
                      text: 'Data',
                      color:
                          tabIndex == 1 ? kActiveTabColor : kInactiveTabColor,
                    ),
                    ReusableTabs(
                      text: 'Tv Subscriptions',
                      color:
                          tabIndex == 2 ? kActiveTabColor : kInactiveTabColor,
                    ),
                    ReusableTabs(
                      text: 'Electricity',
                      color:
                          tabIndex == 3 ? kActiveTabColor : kInactiveTabColor,
                    ),
                  ]),
            ),
            Expanded(
              child: SizedBox(
                height: 40,
                child: TabBarView(controller: controller, children: [
                  BillPayPage(
                    icon: const ImageIcon(
                      AssetImage('images/mobile.png'),
                      color: kActiveTabColor,
                    ),
                  ),
                  BillPayPage(
                    icon: const ImageIcon(
                      AssetImage('images/mobile.png'),
                      color: kActiveTabColor,
                    ),
                  ),
                  BillPayPage(
                    icon: const ImageIcon(
                      AssetImage('images/solar_tv-outline.png'),
                      color: kActiveTabColor,
                    ),
                  ),
                  BillPayPage(
                    icon: const ImageIcon(
                      AssetImage('images/tabler_bulb.png'),
                      color: kActiveTabColor,
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
