import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nav2/model/plans_and_packages_model.dart';
import 'package:nav2/utils/constants.dart';
import 'package:nav2/utils/custom_snackbar.dart';
import 'package:nav2/utils/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/payment_controller.dart';

class PlansAndPackages extends StatefulWidget {
  const PlansAndPackages({Key? key}) : super(key: key);

  @override
  State<PlansAndPackages> createState() => _PlansAndPackagesState();
}

class _PlansAndPackagesState extends State<PlansAndPackages> {
  double? height;
  double? width;
  PlansAndPackagesModel? data;
  bool isLoading = true;
  Map<String, dynamic>? paymentIntent;
  String secretKey = 'sk_live_...BiKA';
  List<bool> isLoadings = [];

  @override
  void initState() {
    plansAndPackagesApi();
    super.initState();
  }

  Future<void> plansAndPackagesApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse(PACKAGES_LIST_API);
    http.Response response =
        await http.get(url, headers: {"Authorization": "Bearer $token"});

    print('The Response of Packages Api ${response.body}');
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        data = PlansAndPackagesModel.fromJson(jsonDecode(response.body));
        isLoadings = List.generate(data!.packages!.length, (index) => true);
      });
    } else {
      // ignore: use_build_context_synchronously
      errorSnackBar('something went wrong please try again later', context);
    }
  }

  Future<void> buyFreePackage(int id, int index) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(USER_TOKEN);

    var url = Uri.parse('https://knownjobz.com/api/order-free-package/$id');
    http.Response response =
        await http.get(url, headers: {'Authorization': "Bearer $token"});
    print('The Response of free package ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        isLoadings[index] = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  Future<void> makePayment() async {
    print('Inside');
    try {
      paymentIntent = await createPaymentIntent('100', 'INR');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              merchantDisplayName: 'KnownJobz',
              style: ThemeMode.light));

      displayPaymentSheet();
    } catch (e) {
      print('The Stripe Payment ${e.toString()}');
    }
  }

  void displayPaymentSheet() async {
    print('Inside');
    try {
      await Stripe.instance.presentPaymentSheet();
      setState(() {
        paymentIntent = null;
      });

      // ignore : use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green, content: Text('Paid Successfully')));
    } on StripeException catch (e) {
      print('The Display Payment Sheet ${e.toString()}');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text('Cancelled'),
              ));
    }
  }

  createPaymentIntent(String amount, String currency) async {
    print('Inside');
    try {
      Map<String, dynamic> body = {
        "amount": calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer $secretKey',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body.toString());
    } catch (e) {
      print('The Payment Intent ${e.toString()}');
    }
  }

  calculateAmount(String amount) {
    print('Inside');
    final price = int.parse(amount) * 100;
    return price.toString();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        color: Colors.white,
        child: isLoading
            ? const LoadingWidget()
            : ListView(
                children: [
                  // const SizedBox(height: 20,) ,
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back)),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  data?.company?.package == null
                      ? Container()
                      : const Text(
                          'Current Plan',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),

                  const SizedBox(
                    height: 20,
                  ),

                  data?.company?.package == null
                      ? Container()
                      : Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: width! / 2 + 100,
                            width: width! / 2 + 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey, blurRadius: 2.0),
                                  BoxShadow(
                                      color: Colors.grey, blurRadius: 2.0),
                                  BoxShadow(
                                      color: Colors.grey, blurRadius: 2.0),
                                ]),
                            child: Column(
                              children: [
                                data?.company?.package?.packageTitle == null
                                    ? Container()
                                    : Container(
                                        height: 35,
                                        width: width,
                                        decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                topLeft: Radius.circular(15))),
                                        child: Center(
                                          child: Text(
                                            data!.company!.package!
                                                .packageTitle!,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 15,
                                ),
                                data?.company?.package?.packagePrice == null
                                    ? Container()
                                    : ListTile(
                                        leading: Image.asset(
                                          RUPEE_ICON,
                                          height: 25,
                                          width: 25,
                                        ),
                                        title: Text(
                                          "Package Pricing at : ${data!.company!.package!.packagePrice!.toString()}",
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                data?.company?.packageStartDate == null
                                    ? Container()
                                    : ListTile(
                                        leading: Image.asset(
                                          FROM_DATE_ICON,
                                          height: 35,
                                          width: 35,
                                        ),
                                        title: Text(
                                          'Package starts at : ${DateFormat('yyyy-MM-dd').format(data!.company!.packageStartDate!)}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                data?.company?.packageEndDate == null
                                    ? Container()
                                    : ListTile(
                                        leading: Image.asset(
                                          TO_DATE_ICON,
                                          height: 35,
                                          width: 35,
                                        ),
                                        title: Text(
                                          'Package ends at : ${DateFormat('yyyy-MM-dd').format(data!.company!.packageEndDate!)}',
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                data?.company?.availedJobsQuota == null
                                    ? Container()
                                    : Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          height: 45,
                                          width: 150,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                              color: APPCOLOR.withOpacity(.2),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border:
                                                  Border.all(color: APPCOLOR)),
                                          child: Center(
                                            child: Text(
                                              '${data!.company!.availedJobsQuota!} / ${data!.company!.jobsQuota} left',
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: APPCOLOR,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),

                  const SizedBox(
                    height: 20,
                  ),

                  data?.packages == null
                      ? Container()
                      : const Text(
                          'Update your Packages',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),

                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 400 * data!.packages!.length.toDouble(),
                    width: width,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data!.packages!.length,
                        itemBuilder: (context, index) {
                          return data!.packages![index].packagePrice == 0 &&
                                  data!.company!.availFreepackage! == 1
                              ? Container()
                              : Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: width! / 2 + 100,
                                    width: width! / 2 + 100,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2.0),
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2.0),
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 2.0)
                                        ]),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: width,
                                          decoration: const BoxDecoration(
                                              color: Colors.deepOrangeAccent,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15))),
                                          child: Center(
                                            child: Text(
                                              data!.packages![index]
                                                  .packageTitle!,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            RUPEE_ICON,
                                            height: 21,
                                            width: 21,
                                          ),
                                          title: Text(
                                            'Package pricing at : ${data!.packages![index].packagePrice!.toString()}',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            CHECKMARK_ICON,
                                            height: 21,
                                            width: 21,
                                          ),
                                          title: RichText(
                                            text: TextSpan(
                                                text: 'Can post jobs : ',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                    fontSize: 13),
                                                children: [
                                                  TextSpan(
                                                      text: data!
                                                          .packages![index]
                                                          .packageNumListings!
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600))
                                                ]),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            CHECKMARK_ICON,
                                            height: 21,
                                            width: 21,
                                          ),
                                          title: RichText(
                                            text: TextSpan(
                                                text: "Package duration : ",
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                children: [
                                                  TextSpan(
                                                      text: data!
                                                          .packages![index]
                                                          .packageNumDays!
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const TextSpan(
                                                      text: ' days',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13))
                                                ]),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            if (data!.packages![index]
                                                        .packagePrice ==
                                                    0 &&
                                                data!.company!
                                                        .availFreepackage! ==
                                                    0) {
                                              setState(() {
                                                isLoadings[index] = true;
                                              });

                                              buyFreePackage(
                                                  data!.packages![index].id!,
                                                  index);
                                            }
                                            controller.makePayment(
                                                amount: data!.packages![index]
                                                    .packagePrice!
                                                    .toString(),
                                                currency: 'INR');
                                          },
                                          child: Container(
                                            height: 45,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                color: APPCOLOR,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: const Center(
                                              child: Text(
                                                'Buy a package',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                        }),
                  )
                ],
              ),
      ),
    );
  }
}
