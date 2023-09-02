import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:handyman/features/profile/presentation/pages/profile_form_update.dart'
    if (dart.library.js) 'package:handyman/features/profile/presentation/pages/profile_form_update_web.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userType = "";

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context.read<ProfileBloc>().add(const ProfileEvent.get());
        var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
        if (usertype.isNotEmpty) {
          setState(() {
            userType = usertype;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 30,
                      ),
                      Expanded(
                        child: Text(
                          "$userType Update",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  Positioned(
                    left: 20,
                    child: TextButton(
                      onPressed: () async {
                        await SharedPrefService.storeToken(
                            SharedPrefKey.token, "");
                        await SharedPrefService.storeToken(
                            SharedPrefKey.userType, "");
                        context.go(RoutesConstant.login);
                      },
                      child: const Text("Logout"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const TabBar(
                tabs: [
                  Tab(text: 'Profile'),
                  Tab(text: 'Graphs'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocConsumer<ProfileBloc, ProfileState>(
                      listener: (context, state) {
                        if (state is ProfileStateError) {
                          context.go(RoutesConstant.login);
                        }
                      },
                      builder: (context, state) {
                        if (state is ProfileStateLoaded) {
                          var userModelData = state.user;
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, left: 16, right: 16),
                            child:
                                ProfileFormUpdate(userModelData: userModelData),
                          );
                        } else if (state is ProfileStateLoading) {
                          return const Center(
                              child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator()));
                        } else {
                          return const Text("Error");
                        }
                      },
                    ),
                    GraphContent()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class GraphContent extends StatelessWidget {
  GraphContent({Key? key}) : super(key: key);
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Initialize the chart widget
      SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(text: 'Half yearly sales analysis'),
          // Enable legend
          legend: const Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true))
          ]),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          //Initialize the spark charts widget
          child: SfSparkLineChart.custom(
            //Enable the trackball
            trackball: const SparkChartTrackball(
                activationMode: SparkChartActivationMode.tap),
            //Enable marker
            marker: const SparkChartMarker(
                displayMode: SparkChartMarkerDisplayMode.all),
            //Enable data label
            labelDisplayMode: SparkChartLabelDisplayMode.all,
            xValueMapper: (int index) => data[index].year,
            yValueMapper: (int index) => data[index].sales,
            dataCount: 5,
          ),
        ),
      )
    ]);
  }
}
