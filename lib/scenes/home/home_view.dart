import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../design_system/theme/app_typography.dart';
import '../../design_system/widgets/playlist_card.dart';
import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;
  final String mood;

  const HomeView({
    super.key,
    required this.viewModel,
    required this.mood,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadPlaylists(widget.mood);

    _scroll.addListener(() {
      if (_scroll.position.pixels >=
          _scroll.position.maxScrollExtent - 300) {
        widget.viewModel.loadMore();
      }
    });
  }

  void _openPlaylist(String id) async {
    final url = Uri.parse("https://www.youtube.com/playlist?list=$id");

    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
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

          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: _scroll,
                  padding: const EdgeInsets.all(12),
                  itemCount: widget.viewModel.playlists.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 5,
                  ),
                  itemBuilder: (_, i) {
                    final p = widget.viewModel.playlists[i];
                    return PlaylistCard(
                      title: p.title,
                      thumbnailUrl: p.thumbnailUrl,
                      onTap: () => _openPlaylist(p.id),
                    );
                  },
                ),
              ),

              if (widget.viewModel.isLoadingMore)
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
