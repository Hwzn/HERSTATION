part of 'PaymentWidgetsImports.dart';

class BuildChooseWayPayDialog extends StatefulWidget {
  final PaymentData paymentData;
  final ServiceModel serviceModel;
  final ServiceRequestData serviceRequestData;

  BuildChooseWayPayDialog(
      {super.key,
      required this.paymentData,
      required this.serviceModel,
      required this.serviceRequestData});

  @override
  State<BuildChooseWayPayDialog> createState() => _BuildChooseWayPayDialog();
}

class _BuildChooseWayPayDialog extends State<BuildChooseWayPayDialog> {
  late Map<dynamic, dynamic> tapSDKResult;

  String sdkStatus = "";
  String? transactionId;
  String? transactionType;

  String tabValue = "0";

  Future<void> configureSDK(String amount) async {
     configureApp();
    setupSDKSession(amount);
  }

  void configureApp()  {
    var language = context.read<LangCubit>().state.locale.languageCode;
    GoSellSdkFlutter.configureApp(
        bundleId: "com.hwzn.herstation",
        productionSecreteKey: "sk_live_i5ofT9Ckl7MJzZYBV3tWedDj",
        sandBoxsecretKey: "sk_test_mugCYLbljrOti6D9AoRzGwxW",
        lang: language );
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
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 3);
    double widthCancel = MediaQuery.of(context).size.width - width - 40;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                MyText(
                  title: tr(context, "choosePayWay"),
                  color: MyColors.primary,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: widget.paymentData.isDepositOnly,
              builder: (context, state) {
                return Column(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: state.data
                                ? MyColors.primary
                                : MyColors.bgPrimary),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: tr(context, "payDeposit"),
                              color:
                                  state.data ? MyColors.white : MyColors.black,
                              size: 13,
                            ),
                            MyText(
                              title:
                                  " ${widget.serviceModel.totalRetainer} ${tr(context, "sr")}",
                              color:
                                  state.data ? MyColors.white : MyColors.black,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                      onTap: () =>
                          widget.paymentData.isDepositOnly.onUpdateData(true),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: state.data
                                ? MyColors.bgPrimary
                                : MyColors.primary),
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: tr(context, "payTotalAmount"),
                              color:
                                  state.data ? MyColors.black : MyColors.white,
                              size: 13,
                            ),
                            MyText(
                              title:
                                  " ${widget.serviceModel.totalPrice} ${tr(context, "sr")}",
                              color:
                                  state.data ? MyColors.black : MyColors.white,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                      onTap: () =>
                          widget.paymentData.isDepositOnly.onUpdateData(false),
                    ),
                  ],
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                child: LoadingButton(
                  borderRadius: 15,
                  borderColor: MyColors.primary,
                  title: tr(context, "goPay"),
                  onTap: () {
                    double amount;
                    if (widget.paymentData.isDepositOnly.state.data) {
                      amount = widget.serviceModel.totalRetainer ?? 0;
                    } else {
                      amount = widget.serviceModel.totalPrice ?? 0;
                    }
                    LoadingDialog.showLoadingDialog();
                    configureSDK(amount.toString());
                    startSDK().then((value) {
                      if (sdkStatus == "SUCCESS") {
                        widget.paymentData
                            .goPay(context, widget.serviceModel,
                                widget.serviceRequestData, amount)
                            .then((result) {
                          widget.paymentData.addTransaction(context, amount,
                              result, transactionId!, transactionType!);
                        });
                      } else {
                        // CustomToast.showSimpleToast(msg: tr(context, "errors"));
                      }
                    });
                  },
                  color: MyColors.primary,
                  textColor: MyColors.white,
                  btnKey: widget.paymentData.btnGoPay,
                  fontSize: 13,
                ),
              ),
              InkWell(
                child: Container(
                  width: widthCancel,
                  alignment: AlignmentDirectional.center,
                  child: MyText(
                    title: tr(context, "skip"),
                    color: MyColors.grey,
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  widget.paymentData.closeDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
