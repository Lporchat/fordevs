import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth() async {
    await httpClient.request(url: url);
  }
}

abstract class HttpClient {
  Future<void> request({@required String url});
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('Shoulb call HttpClient with corrent URL', () async {
    final httpClient = HttpClientSpy();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);
    sut.auth();

    verify(httpClient.request(url: url));
  });
}
