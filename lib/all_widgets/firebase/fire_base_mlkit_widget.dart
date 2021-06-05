import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class FirebaseMLKitExample extends StatefulWidget {
  const FirebaseMLKitExample({Key key}) : super(key: key);

  @override
  _FirebaseMLKitExampleState createState() => _FirebaseMLKitExampleState();
}

class _FirebaseMLKitExampleState extends State<FirebaseMLKitExample> {
  File _imageFile;
  String _mlResult = '<no result>';
  final _picker = ImagePicker();

  Future<bool> _pickImage() async {
    setState(() => this._imageFile = null);
    final File imageFile = await showDialog<File>(
      context: context,
      builder: (ctx) => SimpleDialog(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take picture'),
            onTap: () async {
              final PickedFile pickedFile =
                  await _picker.getImage(source: ImageSource.camera);
              Navigator.pop(ctx, File(pickedFile.path));
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Pick from gallery'),
            onTap: () async {
              try {
                final PickedFile pickedFile =
                    await _picker.getImage(source: ImageSource.gallery);
                Navigator.pop(ctx, File(pickedFile.path));
              } catch (e) {
                print(e);
                Navigator.pop(ctx, null);
              }
            },
          ),
        ],
      ),
    );
    if (imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick one image first.')),
      );
      return false;
    }
    setState(() => this._imageFile = imageFile);
    print('picked image: ${this._imageFile}');
    return true;
  }

  Future<void> _imageLabelling() async {
    setState(() => this._mlResult = '<no result>');
    if (await _pickImage() == false) {
      return;
    }
    String result = '';
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(this._imageFile);
    final ImageLabeler labelDetector = FirebaseVision.instance.imageLabeler();
    final List<ImageLabel> labels =
        await labelDetector.processImage(visionImage);
    result += 'Detected ${labels.length} labels.\n';
    for (final ImageLabel label in labels) {
      final String text = label.text;
      final String entityId = label.entityId;
      final double confidence = label.confidence;
      result +=
          '\n#Label: $text($entityId), confidence=${confidence.toStringAsFixed(3)}';
    }
    if (result.isNotEmpty) {
      setState(() => this._mlResult = result);
    }
  }

  Future<void> _textOcr() async {
    setState(() => this._mlResult = '<no result>');
    if (await _pickImage() == false) {
      return;
    }
    String result = '';
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(this._imageFile);
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    final String text = visionText.text;
    debugPrint('Recognized text: "$text"');
    result += 'Detected ${visionText.blocks.length} text blocks.\n';
    for (final TextBlock block in visionText.blocks) {
      final Rect boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;
      result += '\n# Text block:\n '
          'bbox=$boundingBox\n '
          'cornerPoints=$cornerPoints\n '
          'text=$text\n languages=$languages';
    }
    if (result.isNotEmpty) {
      setState(() => this._mlResult = result);
    }
  }

  Future<void> _barcodeScan() async {
    setState(() => this._mlResult = '<no result>');
    if (await _pickImage() == false) {
      return;
    }
    String result = '';
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(this._imageFile);
    final BarcodeDetector barcodeDetector =
        FirebaseVision.instance.barcodeDetector();

    final List<Barcode> barcodes =
        await barcodeDetector.detectInImage(visionImage);
    result += 'Detected ${barcodes.length} barcodes.\n';
    for (final Barcode barcode in barcodes) {
      final Rect boundingBox = barcode.boundingBox;
      final List<Offset> cornerPoints = barcode.cornerPoints;

      final String rawValue = barcode.rawValue;
      final valueType = barcode.valueType;
      result += '\n# Barcode:\n '
          'bbox=$boundingBox\n '
          'cornerPoints=$cornerPoints\n '
          'rawValue=$rawValue\n '
          'vlaueType=$valueType';
    }
    if (result.isNotEmpty) {
      setState(() => this._mlResult = result);
    }
  }

  Future<void> _faceDetect() async {
    setState(() => this._mlResult = '<no result>');
    if (await _pickImage() == false) {
      return;
    }
    String result = '';
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(this._imageFile);
    const options = FaceDetectorOptions(
      enableLandmarks: true,
      enableClassification: true,
      enableTracking: true,
    );
    final FaceDetector faceDetector =
        FirebaseVision.instance.faceDetector(options);
    final List<Face> faces = await faceDetector.processImage(visionImage);
    result += 'Detected ${faces.length} faces.\n';
    for (final Face face in faces) {
      final Rect boundingBox = face.boundingBox;
      // Head is rotated to the right rotY degrees
      final double rotY = face.headEulerAngleY;
      // Head is tilted sideways rotZ degrees
      final double rotZ = face.headEulerAngleZ;
      result += '\n# Face:\n '
          'bbox=$boundingBox\n '
          'rotY=$rotY\n '
          'rotZ=$rotZ\n ';
      final FaceLandmark leftEar = face.getLandmark(FaceLandmarkType.leftEar);
      if (leftEar != null) {
        final Offset leftEarPos = leftEar.position;
        result += 'leftEarPos=$leftEarPos\n ';
      }
      if (face.smilingProbability != null) {
        final double smileProb = face.smilingProbability;
        result += 'smileProb=${smileProb.toStringAsFixed(3)}\n ';
      }
      if (face.trackingId != null) {
        final int id = face.trackingId;
        result += 'id=$id\n ';
      }
    }
    if (result.isNotEmpty) {
      setState(() => this._mlResult = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        if (this._imageFile == null)
          const Placeholder(
            fallbackHeight: 200.0,
          )
        else
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: FileImage(this._imageFile),
            // Image.file(, fit: BoxFit.contain),
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ButtonBar(
            children: <Widget>[
              ElevatedButton(
                onPressed: this._imageLabelling,
                child: const Text('Image Labelling'),
              ),
              ElevatedButton(
                onPressed: this._textOcr,
                child: const Text('Text OCR'),
              ),
              ElevatedButton(
                onPressed: this._barcodeScan,
                child: const Text('Barcode Scan'),
              ),
              ElevatedButton(
                onPressed: this._faceDetect,
                child: const Text('Face Detection'),
              ),
            ],
          ),
        ),
        const Divider(),
        Text('Result:', style: Theme.of(context).textTheme.subtitle2),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            this._mlResult,
            style: GoogleFonts.droidSansMono(),
          ),
        ),
      ],
    );
  }
}
