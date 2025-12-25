# 🎨 Manoसाथी - Visual & Branding Guide

## 📐 Design System Overview

### Logo Concept
```
    Brain Icon (Psychology)      Heart Icon (Compassion)
         (Left)                        (Right)
           ◉                             ♥
          /|\                          / \
         / | \                        /   \
              ├─────────────────────┤
         (Heartbeat Line)
         
    Combined meaning: Mind-Heart Connection
    Colors: Red (Primary) + Blue (Secondary)
```

### App Name Styling
```
Mano  साथी
(Mind)(Companion)

Display Format:
▸ "Mano" in RED (#E63946)
▸ "साथी" in BLUE (#457B9D)

Tagline: "Mental Health Detection & Support"
Subtext: "Your 24/7 Wellness Companion"
```

---

## 🎯 Color Palette

### Primary Colors (Healthcare Theme)

```
┌────────────────────────────────────┐
│ PRIMARY RED                         │
│ #E63946                            │
│ RGB: 230, 57, 70                   │
│ HSL: 357°, 83%, 56%                │
│ Usage: Main CTA, alerts, emphasis  │
│ Emotions: Urgency, care, warmth    │
└────────────────────────────────────┘
```

```
┌────────────────────────────────────┐
│ PRIMARY BLUE (Dark)                │
│ #1D3557                            │
│ RGB: 29, 53, 87                    │
│ HSL: 211°, 50%, 23%                │
│ Usage: Secondary CTAs, text        │
│ Emotions: Trust, stability, calm   │
└────────────────────────────────────┘
```

```
┌────────────────────────────────────┐
│ ACCENT BLUE (Medium)               │
│ #457B9D                            │
│ RGB: 69, 123, 157                  │
│ HSL: 205°, 40%, 44%                │
│ Usage: Icons, links, tertiary      │
│ Emotions: Support, healing         │
└────────────────────────────────────┘
```

```
┌────────────────────────────────────┐
│ WHITE                              │
│ #FFFFFF                            │
│ Usage: Surfaces, cards, text bg    │
│ Emotions: Cleanliness, clarity     │
└────────────────────────────────────┘
```

```
┌────────────────────────────────────┐
│ LIGHT GRAY (Backgrounds)           │
│ #F1F1F1                            │
│ Usage: Secondary backgrounds       │
│ Emotions: Softness, spaciousness   │
└────────────────────────────────────┘
```

### Semantic Colors

```
SUCCESS: #2ECC71 (Green)    - Positive actions
WARNING: #F39C12 (Orange)   - Cautions
DANGER:  #E74C3C (Red)      - Alerts, crisis
INFO:    #3498DB (Blue)     - Information
```

---

## 🔤 Typography System

### Font Family
- **Primary**: System font (San Francisco / Roboto)
- **Fallback**: -apple-system, BlinkMacSystemFont, "Roboto"

### Type Scale

```
┌─────────────────────────────────────────┐
│ DISPLAY LARGE (H1)                      │
│ 32px / Bold (700)                       │
│ Line Height: 1.2                        │
│ Usage: Main headers                     │
│ Example: "Manoसाथी"                     │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│ HEADLINE SMALL (H3)                     │
│ 20px / Semi-Bold (600)                  │
│ Line Height: 1.3                        │
│ Usage: Section titles                   │
│ Example: "Quick Actions"                │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│ TITLE LARGE                             │
│ 18px / Semi-Bold (600)                  │
│ Line Height: 1.4                        │
│ Usage: Card titles                      │
│ Example: "Talk Now"                     │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│ BODY LARGE                              │
│ 16px / Medium (500)                     │
│ Line Height: 1.5                        │
│ Usage: Main body text                   │
│ Example: Chat messages                  │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│ BODY MEDIUM                             │
│ 14px / Regular (400)                    │
│ Line Height: 1.5                        │
│ Usage: Secondary text                   │
│ Example: Descriptions                   │
└─────────────────────────────────────────┘

┌─────────────────────────────────────────┐
│ LABEL SMALL                             │
│ 12px / Medium (500)                     │
│ Line Height: 1.4                        │
│ Usage: Captions, labels                 │
│ Example: Timestamps                     │
└─────────────────────────────────────────┘
```

---

## 🎨 Component Styling

### Button Styles

#### Primary Button (CTA)
```
Background: #E63946 (Red)
Text Color: White
Padding: 14px vertical, 32px horizontal
Border Radius: 12px
Elevation: 4
Font: 16px Semi-Bold
Hover: Darker red
Active: Scale 0.95
```

