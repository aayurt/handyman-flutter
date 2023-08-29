import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/loading_button.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/order/presentation/widgets/order_job_update_form_widget.dart';
import 'package:handyman/routes/routes_constant.dart';

class WebhookPaymentScreen extends StatefulWidget {
  final double totalPrice;
  final String note;
  final String applicationId;
  final Function(PaymentPage newPage) setCurrentPage;

  const WebhookPaymentScreen(
      {super.key,
      required this.totalPrice,
      required this.note,
      required this.applicationId,
      required this.setCurrentPage});

  @override
  _WebhookPaymentScreenState createState() => _WebhookPaymentScreenState();
}

class _WebhookPaymentScreenState extends State<WebhookPaymentScreen> {
  CardFieldInputDetails? _card;
  String _email = 'aayurtshrestha@stripe.com';
  bool? _saveCard = false;
  String token = "";
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      await SharedPrefService.getToken(SharedPrefKey.token).then((temptoken) {
        if (temptoken.isNotEmpty) {
          setState(() {
            token = temptoken;
          });
        } else {}
      });
    });
    super.initState();
  }

  Future<Map<String, dynamic>> updateOrderStatus(String applicationId) async {
    try {
      final ApiService request = ApiService();
      final response = await request.put(
        ApiEndpoint(AppConstants.baseUrl,
            "${ApiList.application}/${widget.applicationId}", {}),
        data: ({"paymentMethod": "stripe", "amount": widget.totalPrice}),
      );
      return response.data;
    } on Exception {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> handlePayPress() async {
      if (_card == null) {
        return;
      }
      final clientSecret = await fetchPaymentIntentClientSecret();
      final billingDetails = BillingDetails(
        email: _email,
        phone: '+48888000888',
        address: const Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      );
      // Stripe.publishableKey = clientSecret["publishableKey"];
      final paymentIntent = await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret["paymentIntent"],
        data: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: billingDetails,
          ),
        ),
        options: PaymentMethodOptions(
          setupFutureUsage:
              _saveCard == true ? PaymentIntentsFutureUsage.OffSession : null,
        ),
      );

      if (paymentIntent.id.isNotEmpty) {
        updateOrderStatus(paymentIntent.id).then((value) {
          if (value["data"] != null &&
              (value["data"]["paymentStatus"] == "unpaid" ||
                  value["data"]["paymentStatus"] == "paid")) {
            widget.setCurrentPage(PaymentPage.success);

            // Navigator.pop(widget.dialogContext);
          } else {
            widget.setCurrentPage(PaymentPage.error);
          }
        });
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: StatefulBuilder(
              builder: (BuildContext scontext, StateSetter setState) {
            return Column(
              children: [
                TextFormField(
                  initialValue: _email,
                  decoration: const InputDecoration(
                      hintText: 'Email', labelText: 'Email'),
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CardField(
                  enablePostalCode: true,
                  countryCode: 'US',
                  postalCodeHintText: 'Enter the us postal code',
                  onCardChanged: (card) {
                    setState(() {
                      _card = card;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CheckboxListTile(
                  value: _saveCard,
                  onChanged: (value) {
                    setState(() {
                      _saveCard = value;
                    });
                  },
                  title: const Text('Save card during payment'),
                ),
                token.isNotEmpty
                    ? LoadingButton(
                        onPressed:
                            _card?.complete == true ? handlePayPress : null,
                        text: 'Pay',
                      )
                    : ElevatedButton(
                        onPressed: () {
                          context.go(RoutesConstant.login);
                        },
                        child: const Text("Go to Login")),
              ],
            );
          }),
        ),
      ],
    );
  }

  fetchPaymentIntentClientSecret() async {
    final url = (AppConstants.baseUrl);
    try {
      final ApiService request = ApiService();
      final response = await request.post(
        ApiEndpoint(url, "/auth/payment-sheet", {}),
        data: {"price": widget.totalPrice},
      );

      return response.data;
    } catch (e) {
      return {};
    }
  }
}
