import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fordevs/data/http/http.dart';
import 'package:fordevs/data/usecases/usecases.dart';

import 'package:fordevs/domain/usecases/usecases.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test('Shoulb call HttpClient with corrent values', () async {
    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());

    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret}));
  });
}
