import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onmi_pro_app/presentation/blocs/photo_bloc.dart';
import 'package:onmi_pro_app/presentation/widgets/card_info_widget.dart';
import 'package:onmi_pro_app/presentation/widgets/warning_widget.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({
    super.key,
  });

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  final ScrollController _scrollController = ScrollController();
  late PhotoBloc _photoBloc;

  @override
  void initState() {
    super.initState();
    _photoBloc = BlocProvider.of<PhotoBloc>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _photoBloc.add(
          const FetchPhotosEvent(),
        );
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _photoBloc.add(
      const FetchPhotosEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (photos, currentPage, totalPages) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    'assets/img/img.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: ListView.separated(
                    controller: _scrollController,
                    itemCount: photos.length,
                    padding: const EdgeInsets.symmetric(
                      vertical: 60,
                      horizontal: 15,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.transparent,
                    ),
                    itemBuilder: (context, index) {
                      final photo = photos[index];
                      return CardInfoWidget(photo: photo, index: index);
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    '$currentPage / $totalPages',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            );
          },
          error: (exception) {
            return WarningWidget(
              exception: exception,
              onPressed: () {
                _photoBloc.add(
                  const FetchPhotosEvent(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
