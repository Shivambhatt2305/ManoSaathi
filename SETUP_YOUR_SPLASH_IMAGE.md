# 🎨 Using Your Mind and Heart Image

## ✅ What's Been Set Up

Your splash screen is now configured to display your custom image!

**Image Name**: `mind_and_heart_for_manosaathi.jpg`  
**Location**: `assets/images/`

---

## 📁 Where to Add Your Image

### Current Structure:
```
assets/
└── images/
    ├── splash_logo.svg (old example)
    └── (YOUR IMAGE GOES HERE)
```

### What to Do:
1. **Copy your image** `mind_and_heart_for_manosaathi.jpg`
2. **Paste it into**: `d:\Manoसाथी\manosaathi\assets\images\`

---

## 🚀 Once You Add the Image

The app will automatically:
1. ✅ Detect the image file
2. ✅ Load it into memory
3. ✅ Display it on the splash screen
4. ✅ Animate it smoothly (scale: 0.8 → 1.0)
5. ✅ Show it for 5 seconds
6. ✅ Navigate to home screen

---

## 🎯 Complete Setup Steps

### Step 1: Add Image to Assets
```
d:\Manoसाथी\manosaathi\assets\images\mind_and_heart_for_manosaathi.jpg
```

### Step 2: Reload App
```bash
# Option A: Hot reload (if running)
r (in terminal)

# Option B: Clean & Run
flutter clean
flutter pub get
flutter run -d chrome
```

### Step 3: Enjoy!
Your custom image will appear on the splash screen! 🎉

---

## 🎨 Splash Screen Preview

```
┌─────────────────────────────┐
│   Splash Screen (5 sec)     │
├─────────────────────────────┤
│                             │
│      ┌─────────────┐        │
│      │   YOUR      │        │
│      │   IMAGE     │        │
│      │  (200x200)  │        │
│      └─────────────┘        │
│                             │
│      Manoसाथी              │
│  Mental Health Support      │
│                             │
└─────────────────────────────┘
```

---

## 📋 Current Configuration

**File**: `lib/utils/splash_image_utils.dart`

✅ Image path: `assets/images/mind_and_heart_for_manosaathi.jpg`  
✅ Size: 200×200 pixels (auto-scaled)  
✅ Format: JPG  
✅ Fallback: Brain + Heart icon  

---

## ✨ Features

- 📱 **Responsive**: Works on all screen sizes
- 🎬 **Animated**: Smooth scale-up effect
- 🎨 **Styled**: Rounded corners (20px radius)
- 🛡️ **Reliable**: Falls back to painted design if image missing
- ⚡ **Fast**: Loads instantly from bundled assets
- 🌍 **Cross-Platform**: Web, Android, iOS, macOS, Linux, Windows

---

## 📝 File Changes

**Updated Files:**
- `lib/utils/splash_image_utils.dart` → Image path set to your file
- `pubspec.yaml` → Assets folder already configured

---

## 🎯 Next Action

**Just add your image file here:**
```
d:\Manoसाथी\manosaathi\assets\images\mind_and_heart_for_manosaathi.jpg
```

**That's it!** The app will do the rest automatically! 🚀

---

## 💡 Tips

- **Image Quality**: JPG is good for photographs
- **Size**: Keep under 200KB for fast loading
- **Dimensions**: Works best at 200×200 or any square size
- **Format**: JPG, PNG, GIF all supported

---

## 🔍 Troubleshooting

| Issue | Solution |
|-------|----------|
| Image not showing | Check file is in `assets/images/` folder |
| Blurry image | Ensure image is high quality (96DPI+) |
| Fallback shows instead | Verify filename matches exactly |
| Need to update filename | Edit `lib/utils/splash_image_utils.dart` line 16 and 31 |

---

## 📞 Need to Change Filename?

If your image has a different name, edit:

**File**: `lib/utils/splash_image_utils.dart`

**Change line 16:**
```dart
'assets/images/mind_and_heart_for_manosaathi.jpg'  // ← Update this
```

**Change line 31:**
```dart
'assets/images/mind_and_heart_for_manosaathi.jpg'  // ← And this
```

---

**Ready to add your image? Just copy it to `assets/images/` folder!** ✨
