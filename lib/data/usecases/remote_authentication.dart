import 'package:meta/meta.dart';

import '../http/http.dart';

import '../../domain/usecases/authenticate.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    final body = await httpClient.request(
      url: url,
      method: 'post',
      body: params.toJson(),
    );
  }
}
