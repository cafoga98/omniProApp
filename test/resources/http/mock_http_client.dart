import 'package:mockito/annotations.dart';

@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
import 'package:http/http.dart' as http;