#### Outlined Button (Secondary)
```
Background: Transparent
Border: 2px #E63946
Text Color: #E63946
Padding: 14px vertical, 32px horizontal
Border Radius: 12px
Font: 16px Semi-Bold
Hover: Light red background
```

### Card Styling
```
Background: White
Border Radius: 12px
Elevation: 2px shadow
Padding: 16px
Margin: 0
Border: Optional left accent (4px)
Hover: Slight elevation increase
```

### Input Field Styling
```
Background: #F1F1F1
Border: None
Border Radius: 12px
Padding: 16px horizontal, 12px vertical
Focus: 2px #E63946 border
Error: 2px #E74C3C border
```

---

## 📱 Screen Layouts

### Splash Screen Layout
```
┌─────────────────────────────────┐
│  Skip Button (top-right)        │
├─────────────────────────────────┤
│                                 │
│        ┌─────────────┐          │
│        │   Logo      │          │
│        │   Circle    │          │
│        │ (Brain♥)    │          │
│        └─────────────┘          │
│                                 │
│      Mano साथी                   │
│   Mental Health Detection       │
│    & Support System             │
│                                 │
│      Loading Indicator...       │
│                                 │
└─────────────────────────────────┘
```

### Home Screen Layout
```
┌─────────────────────────────────┐
│  App Bar (Red background)       │
│  "Mano साथी" | Profile Icon     │
│  Subtitle: "Your wellness..."   │
├─────────────────────────────────┤
│ ┌───────────────────────────┐   │
│ │  Today's Status Card      │   │
│ │  ┌─ 😊 Feeling Good       │   │
│ │  └─ Motivational message  │   │
│ └───────────────────────────┘   │
│                                 │
│  Quick Actions                  │
│  ┌────────┬──────────┬────────┐ │
│  │Talk    │ Check    │ Crisis │ │
│  │Now     │ Mood     │ Help   │ │
│  └────────┴──────────┴────────┘ │
│                                 │
│  Explore Resources              │
│  [Self-Assessment Card] ►       │
│  [Healing Audio Card] ►         │
│  [Videos Card] ►                │
│  [Mood History Card] ►          │
│                                 │
├─────────────────────────────────┤
│ Home  Assess  Library  Settings │
└─────────────────────────────────┘
```

### Chatbot Screen Layout
```
┌─────────────────────────────────┐
│  App Bar: "Mano साथी"           │
│  Subtitle: "AI Wellness..."     │
├─────────────────────────────────┤
│                                 │
│ ◄ Bot: "Hello! How are you?"    │
│ (Time: 11:30)                   │
│                                 │
│                 You: "Worried" ► │
│              (Time: 11:31)       │
│                                 │
│ ◄ Bot: "I hear you..." (blue)   │
│ Detected: anxious | Stress: 72% │
│                                 │
├─────────────────────────────────┤
│ [🎤 Mic] Input field... [Send►] │
└─────────────────────────────────┘
```

---

## 🎭 Emotion Indicators

### Mood Emoji Scale
```
😄  Excellent    Score: 10
😊  Good         Score: 8
😐  Okay         Score: 5
😕  Bad          Score: 3
😢  Terrible     Score: 1
```

### Emotion Badges
```
Anxious  → Yellow border + icon
Sad      → Blue border + icon
Angry    → Red border + icon
Lonely   → Purple border + icon
Neutral  → Gray border + icon
```

### Stress Score Visualization
```
0-30:   GREEN   (Low)
31-60:  ORANGE  (Medium)
61-100: RED     (High)

Visual representation:
Progress bar | Percentage | Status
████░░░░░░  | 42% | Medium Stress
```

---

## 🎬 Animation Guidelines

### Splash Screen
```
Fade In: 1500ms (ease-in)
Scale: 1200ms (ease-out-back)
Slide Up: 1500ms (ease-out)
Skip button appears: At 500ms
```

### Button Interactions
```
Press: Scale 0.95 (200ms)
Release: Scale 1.0 (200ms)
Hover: Elevation +2, color darken
```

### Card Transitions
```
Enter: Slide from bottom (300ms)
Exit: Fade out (200ms)
Tap feedback: Color flash (100ms)
```

### Chat Messages
```
Appear: Slide from side (200ms)
Timestamp: Fade in (400ms)
Emotion badge: Pulse (500ms)
```

---

## 📏 Spacing & Layout

