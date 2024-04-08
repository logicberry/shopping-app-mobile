import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteImage extends StatefulWidget {
  final String imageUrl;
  final Function(Color)? onPaletteGenerated; // Callback function

  const PaletteImage({
    super.key,
    required this.imageUrl,
    this.onPaletteGenerated,
  });

  @override
  State<PaletteImage> createState() => _PaletteImageState();
}

class _PaletteImageState extends State<PaletteImage> {
  late PaletteGenerator _paletteGenerator;

  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  Future<void> _generatePalette() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.imageUrl),
      size: const Size(50, 50),
    );
    setState(() {
      _paletteGenerator = paletteGenerator;
    });
    widget.onPaletteGenerated
        ?.call(_paletteGenerator.lightVibrantColor?.color ?? Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(widget.imageUrl);
  }
}
