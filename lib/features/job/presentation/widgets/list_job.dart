// import 'package:abc_banking_app/features/transaction/data/models/transaction_response_model.dart';
// import 'package:abc_banking_app/features/transaction/presentation/bloc/transaction_bloc.dart';
// import 'package:abc_banking_app/features/transaction/presentation/widgets/single_transcation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:handyman/features/job/presentation/widgets/single_job.dart';

// import '../bloc/transaction_event.dart';
// import '../bloc/transaction_state.dart';

// class ListJob extends StatefulWidget {
//   final int? items;
//   const ListJob({Key? key, this.items}) : super(key: key);

//   @override
//   _ListJobState createState() => _ListJobState();
// }

// class _ListJobState extends State<ListJob> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 0), () async {
//       final tranBloc = BlocProvider.of<TransactionBloc>(context);
//       tranBloc.add(
//         const TransactionEvent.onGetMyTransactionList(),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     return BlocBuilder<TransactionBloc, TransactionState>(
//       builder: (context, state) {
//         if (state is TransactionLoadedState) {
//           final List<TransactionResponseModel> dataList = state.transactions;
//           return SizedBox(
//             height: size.height,
//             child: ListView.builder(
//               physics: const ClampingScrollPhysics(),
//               itemCount: widget.items ?? dataList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 // final TransactionResponseModel transaction = dataList[index];
//                 return Padding(
//                   padding: EdgeInsets.only(top: index != 0 ? 12.0 : 0),
//                   child: Row(
//                     children: <Widget>[
//                       SizedBox(
//                           height: 100,
//                           width: width - 32,
//                           child: const SingleJob())
//                     ],
//                   ),
//                 );
//               },
//             ),
//           );
//         }
//         return const Center(
//             child: SizedBox(
//                 height: 100, width: 100, child: CircularProgressIndicator()));
//       },
//     );
//   }
// }
