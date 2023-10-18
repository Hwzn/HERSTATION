part of 'MySubscriptionWidgetsImports.dart';

class BuildRenewMySubscribeBody extends StatefulWidget {
  MySubscriptionsData subscriptionsData;
  MySubscriptionModel mySubscriptionModel;

  BuildRenewMySubscribeBody(
      {super.key,
      required this.subscriptionsData,
      required this.mySubscriptionModel});

  @override
  State<BuildRenewMySubscribeBody> createState() =>
      _BuildRenewMySubscribeBody();
}

class _BuildRenewMySubscribeBody extends State<BuildRenewMySubscribeBody> {
  late Map<dynamic, dynamic> tapSDKResult;

  String sdkStatus = "";
  String? transactionId;
  String? transactionType;

  String tabValue = "0";

  Future<void> configureSDK(String amount) async {
    configureApp();
    setupSDKSession(amount);
  }

  void configureApp() {
    var language = context.read<LangCubit>().state.locale.languageCode;
    GoSellSdkFlutter.configureApp(
        bundleId: "com.hwzn.herstation",
        productionSecreteKey: "sk_live_i5ofT9Ckl7MJzZYBV3tWedDj",
        sandBoxsecretKey: "sk_test_mugCYLbljrOti6D9AoRzGwxW",
        lang: language ?? "ar");
  }

