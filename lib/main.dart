import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:onmi_pro_app/core/utils/injection.dart';
import 'package:onmi_pro_app/data/datasource/photo_remote_datasource.dart';
import 'package:onmi_pro_app/domain/repositories/photo_repository.dart';
import 'package:onmi_pro_app/presentation/pages/photo_page.dart';
import 'presentation/blocs/photo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoBloc>(
      create: (context) => getIt<PhotoBloc>(),
      child: MaterialApp(
        title: 'OmniPro App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PhotoPage(),
      ),
    );
  }
}