### Spacing Scale
```
xs: 4px    - Small gaps, icons
sm: 8px    - Icon-text spacing
md: 12px   - Card internal
lg: 16px   - Section padding
xl: 20px   - Card padding
2xl: 28px  - Section spacing
3xl: 32px  - Major gaps
4xl: 40px  - Screen padding
```

### Border Radius
```
xs: 4px    - Small elements
sm: 8px    - Input fields
md: 12px   - Cards, buttons
lg: 16px   - Large buttons
full: 999px - Circular elements
```

### Shadows
```
Light:    0 2px 4px rgba(0,0,0,0.1)
Medium:   0 4px 8px rgba(0,0,0,0.15)
Heavy:    0 8px 16px rgba(0,0,0,0.2)
AppBar:   0 4px 12px rgba(230,57,70,0.3)
FAB:      0 6px 12px rgba(230,57,70,0.4)
```

---

## 🔍 Accessibility Features

### Color Contrast
```
WCAG AA Compliant:
┌──────────────────────────┐
│ White on Red             │
│ #FFFFFF on #E63946       │
│ Ratio: 3.5:1 ✓ (AA+)     │
│ Usage: Buttons, banners   │
└──────────────────────────┘

┌──────────────────────────┐
│ Dark Text on Light       │
│ #424242 on #F1F1F1       │
│ Ratio: 10.5:1 ✓ (AAA)    │
│ Usage: Body text          │
└──────────────────────────┘
```

### Text Size Options
```
Small (12px):  Available
Normal (14px): Default
Large (16px):  Available
XL (18px):     Available
XXL (20px):    Available
```

### Touch Targets
```
Minimum: 44px × 44px
Recommended: 48px × 48px
Spacing: 8px minimum between
```

---

## 📱 Responsive Breakpoints

```
Mobile (320px - 599px)
├─ Single column layout
├─ Full-width cards
└─ Stacked navigation

Tablet (600px - 999px)
├─ 2-column grid
├─ Side navigation option
└─ Horizontal scroll

Desktop (1000px+)
├─ 3-column grid
├─ Side panel layouts
└─ Full navigation menu
```

---

## 🎪 Branding Guidelines

### Logo Usage
- ✓ Always maintain aspect ratio
- ✓ Minimum size: 48px (mobile), 64px (web)
- ✓ Clear space: Equal to logo height on all sides
- ✗ Don't rotate or distort
- ✗ Don't change colors
- ✗ Don't add effects or shadows

### Color Usage
- Primary Red: Main CTAs, critical alerts
- Primary Blue: Secondary actions, headers
- White/Gray: Neutral backgrounds, text
- Green: Success states
- Red: Danger/alerts
- Orange: Warnings

### Typography
- Headers: Bold, large, clear hierarchy
- Body: Medium weight, 14-16px, readable
- Labels: Small, semi-bold, descriptive
- Always left-aligned (LTR)

### Photography & Imagery
- Healthcare-related (if needed)
- Diverse, inclusive representation
- High quality, 72dpi minimum
- Consistent color grading

---

## 🖨️ Print/Export Guidelines

### App Screenshot Sizing
```
Mobile (1080×1920px):
├─ Full screen: 1080×1920
├─ Safe area: 1080×1776 (88px status bar)
└─ Bottom nav: 1080×56

Tablet (iPad):
├─ Portrait: 1024×1366
├─ Landscape: 1366×1024
└─ Safe area: Accounting for notch/home
```

### Branding Assets to Include
- Logo (SVG + PNG)
- Color palette (Hex codes)
- Font files (if custom)
- Icon set (SVG)
- Screenshot templates

---

## ✨ Brand Voice & Tone

### Chatbot Responses
**Tone**: Empathetic, supportive, non-judgmental
**Style**: Conversational, warm, professional
**Length**: Short sentences, actionable
**Emotion**: Calm, hopeful, caring

**Example Good**:
```
"I hear you — that sounds really tough. 
Let's work through this together. 
Would breathing exercise help?"
```

**Example Bad**:
```
"Your anxiety is a mental disorder. 
See a psychiatrist immediately."
```

### Button Labels
- Action-oriented: "Talk Now", "Save Mood"
- Conversational: "Check In", "Get Help"
- Clear intent: "Call Helpline", not "Contact"

### Error Messages
- Supportive: "Please share something to continue"
- Not accusatory: Not "You didn't select mood!"
- Helpful: Include next steps

---

**Design System v1.0 - Created for Manoसाथी** 🎨❤️