  Future<void> setupSDKSession(String amount) async {
    var user = context.read<UserCubit>().state.model;
    String userName = user.name ?? "";
    String phone = user.phone ?? "";
    String email = user.email ?? "";
    // String userID = user.id.toString();
    try {
      GoSellSdkFlutter.sessionConfigurations(
          trxMode: TransactionMode.PURCHASE,
          transactionCurrency: "Sar",
          amount: amount,
          customer: Customer(
              customerId: "",
              // customer id is important to retrieve cards saved for this customer
              email: email,
              isdNumber: "965",
              number: phone,
              firstName: userName,
              middleName: userName,
              lastName: userName,
              metaData: null),
          paymentItems: <PaymentItem>[],
          // List of taxes
          taxes: [],
          shippings: [],
          // Post URL
          postURL: "https://tap.company",
          paymentDescription: "paymentDescription",
          paymentMetaData: {
            "a": "a meta",
            "b": "b meta",
          },
          paymentReference: Reference(
              acquirer: "acquirer",
              gateway: "gateway",
              payment: "payment",
              track: "track",
              transaction: "trans_910101",
              order: "order_262625"),
          paymentStatementDescriptor: "paymentStatementDescriptor",
          isUserAllowedToSaveCard: true,
          // Enable/Disable 3DSecure
          isRequires3DSecure: true,
          // Receipt SMS/Email
          receipt: Receipt(true, false),
          // Authorize Action [Capture - Void]
          authorizeAction: AuthorizeAction(
              type: AuthorizeActionType.CAPTURE, timeInHours: 10),
          // Destinations
          destinations: null,
          // merchant id
          merchantID: "",
          // Allowed cards
          allowedCadTypes: CardType.ALL,
          applePayMerchantID: "",
          allowsToSaveSameCardMoreThanOnce: false,
          // pass the card holder name to the SDK
          cardHolderName: "Card Holder NAME",
          // disable changing the card holder name by the user
          allowsToEditCardHolderName: true,
          // select payments you need to show [Default is all, and you can choose between WEB-CARD-APPLEPAY ]
          paymentType: PaymentType.ALL,
          // Transaction mode
          sdkMode: SDKMode.Production);
    } on PlatformException {
      // platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      tapSDKResult = {};
    });
  }

  Future<void> startSDK() async {
    tapSDKResult = await GoSellSdkFlutter.startPaymentSDK;
    EasyLoading.dismiss();

    setState(() {
      switch (tapSDKResult['sdk_result']) {
        case "SUCCESS":
          sdkStatus = "SUCCESS";
          transactionId = tapSDKResult['charge_id'];
          transactionType = tapSDKResult['card_brand'];
          handleSDKResult();
          break;
        case "FAILED":
          sdkStatus = "FAILED";
          handleSDKResult();
          showDialogFunc(fieldPaymentDialog(
              "${tapSDKResult['sdk_result']} ${tapSDKResult['message']}"));

          break;
        case "SDK_ERROR":
          sdkStatus = "FAILED";
          //   print(tapSDKResult['sdk_error_code'].toString());
          tapSDKResult['sdk_error_message'];
          tapSDKResult['sdk_error_description'];
          var sdkErrorCode = tapSDKResult['sdk_error_code'].toString();
          var sdkErrorMessage = tapSDKResult['sdk_error_message'];
          var sdkErrorDescription = tapSDKResult['sdk_error_description'];
          print(sdkErrorCode);
          print(sdkErrorMessage);
          print(sdkErrorDescription);
          handleSDKResult();
          CustomToast.showSimpleToast(msg: tr(context, "errors"));
          EasyLoading.dismiss();

          break;
        case "NOT_IMPLEMENTED":
          sdkStatus = "NOT_IMPLEMENTED";
          break;
      }
    });
  }

  void handleSDKResult() {
    print('>>>> ${tapSDKResult['trx_mode']}');

    switch (tapSDKResult['trx_mode']) {
      case "CHARGE":
        printSDKResult('Charge');
        print("charge");
        break;

      case "AUTHORIZE":
        printSDKResult('Authorize');
        break;

      case "SAVE_CARD":
        printSDKResult('Save Card');
        break;

      case "TOKENIZE":
        print('TOKENIZE token : ${tapSDKResult['token']}');
        print('TOKENIZE token_currency  : ${tapSDKResult['token_currency']}');
        print('TOKENIZE card_first_six : ${tapSDKResult['card_first_six']}');
        print('TOKENIZE card_last_four : ${tapSDKResult['card_last_four']}');
        print('TOKENIZE card_object  : ${tapSDKResult['card_object']}');
        print('TOKENIZE card_exp_month : ${tapSDKResult['card_exp_month']}');
        print('TOKENIZE card_exp_year    : ${tapSDKResult['card_exp_year']}');

        //  responseID = tapSDKResult['token'];
        break;
    }
  }

  void printSDKResult(String trx_mode) {
    print('$trx_mode status                : ${tapSDKResult['status']}');
    print('$trx_mode id               : ${tapSDKResult['charge_id']}');
    print('$trx_mode  description        : ${tapSDKResult['description']}');
    print('$trx_mode  message           : ${tapSDKResult['message']}');
    print('$trx_mode  card_first_six : ${tapSDKResult['card_first_six']}');
    print('$trx_mode  card_last_four   : ${tapSDKResult['card_last_four']}');
    print('$trx_mode  card_object         : ${tapSDKResult['card_object']}');
    print('$trx_mode  card_brand          : ${tapSDKResult['card_brand']}');
    print('$trx_mode  card_exp_month  : ${tapSDKResult['card_exp_month']}');
    print('$trx_mode  card_exp_year: ${tapSDKResult['card_exp_year']}');
    print('$trx_mode  acquirer_id  : ${tapSDKResult['acquirer_id']}');
    print(
        '$trx_mode  acquirer_response_code : ${tapSDKResult['acquirer_response_code']}');
    print(
        '$trx_mode  acquirer_response_message: ${tapSDKResult['acquirer_response_message']}');
    print('$trx_mode  source_id: ${tapSDKResult['source_id']}');
    print('$trx_mode  source_channel     : ${tapSDKResult['source_channel']}');
    print('$trx_mode  source_object      : ${tapSDKResult['source_object']}');
    print(
        '$trx_mode source_payment_type : ${tapSDKResult['source_payment_type']}');

    // responseID = tapSDKResult['charge_id'];
  }

  showDialogFunc(Widget widget, {Function? onDismiss}) async {
    await showDialog(
      context: context,
      builder: (context) => widget,
    );
    onDismiss == null ? () {} : onDismiss();
  }

  Dialog fieldPaymentDialog(String reason) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        child: Container(
          width: 390,
          height: 252,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x1a000000),
                  offset: Offset(0, 0),
                  blurRadius: 27,
                  spreadRadius: 0)
            ],
            color: Color(0xffffffff),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Icon(
                  Icons.error,
                  size: 60,
                  color: Colors.red,
                ),
              ),
              Text(reason,
                  style: const TextStyle(
                      color: Color(0xff1a201d),
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0),
                  textAlign: TextAlign.center),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyColors.bgPrimary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
              title: widget.mySubscriptionModel.subscription!.name ?? "",
              color: MyColors.black,
              fontWeight: FontWeight.bold,
              size: 16),
          const SizedBox(
            height: 15,
          ),
          MyText(
              title: widget.mySubscriptionModel.subscription!.desc ?? "",
              color: MyColors.secondary,
              size: 14),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Spacer(),
              InkWell(
                child: Container(
                  width: 130,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyColors.secondary,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(15),
                      top: Radius.circular(15),
                    ),
                  ),
                  child: MyText(
                    title: tr(context, "renewSubscribe"),
                    size: 13,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primary,
                  ),
                ),
                onTap: () {
                  LoadingDialog.showLoadingDialog();
                  configureSDK(widget.mySubscriptionModel.subscription!.price
                      .toString());
                  startSDK().then((value) {
                    if (sdkStatus == "SUCCESS") {
                      widget.subscriptionsData.renewSubscribe(
                          context,
                          widget.mySubscriptionModel.subscription!.id!,
                          widget.mySubscriptionModel.subscription!.price!
                              .toDouble(),
                          transactionId ?? "",
                          transactionType ?? "");
                    } else {
                      // CustomToast.showSimpleToast(msg: tr(context, "errors"));
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     MyText(
      //         title:mySubscriptionModel.subscription!.name??"",
      //         color: MyColors.black,
      //         fontWeight: FontWeight.bold,
      //         size: 16),
      //     const SizedBox(
      //       height: 15,
      //     ),
      //     MyText(
      //         title: mySubscriptionModel.subscription!.desc??"",
      //         color: MyColors.secondary,
      //         size: 14),
      //     const SizedBox(
      //       height: 25,
      //     ),
      //     Row(
      //       children: [
      //         const Spacer(),
      //         SizedBox(
      //           width: 120,
      //           child: LoadingButton(
      //             borderRadius: 15,
      //             borderColor: MyColors.secondary,
      //             title: tr(context, "renewSubscribe"),
      //             onTap: () => subscriptionsData.renewSubscribe(context,mySubscriptionModel.subscription!.id!),
      //             color: MyColors.secondary,
      //             textColor: MyColors.primary,
      //             btnKey: subscriptionsData.btnRenewSubscribe,
      //             margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      //             fontSize: 13,
      //           ),
      //         )
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
