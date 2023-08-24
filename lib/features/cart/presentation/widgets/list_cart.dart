import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';
import 'package:handyman/features/job/presentation/widgets/single_job.dart';

class ListAllCart extends StatefulWidget {
  final int? items;
  const ListAllCart({Key? key, this.items}) : super(key: key);

  @override
  _ListAllCartState createState() => _ListAllCartState();
}

class _ListAllCartState extends State<ListAllCart> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 0), () async {
    //   final homeBloc = BlocProvider.of<AllJobBloc>(context);
    //   homeBloc.add(
    //     const TransactionEvent.onGetAllTransactionList(),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return BlocBuilder<AllJobBloc, AllJobState>(
      builder: (context, state) {
        // final List<JobModel> dataList = state.transactions;
        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: index != 0 ? 12.0 : 0),
              child: const Row(
                children: <Widget>[
                  // SizedBox(
                  //     height: 100, width: width - 32, child: const SingleJob())
                ],
              ),
            );
          },
        );
        return const CircularProgressIndicator();
      },
    );
  }
}
