import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        const ListTile(title: Text('Image from asset:')),
        Card(
          child: Image.asset('assets/images/pngimg/flutter2logo.png'),
        ),
        const Divider(),
        const ListTile(title: Text('Image from url:')),
        Card(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                'https://images.freeimages.com/images/large-previews/4ad/coloured-pencils-1427682.jpg',
          ),
        ),
        const Divider(),
        const ListTile(title: Text('Cached network image:')),
        CachedNetworkImage(
          imageUrl:
              'https://aimstorm.net/wp-content/uploads/2020/11/code-test.png',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const Divider(),
        const ListTile(title: Text('WEBP from package in assets:')),
        Image.asset(
          'animated_images/animated_flutter_stickers.webp',
          package: 'flutter_gallery_assets',
        ),
        const ListTile(
          title: Text('ExtendedImage:'),
          subtitle: Text(
              'provides more functionalities like image caching and shape and borderRadius'),
        ),
        ExtendedImage.network(
          'https://images.unsplash.com/photo-1515488764276-beab7607c1e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1895&q=80',
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
      ],
    );
  }
}
