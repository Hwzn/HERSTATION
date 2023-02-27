part of 'DioImports.dart';

class DioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  BuildContext context;
  final bool forceRefresh;
  static late String _branch;
  static late String _branchKey;
  static late String _baseUrl ;

  static init({required String baseUrl, String? branch, String? branchKey}){
    _baseUrl = baseUrl;
    _branch = branch??"1";
    _branchKey = branchKey??"branchId";
  }

  DioHelper({this.forceRefresh = true,required this.context}){
    _dio = Dio(BaseOptions(baseUrl: _baseUrl, contentType: "application/x-www-form-urlencoded; charset=utf-8"))
      ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(responseBody: true,requestBody: true,logPrint: (data)=>log(data.toString())));
  }

  DioCacheManager _getCacheManager() => DioCacheManager(CacheConfig(baseUrl: _baseUrl, defaultRequestMethod: "POST"));

  Options _buildCacheOptions() {
    return buildCacheOptions(
      const Duration(days: 3),
      maxStale: const Duration(days: 7),
      forceRefresh: forceRefresh,
      options: Options(extra: {}),
    );
  }

  Future<dynamic> get({required String url}) async {
    _dio.options.headers = DioUtils.header??await _getHeader();
    try {
      var response = await _dio.get(url, options: _buildCacheOptions());
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      showErrorMessage(e.response);
    }
    return null;
  }

  Future<dynamic> post({required String url, required Map<String, dynamic> body,bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last)
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      }
    });

    _dio.options.headers = DioUtils.header??await _getHeader();

    try {
      var response = await _dio.post(url, data: haveFile? formData : body);
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }


  Future<dynamic> put({required String url, required Map<String, dynamic> body,bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(key, MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      }
    });

    _dio.options.headers = DioUtils.header??await _getHeader();

    try {
      var response = await _dio.put(url, data: haveFile? formData : body);
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> patch({required String url,required Map<String, dynamic> body,bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = DioUtils.header??await _getHeader();
    try {
      var response =
      await _dio.patch(url, data: body);
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> delete({required String url,required Map<String, dynamic> body,bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = DioUtils.header??await _getHeader();
    try {
      var response =
      await _dio.delete(url, data: body);
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> uploadChatFile(String url, Map<String, dynamic> body, {bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = DioUtils.header??await _getHeader();

    try {
      var response = await _dio.post(url, data: formData);
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        showErrorMessage(response);
      }
    } on DioError catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    print(
        "-------------------------------------------------------------------");
    log("$body");
    print(
        "-------------------------------------------------------------------");
  }


  showErrorMessage(Response? response){
    if (response==null) {
      CustomToast.showToastNotification("Check Server");
    }else{
      log("failed response ${response.statusCode}");
      log("failed response ${response.data}");
      var data = response.data;
      if(data is String) data = json.decode(response.data);
      switch(response.statusCode){
        case 500:
          CustomToast.showToastNotification(data["message"].toString());
          break;
        case 400:
        case 422:
          if(data["errors"]!=null){
            Map<String,dynamic> errors = data["errors"];
            errors.forEach((key, value){
              List<String> lst = List<String>.from(value.map((e) => e));
              lst.forEach((e) {
                CustomToast.showToastNotification(e);
              });
            });
          }else{
            CustomToast.showToastNotification(data["message"].toString());
          }
          break;
        case 401:
        case 301:
        case 302:
          tokenExpired();
          break;
      }
    }
  }

  _getHeader() async {
    String? token = GlobalState.instance.get("token");
    String lang = context.read<LangCubit>().state.locale.languageCode;
    return {
      'Accept': 'application/json',
      'Accept-Language': lang,
      'Authorization': 'Bearer $token',
    };
  }


  void tokenExpired()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    AutoRouter.of(context).popUntilRouteWithName(DioUtils.authRoute);
  }
}
