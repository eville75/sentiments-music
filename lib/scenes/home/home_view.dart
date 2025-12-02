import 'package:flutter/material.dart';
import '../../design_system/theme/app_theme.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/widgets/playlist_card.dart';
import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;
  final String mood;

  const HomeView({super.key, required this.viewModel, required this.mood});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadPlaylists(widget.mood);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mood, style: AppTypography.h2),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: widget.viewModel,
        builder: (_, __) {
          if (widget.viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: widget.viewModel.playlists.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (_, i) {
              final p = widget.viewModel.playlists[i];
              return PlaylistCard(
                title: p.title,
                thumbnailUrl: p.thumbnailUrl,
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
