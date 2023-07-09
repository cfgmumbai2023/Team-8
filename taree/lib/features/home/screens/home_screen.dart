import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taree/features/home/widgets/line_chart_card2.dart';
import '../../../core/common/custom_card.dart';
import '../../../responsive.dart';
import '../widgets/header_widget.dart';
import '../widgets/line_chart_3.dart';
import '../widgets/line_chart_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/home-screen';
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeScreen({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

final pageProvider = StateProvider<int>((ref) => 0);

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // void onPageChanged(int page) {
  //   ref.read(pageProvider.notifier).update((state) => page);
  // }
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // int page = ref.watch(pageProvider);
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            children: [
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              Header(scaffoldKey: widget.scaffoldKey),
              _height(context),
              // const ActivityDetailsCard(),
              // _height(context),
              LineChartCard2(),
              _height(context),
              LineChartCard(),
              _height(context),
              LineChartCard3(),
              _height(context),
              // LineChartCard(),
              // _height(context),
              // BarGraphCard(),
              DescriptionCard(context),
              _height(context),
            ],
          ),
        ),
      ),
    );
  }

  CustomCard DescriptionCard(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Teacher Notes",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: Responsive.isMobile(context) ? 9 / 4 : 16 / 6,
            child: TextField(
              controller: textController,
            ),
          ),
        ],
      ),
    );
  }
}
