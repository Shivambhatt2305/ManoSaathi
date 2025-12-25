# How to Add Images to Splash Screen

## Current Setup

The app is now configured to support images in the `assets/images/` folder.

## Where to Add Your Images

1. **Location**: `d:\Manoसाथी\manosaathi\assets\images\`
2. **Supported Formats**: PNG, JPG, JPEG, GIF
3. **For Splash Screen**: Name your image `splash_logo.png` (or update the code)

## Adding an Image to Splash Screen

### Option 1: Using Asset Images (Recommended)

1. Place your PNG image in `assets/images/splash_logo.png`
2. The splash screen will automatically detect and display it
3. If the image is not found, it falls back to the default painted design

### Option 2: Update the Image Path

In `lib/utils/splash_image_utils.dart`, change this line:
```dart
'assets/images/splash_logo.png'
```
to your image name.

## Current Splash Screen Implementation

The splash screen now:
- ✅ Attempts to load `assets/images/splash_logo.png`
- ✅ Falls back to a custom painted brain + heart design if image is not found
- ✅ Scales and animates the image smoothly
- ✅ Works on all platforms (Web, Android, iOS)

## How to Use the Splash Image Component

The `SplashImage.buildSplashImage()` widget:
- Checks if the image file exists
- Loads the image with proper error handling
- Falls back to painted design if needed
- Provides smooth animations

## Example: Adding Your Own Image

```
1. Save your image as: assets/images/splash_logo.png
2. Run: flutter pub get
3. Re-run the app
4. The image will automatically appear in the splash screen
```

## Supported Image Dimensions

- **Recommended**: 200x200 pixels (square)
- **Aspect Ratio**: 1:1 (square)
- **Format**: PNG (with transparency) or JPG
- **Size**: Less than 100KB recommended

## Testing

After adding an image:
1. Run `flutter clean`
2. Run `flutter pub get`
3. Run `flutter run -d chrome` (or your platform)
4. The splash screen should display your image

## Notes

- SVG images are not supported by Flutter's `Image.asset` on Web
- Use PNG with transparency for best results
- The image is displayed in a circular container with gradient background
