import 'package:flutter/material.dart';

import 'package:image_search_clean/clean/ui/home_view_model.dart';
import 'package:image_search_clean/clean/ui/widget/photo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = context.watch<HomeViewModel>();
    // final viewModel = Provider.of<HomeViewModel>(context);
    // final viewModel = PhotoProvider.of(context).viewModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Image Searcher',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    context.read<HomeViewModel>().fetch(_controller.text);
                    // viewModel.fetch(_controller.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Consumer<HomeViewModel>(
            builder: (_, viewModel, child) {
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: viewModel.photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    final photo = viewModel.photos[index];
                    return PhotoWidget(
                      photo: photo,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
