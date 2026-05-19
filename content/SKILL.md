---
name: devops-90days-training
description: >
  Use this skill to generate any chapter or module of the DevOps 90-Day
  Training series by Aryashree Pritikrishna. Covers PDF generation with
  ReportLab, blackboard explainer illustrations with handwritten text,
  doodle diagrams, colorful chalk markers, educational infographic style,
  bullet-first content, all box types, quizzes, and the full design system.
  Trigger when user says: "build day", "generate chapter", "devops training
  PDF", "90-day devops", "new session content", or shares training notes
  with a day/module reference.
author: Aryashree Pritikrishna
repo: https://github.com/aryashreep/learn-devops-in-90-days
version: 4.0
edition: 2026
updated: 2026-05-19
---

# DevOps 90-Day Training — Generation Skill v4.0

---

## 1. IDENTITY & BRANDING

```
Author:        Aryashree Pritikrishna
GitHub:        https://github.com/aryashreep/learn-devops-in-90-days
Series Title:  DevOps & Cloud — 90-Day Learning Journey
Edition:       2026
Tagline:       From Zero to Production — Session by Session
```

---

## 2. WORKFLOW — SESSION BY SESSION

```
User shares training content → Claude reads → builds PDF chapter → output
```

### Per session the user provides:
- Day number (e.g., Day 01)
- Module name (e.g., Module 1: Introduction to DevOps, Cloud & SRE)
- Training content (pasted notes OR uploaded .docx/.pdf)
- Optional: reference images for diagram style

### Claude does automatically:
- Reads content via extract-text / view tools
- Restructures all content into bullet-first format
- Applies the full 13-element chapter template
- Generates appropriate diagrams programmatically
- Adds all boxes word-wrapped (never overflow)
- Outputs PDF to `content/day-{NN}/module-{N}-{slug}/` (project-relative, adapts to local or cloud environments)

---

## 3. FILE NAMING

```
DevOps_90Days_Day{NN}_{Module}_{Topic}.pdf

Examples:
  DevOps_90Days_Day01_Module1_Intro_DevOps_Cloud_SRE.pdf
  DevOps_90Days_Day07_Module2_Linux_File_System.pdf
  DevOps_90Days_Module1_Complete.pdf
  DevOps_90Days_Master_Index_2026.pdf
```

---

## 4. COLOUR PALETTE

```python
C = dict(
    blue    = HexColor('#2563EB'),   # Dev, code, primary headers
    cyan    = HexColor('#06B6D4'),   # Monitoring, data, observability
    teal    = HexColor('#14B8A6'),   # Ops, cloud, infrastructure
    green   = HexColor('#22C55E'),   # Success, summary, objectives, try-it
    orange  = HexColor('#F59E0B'),   # Warnings, release, caution
    purple  = HexColor('#8B5CF6'),   # Automation, CI/CD, pipelines
    pink    = HexColor('#EC4899'),   # Testing, quality
    red     = HexColor('#EF4444'),   # Errors, old-way, problems
    dark_bg = HexColor('#0F172A'),   # Technical diagrams
    dk2     = HexColor('#111827'),   # Cartoon diagrams (slightly lighter)
    card_bg = HexColor('#F8FAFC'),   # Card backgrounds
    dark2   = HexColor('#1E293B'),   # Secondary dark
    border  = HexColor('#E2E8F0'),   # Borders
    mid_gray= HexColor('#94A3B8'),   # Captions, metadata
    lt_gray = HexColor('#F1F5F9'),   # Alternating table rows
    text_dk = HexColor('#0F172A'),   # Headings
    text_bd = HexColor('#334155'),   # Body
    white   = colors.white,
)

# Colour-per-concept (always consistent):
# Blue   → Dev, code, Git     |  Teal   → Ops, cloud, infra
# Green  → Success, summary   |  Purple → CI/CD, automation
# Cyan   → Monitoring, data   |  Orange → Warnings, releases
# Red    → Errors, old way    |  Pink   → Testing, QA
```

---

## 5. PAGE LAYOUT

```
Page:     A4 (210×297mm)
Margins:  Left 25mm, Right 25mm, Top 22mm, Bottom 20mm

Header (content pages):
  • 3pt blue bar at top
  • Right: "DevOps 90-Day Training  •  Day NN  •  2026 Edition" (7pt gray)

Footer (content pages):
  • 18pt #F1F5F9 bar
  • Center: "Page N  •  Module Name  •  github.com/..." (7pt gray)

Cover Page:
  • Full bleed, separate PageTemplate, on_cover callback
  • Background: CHALK['board'] (#1a1a2e) — matches blackboard diagram style
  • Top: 4pt chapter-colour bar
  • Centre: Series title in yellow chalk (22pt Bold)
  • Below title: Module name in white chalk (14pt)
  • Below module: Day number + Edition year in cyan chalk (10pt)
  • Bottom-left: "By Aryashree Pritikrishna" in white chalk (9pt)
  • Bottom-right: GitHub URL in blue chalk (8pt)
  • Decorative: subtle chalk-dust doodles (gears, cloud, terminal icon) in #3a3a5a
```

---

## 6. CHAPTER TEMPLATE — 13 ELEMENTS (every chapter, exact order)

```
① Chapter Header Block
② Learning Objectives Box
③ Analogy Card
④ Did You Know — Stat Callout
⑤ Diagram (cartoon or technical)
⑥ Key Concepts (bullet-first story paragraphs)
⑦ Before / After Comparison Box
⑧ Table (tool/option comparison)
⑨ Real-World Example Box
⑩ Common Misconceptions Box
⑪ Try It Yourself Box
⑫ Quick Summary Box
⑬ Mini Quiz (3 questions)
```

---

## 7. CRITICAL RENDERING RULES — READ FIRST

### Rule A: ALWAYS use Paragraph objects inside boxes — NEVER canvas.drawString()

```python
# ❌ WRONG — text overflows AND <b> tags show literally:
c.drawString(16, y, f'• {item}')

# ✅ CORRECT — word-wraps, renders markup:
p = Paragraph(f'• {item}', style)
pw, ph = p.wrap(available_width, 9999)
p.drawOn(c, x, y)
```

### Rule B: Pre-calculate box height in wrap() using _ww() helper

```python
def _ww(text, width_pts, size=8.5):
    """Estimate wrapped height of text.

    Note: char-width factor 0.55 is calibrated for Helvetica Regular.
    For bold-heavy or mixed-weight text, use 0.60 for a safer estimate.
    For pixel-perfect accuracy, use pdfmetrics.stringWidth() instead.
    """
    import re
    clean = re.sub(r'<[^>]+>', '', str(text))
    chars = max(1, int(width_pts / (size * 0.55)))
    words = clean.split(); lines = 1; cur = 0
    for w in words:
        if cur + len(w) + 1 > chars: lines += 1; cur = len(w)
        else: cur += len(w) + 1
    return lines * (size + 4)

# Pattern for EVERY box class:
def wrap(self, aw, ah):
    self.w = aw                           # ALWAYS set self.w first
    iw = aw - 28                          # inner width
    h = 26                                # header height
    for item in self.items:
        h += _ww(item, iw, size=8.5) + 5 # content + gap
    self.h = max(46, h + 6)               # min height + padding
    return aw, self.h
```

### Rule C: Quiz options ALWAYS on separate lines

```python
# ❌ WRONG — clips at right edge:
opt_str = '    '.join([f'{k}) {v}' for k,v in opts.items()])
c.drawString(18, y, opt_str)

# ✅ CORRECT — each option its own Paragraph:
for k, v in opts.items():
    po = Paragraph(f'<b>{k})</b>  {v}', opt_st)
    _, poh = po.wrap(iw - 14, 9999)
    y -= poh; po.drawOn(c, 14, y); y -= 3
```

### Rule D: Never canvas.polygon() — use beginPath + drawPath

```python
# ❌ WRONG: canvas.polygon([...], fill=1, stroke=0)
# ✅ CORRECT:
p = c.beginPath()
p.moveTo(x1,y1); p.lineTo(x2,y2); p.lineTo(x3,y3); p.close()
c.drawPath(p, fill=1, stroke=0)
```

### Rule E: All Table cells must use Paragraph objects

```python
# ❌ WRONG: Table([['Cell text']])
# ✅ CORRECT: Table([[Paragraph('Cell text', style)]])
```

---

## 8. BOX SPECIFICATIONS

### ① Chapter Header
```
Background: #F8FAFC  |  Left accent: 6pt chapter-colour bar
Chapter pill: chapter colour bg, "CHAPTER NN" white 8pt Bold
Progress bar: gray base, coloured fill = (N/total) × width
Difficulty badge: Beginner=green, Intermediate=orange, Advanced=red
Duration badge: cyan, "⏱ N min read"
Title: 15pt Bold #0F172A
```

### ② Learning Objectives
```
Bg: #EFF6FF  |  Border: blue 1pt  |  Accent: 5pt blue
Icon: 🎯  LEARNING OBJECTIVES (8.5pt Bold blue)
Subtitle: "By the end of this chapter..." (8pt #1E3A8A)
Items: Paragraph "  ✦  {obj}" — 8.5pt, word-wrapped
Height: 36 + sum(_ww(obj, iw) + 4)
```

### ③ Analogy Card
```
Bg: #0F172A  |  Border: chapter-colour 1.5pt  |  Accent: 5pt chapter-colour
Icon: 💡  ANALOGY (8.5pt Bold chapter-colour)
Text: Paragraph, Helvetica-BoldOblique 10pt white, word-wrapped
Height: 30 + _ww(text, iw, size=10) + 4  (min 52)
```

### ④ Did You Know / Stat Callout
```
Bg: #0F172A  |  Border: chapter-colour 0.5pt
Header: ◆  DID YOU KNOW?  ◆ (7pt Bold gray, centred)
3 columns: big number (22pt Bold, accent colour) + Paragraph label (7pt gray)
Dividers: 0.5pt #1E293B vertical lines
Height: dynamic — 26 + max(_ww(label, col_width) for each stat) + 30  (min 80)
Note: use _ww() for stat labels — long labels will overflow at fixed 80pt
```

### ⑤ Diagram (Blackboard Style)
```
Bg: #1a1a2e (dark chalkboard)  |  Border: 2pt #4a4a6a (chalk-dust edge)
Inner frame: 1pt dashed #5a5a7a (chalk border effect)
Caption: Paragraph, 7.5pt italic #94A3B8, centred below diagram
Padding: 14pt all sides
Height: dynamic — diagram height + caption height + 36
Style: Blackboard explainer — see Section 9 for full spec
All text inside diagrams uses handwriting-style fonts (see Section 9)
```

### ⑥ Key Concepts
```
Bg: #F8FAFC  |  Border: chapter-colour 1pt  |  Accent: 5pt chapter-colour
Title: 📌  KEY CONCEPTS (chapter-colour Bold 8.5pt)
Items: Paragraph "• <b>Term</b> — explanation" — 8.5pt text_dk, word-wrapped
Sub-items: Paragraph "  ◦ sub-point" — 8pt text_bd, indented 14pt
Max indent depth: 2 levels
Height: 26 + sum(_ww(item, iw) + 5) + sum(_ww(sub, iw-14) + 4)
```

### ⑧ Table (Tool/Option Comparison)
```
Bg: white  |  Border: #E2E8F0 0.5pt grid
Header row: chapter-colour bg, white Bold 8pt Paragraph cells
Body rows: alternating white / #F1F5F9
All cells: Paragraph objects (NEVER plain strings) — 8pt text_bd
Cell padding: 6pt top/bottom, 8pt left/right
Column widths: auto-distribute across (page_width - margins)
Height: dynamic — header + sum(row heights from Paragraph.wrap())
```

### ⑦ Before / After Comparison
```
Bg: #FFF7ED  |  Border: orange 1pt
Left header: ❌ red pill  |  Right header: ✅ green pill
Items: Paragraph per bullet, left=#7F1D1D, right=#14532D
Height: 34 + max(left_col_h, right_col_h) + 8
```

### ⑨ Real-World Example
```
Bg: #F5F3FF  |  Border: purple 1pt  |  Accent: 5pt purple
Icon: 🏢  REAL-WORLD EXAMPLE (purple Bold 8.5pt)
Company badge: right-aligned purple pill
Sections: "Situation:" / "What they did:" / "Result:" — Paragraph #4C1D95 Bold
Bullets: Paragraph "• item" — text_dk 8.5pt, word-wrapped in (w-28)
Height: 34 + _ww(situation)+16 + Σ_ww(did)+14 + Σ_ww(result)+10
```

### ⑩ Common Misconceptions
```
Bg: #FEF3C7  |  Border: orange 1pt  |  Accent: 5pt orange
Title: ⚠  COMMON MISCONCEPTIONS (#78350F Bold 8.5pt)
Myth:    "❌  Myth:" Paragraph (red Bold) + myth text Paragraph (#7F1D1D)
Reality: "✅  Reality:" Paragraph (green Bold) + reality Paragraph (#14532D)
Height: 26 + per pair: 14+_ww(myth)+5+14+_ww(reality)+9
```

### ⑪ Try It Yourself
```
Bg: #F0FDF4  |  Border: green 1pt  |  Accent: 5pt green
Badge: green pill "▶  TRY IT YOURSELF" (white Bold 8pt)
Tasks: "N." (green Bold 9pt) + Paragraph task (8.5pt) — side by side
Height: 32 + sum(_ww(task, iw) + 6)
Free tools only. 3 tasks: Easy (5min), Medium (30min), Stretch (1hr)
```

### ⑫ Quick Summary ← MOST CRITICAL BOX
```
Bg: #ECFDF5  |  Border: green 1pt  |  Accent: 5pt green
Title: ✓  QUICK SUMMARY (#14532D Bold 8.5pt)
Items: Paragraph(f'• {item}', style) — RENDERS <b>bold</b> CORRECTLY
       Items contain "<b>Term:</b> description" — Paragraph handles markup
       NEVER use drawString() here — will show raw tags literally
Height: 22 + sum(_ww(item, iw) + 5)
```

### ⑬ Mini Quiz ← SECOND MOST CRITICAL BOX
```
Bg: #0F172A  |  Border: chapter-colour 1pt rounded
Title: ❓  MINI QUIZ — Test Your Understanding (chapter-colour 9pt Bold)
Per question:
  Q text:  Paragraph "Q{N}. {question}" — white Bold 9pt
  Options: ONE Paragraph PER OPTION — "<b>a)</b> text" gray 8.5pt
           NEVER all options on one line → clips right edge
  Answer:  Paragraph "✓ Answer: <b>{letter}</b> — {expl}" — green Bold
Height: 26 + per Q: _ww(q)+6 + Σ(_ww(v)+3 per opt) + _ww(ans)+10
```

---

## 9. DIAGRAM STYLE — BLACKBOARD EXPLAINER

All diagrams use a **Blackboard Explainer Illustration** style:
- Dark chalkboard background with chalk-dust texture
- Handwritten-style text (doodle lettering)
- Colorful chalk marker accents (neon-on-dark effect)
- Doodle/sketch-style shapes (wobbly borders, hand-drawn arrows)
- Educational infographic layout (labelled, captioned, annotated)

### 9.1 Chalkboard Colours

```python
CHALK = dict(
    board      = HexColor('#1a1a2e'),   # Deep dark board
    board_edge = HexColor('#4a4a6a'),   # Chalk-dust frame border
    dust       = HexColor('#3a3a5a'),   # Subtle grid/texture lines
    white_chalk= HexColor('#E8E8E8'),   # Slightly off-white (realistic chalk)
    yellow     = HexColor('#FFD93D'),   # Yellow chalk marker
    pink       = HexColor('#FF6B9D'),   # Pink chalk marker
    cyan       = HexColor('#4ECDC4'),   # Cyan/teal chalk marker
    orange     = HexColor('#FF8C42'),   # Orange chalk marker
    green      = HexColor('#95E06C'),   # Green chalk marker
    purple     = HexColor('#B388FF'),   # Purple chalk marker
    blue       = HexColor('#64B5F6'),   # Blue chalk marker
    red        = HexColor('#FF5252'),   # Red chalk marker
)

# Chalk marker assignments (consistent across all diagrams):
# Yellow   → titles, key terms, emphasis
# Cyan     → DevOps/monitoring nodes
# Green    → success, ops, cloud, right-way
# Pink     → testing, QA, highlights
# Orange   → warnings, release stages
# Purple   → CI/CD, automation, pipelines
# Blue     → dev, code, primary flow
# Red      → errors, old-way, problems
```

### 9.2 Chalkboard Background

```python
def _chalkboard_bg(c, x, y, w, h):
    """Draw the blackboard background with chalk-dust frame."""
    # Board fill
    c.setFillColor(CHALK['board'])
    c.roundRect(x, y, w, h, 10, fill=1, stroke=0)
    # Chalk-dust frame (double border for realism)
    c.setStrokeColor(CHALK['board_edge']); c.setLineWidth(2.5)
    c.roundRect(x+2, y+2, w-4, h-4, 8, fill=0, stroke=1)
    c.setStrokeColor(CHALK['dust']); c.setLineWidth(0.5)
    c.roundRect(x+6, y+6, w-12, h-12, 6, fill=0, stroke=1)
    # Optional: subtle horizontal ruled lines (like a real board)
    c.setStrokeColor(Color(0.3, 0.3, 0.45, 0.15)); c.setLineWidth(0.3)
    for ly in range(int(y+20), int(y+h-10), 24):
        c.line(x+10, ly, x+w-10, ly)
```

### 9.3 Doodle Shapes (Sketch-Style)

```python
def _doodle_rect(c, x, y, w, h, chalk_col, fill_alpha=0.15):
    """Hand-drawn rectangle with wobbly edges."""
    import random
    jitter = lambda: random.uniform(-1.2, 1.2)
    # Filled background (translucent chalk wash)
    c.setFillColor(Color(chalk_col.red, chalk_col.green, chalk_col.blue, fill_alpha))
    c.roundRect(x, y, w, h, 6, fill=1, stroke=0)
    # Wobbly chalk border
    c.setStrokeColor(chalk_col); c.setLineWidth(1.8)
    p = c.beginPath()
    p.moveTo(x+jitter(), y+jitter())
    p.lineTo(x+w+jitter(), y+jitter())
    p.lineTo(x+w+jitter(), y+h+jitter())
    p.lineTo(x+jitter(), y+h+jitter())
    p.close()
    c.drawPath(p, fill=0, stroke=1)

def _doodle_arrow(c, x1, y1, x2, y2, chalk_col):
    """Hand-drawn arrow with chalk marker look."""
    import random, math
    jitter = lambda: random.uniform(-0.8, 0.8)
    c.setStrokeColor(chalk_col); c.setLineWidth(2)
    # Slightly wobbly line
    mx, my = (x1+x2)/2 + random.uniform(-2,2), (y1+y2)/2 + random.uniform(-2,2)
    p = c.beginPath()
    p.moveTo(x1+jitter(), y1+jitter())
    p.lineTo(mx, my)
    p.lineTo(x2+jitter(), y2+jitter())
    c.drawPath(p, fill=0, stroke=1)
    # Arrowhead
    angle = math.atan2(y2-my, x2-mx)
    al = 8
    p2 = c.beginPath()
    p2.moveTo(x2, y2)
    p2.lineTo(x2 - al*math.cos(angle-0.4), y2 - al*math.sin(angle-0.4))
    p2.moveTo(x2, y2)
    p2.lineTo(x2 - al*math.cos(angle+0.4), y2 - al*math.sin(angle+0.4))
    c.drawPath(p2, fill=0, stroke=1)

def _chalk_circle(c, cx, cy, r, chalk_col, fill_alpha=0.2):
    """Hand-drawn circle with chalk fill."""
    c.setFillColor(Color(chalk_col.red, chalk_col.green, chalk_col.blue, fill_alpha))
    c.circle(cx, cy, r, fill=1, stroke=0)
    c.setStrokeColor(chalk_col); c.setLineWidth(1.8)
    c.circle(cx, cy, r, fill=0, stroke=1)
```

### 9.4 Handwritten Chalk Text

All text inside diagrams MUST use a handwriting-style font to achieve the
authentic blackboard explainer look. Helvetica is the fallback ONLY if
handwriting fonts are unavailable.

**Font priority (highest → lowest):**

| Priority | Font Name | Source | Style |
|----------|-----------|--------|-------|
| 1 | Patrick Hand | Google Fonts (OFL, free) | Casual handwriting, ideal for chalk |
| 2 | Caveat | Google Fonts (OFL, free) | Flowing cursive handwriting |
| 3 | Comic Neue | Google Fonts (OFL, free) | Clean hand-lettered feel |
| 4 | Helvetica-Bold | ReportLab built-in | Fallback only — NOT handwritten |

```python
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.pdfbase import pdfmetrics
import os

# --- Font Registration (run once at PDF init) ---
FONT_DIR = os.path.join(os.path.dirname(__file__), 'fonts')
_HAND_FONT = 'Helvetica-Bold'   # fallback
_HAND_FONT_REG = 'Helvetica'    # fallback regular

for name, filename in [
    ('PatrickHand',    'PatrickHand-Regular.ttf'),
    ('Caveat',         'Caveat-Regular.ttf'),
    ('Caveat-Bold',    'Caveat-Bold.ttf'),
    ('ComicNeue',      'ComicNeue-Regular.ttf'),
    ('ComicNeue-Bold', 'ComicNeue-Bold.ttf'),
]:
    path = os.path.join(FONT_DIR, filename)
    if os.path.exists(path):
        pdfmetrics.registerFont(TTFont(name, path))

# Set the best available handwriting font
if 'PatrickHand' in pdfmetrics.getRegisteredFontNames():
    _HAND_FONT = 'PatrickHand'
    _HAND_FONT_REG = 'PatrickHand'
elif 'Caveat-Bold' in pdfmetrics.getRegisteredFontNames():
    _HAND_FONT = 'Caveat-Bold'
    _HAND_FONT_REG = 'Caveat'
elif 'ComicNeue-Bold' in pdfmetrics.getRegisteredFontNames():
    _HAND_FONT = 'ComicNeue-Bold'
    _HAND_FONT_REG = 'ComicNeue'

# --- Chalk Text Helpers ---
def _chalk_text(c, x, y, text, chalk_col, size=9, bold=True):
    """Draw handwritten chalk text on blackboard."""
    font = _HAND_FONT if bold else _HAND_FONT_REG
    c.setFillColor(chalk_col)
    c.setFont(font, size)
    c.drawString(x, y, text)

def _chalk_text_centred(c, x, y, text, chalk_col, size=9, bold=True):
    """Draw centred handwritten chalk text."""
    font = _HAND_FONT if bold else _HAND_FONT_REG
    c.setFillColor(chalk_col)
    c.setFont(font, size)
    c.drawCentredString(x, y, text)
```

**Font download instructions** (one-time setup):
```bash
mkdir -p fonts
# Patrick Hand (recommended — best chalk feel)
curl -L -o fonts/PatrickHand-Regular.ttf \
  "https://github.com/google/fonts/raw/main/ofl/patrickhand/PatrickHand-Regular.ttf"
# Caveat (alternative — flowing cursive)
curl -L -o fonts/Caveat-Regular.ttf \
  "https://github.com/google/fonts/raw/main/ofl/caveat/Caveat%5Bwght%5D.ttf"
```

### 9.5 Educational Infographic Annotations

Blackboard explainer diagrams are educational infographics — they MUST include
annotations, callouts, and visual markers that guide the learner's eye.

```
Annotation elements (use in every diagram):

① Numbered chalk circles — step indicators
   • Yellow chalk circle (r=10) + white number inside
   • Use for sequential flows (pipelines, lifecycles)

② Callout arrows with labels — point to key parts
   • Doodle arrow (_doodle_arrow) + chalk text label beside it
   • Arrow colour matches the concept colour (blue=dev, green=ops, etc.)

③ Underline emphasis — highlight key terms
   • Wavy chalk underline below important words
   • Use chapter accent colour, lineWidth=1.5
   • Draw with bezier curve for hand-drawn feel:
     c.bezier(x, y-2, x+w*0.3, y-4, x+w*0.7, y, x+w, y-2)

④ Bracket grouping — group related items
   • Curly brace drawn with bezier curves in chalk colour
   • Label outside the brace in smaller text

⑤ Comparison markers — for before/after diagrams
   • Red "X" doodle (two crossed lines) for old/wrong way
   • Green checkmark doodle (two lines forming ✓) for new/right way
   • Both drawn with chalk strokes, not Unicode characters

⑥ Legend / Key box — bottom-right corner of diagram
   • Small doodle rect with colour swatches + labels
   • "KEY:" title in yellow chalk
   • Each entry: colour dot + white chalk label
```

```python
def _chalk_number(c, cx, cy, num, chalk_col=None):
    """Numbered step circle — educational marker."""
    col = chalk_col or CHALK['yellow']
    _chalk_circle(c, cx, cy, 10, col, fill_alpha=0.3)
    _chalk_text_centred(c, cx, cy-3, str(num), CHALK['white_chalk'], size=9)

def _chalk_underline(c, x, y, w, chalk_col):
    """Wavy hand-drawn underline for emphasis."""
    c.setStrokeColor(chalk_col); c.setLineWidth(1.5)
    c.bezier(x, y-2, x+w*0.25, y-5, x+w*0.75, y+1, x+w, y-2)

def _chalk_checkmark(c, x, y, size=12):
    """Green chalk checkmark doodle."""
    c.setStrokeColor(CHALK['green']); c.setLineWidth(2.5)
    p = c.beginPath()
    p.moveTo(x, y+size*0.4); p.lineTo(x+size*0.35, y); p.lineTo(x+size, y+size)
    c.drawPath(p, fill=0, stroke=1)

def _chalk_crossmark(c, x, y, size=10):
    """Red chalk X doodle."""
    c.setStrokeColor(CHALK['red']); c.setLineWidth(2.5)
    c.line(x, y, x+size, y+size)
    c.line(x+size, y, x, y+size)
```

### 9.5 Stick Figure (Chalk Doodle Version)

```python
def _stick(c, x, y, chalk_col, label='Dev', hat=False):
    """Chalk-style stick figure on blackboard."""
    # Head (yellow chalk circle)
    _chalk_circle(c, x, y+34, 9, CHALK['yellow'], fill_alpha=0.25)
    # Eyes (white chalk dots)
    c.setFillColor(CHALK['white_chalk'])
    c.circle(x-3, y+36, 1.5, fill=1, stroke=0)
    c.circle(x+3, y+36, 1.5, fill=1, stroke=0)
    # Smile arc
    c.setStrokeColor(CHALK['white_chalk']); c.setLineWidth(1)
    c.arc(x-4, y+28, x+4, y+34, 0, 180)
    # Optional hat (chalk filled)
    if hat:
        c.setFillColor(Color(chalk_col.red, chalk_col.green, chalk_col.blue, 0.4))
        c.roundRect(x-12, y+40, 24, 8, 3, fill=1, stroke=0)
        c.setStrokeColor(chalk_col); c.setLineWidth(1.2)
        c.roundRect(x-12, y+40, 24, 8, 3, fill=0, stroke=1)
    # Body (chalk strokes)
    c.setStrokeColor(chalk_col); c.setLineWidth(2)
    c.line(x, y+25, x, y+8)                                      # torso
    c.line(x, y+22, x-14, y+14); c.line(x, y+22, x+14, y+14)    # arms
    c.line(x, y+8, x-8, y-4); c.line(x, y+8, x+8, y-4)          # legs
    # Label
    _chalk_text_centred(c, x, y-14, label, CHALK['white_chalk'], size=6.5)
```

### 9.6 Speech Bubble (Chalk Version)

```python
def _speech_bubble(c, bx, by, bw, bh, lines, chalk_col, tail='left'):
    """Chalk-style speech bubble on blackboard."""
    # Bubble fill (translucent chalk wash)
    c.setFillColor(Color(chalk_col.red, chalk_col.green, chalk_col.blue, 0.12))
    c.roundRect(bx, by, bw, bh, 10, fill=1, stroke=0)
    # Chalk border
    c.setStrokeColor(chalk_col); c.setLineWidth(1.5)
    c.roundRect(bx, by, bw, bh, 10, fill=0, stroke=1)
    # Tail (chalk triangle)
    p = c.beginPath()
    if tail == 'left':
        p.moveTo(bx+8, by); p.lineTo(bx-10, by-12); p.lineTo(bx+22, by)
    else:
        p.moveTo(bx+bw-8, by); p.lineTo(bx+bw+10, by-12); p.lineTo(bx+bw-22, by)
    p.close()
    c.setFillColor(Color(chalk_col.red, chalk_col.green, chalk_col.blue, 0.12))
    c.drawPath(p, fill=1, stroke=0)
    c.setStrokeColor(chalk_col); c.drawPath(p, fill=0, stroke=1)
    # Text (white chalk)
    c.setFillColor(CHALK['white_chalk']); c.setFont('Helvetica-Bold', 6.5)
    for i, line in enumerate(lines):
        c.drawCentredString(bx+bw/2, by+bh-10-i*10, line)
```

### 9.7 Diagram Assignment (all 14 chapters)

```
Ch 1  Dev vs Ops             → blackboard: 2 panels + stick figures (Dev/Ops) + wall + speech bubbles
Ch 2  Traditional IT         → blackboard: waterfall staircase descending, chalk arrows, red X marks at bottlenecks
Ch 3  What is DevOps         → blackboard: infinity loop (8 nodes), cyan/green chalk markers, doodle connectors
Ch 4  CALMS Framework        → blackboard: 5 chalk circles in a row, each letter in yellow, descriptions below
Ch 5  DevOps Lifecycle       → blackboard: 8-node circular loop, colour-coded by stage, doodle arrows
Ch 6  CI/CD Pipeline         → blackboard: horizontal pipeline boxes with chalk arrows + boundary line (CI|CD)
Ch 7  IaC & Automation       → blackboard: left=manual (red, stick figure sweating), right=IaC (green, code file icon)
Ch 8  Cloud Computing        → blackboard: cloud doodle shape with services inside (compute/storage/network icons)
Ch 9  Why Cloud              → blackboard: split panel — left=on-prem rack (red), right=cloud (green), comparison arrows
Ch 10 IaaS/PaaS/SaaS         → blackboard: 3-column responsibility stack, chalk-coloured layers, pizza analogy icons
Ch 11 Cloud Deployment       → blackboard: 4 quadrant grid — Public/Private/Hybrid/Multi-cloud with doodle icons
Ch 12 DevOps + Cloud         → blackboard: merged flow — code → cloud CI → container → K8s → monitor, all chalk
Ch 13 Real Workflow          → blackboard: full pipeline (7+ nodes), canary bird doodle, rollback arrow in red
Ch 14 Career Path            → blackboard: staircase with 4 steps ascending, stick figure climbing, cert badges
```

---

## 10. FONT & EMOJI SAFETY

```
ReportLab's built-in Helvetica lacks many Unicode glyphs.

Safe to use directly:
  • Basic arrows: →, ←, ↑, ↓
  • Bullets: •, ◦, ▸, ▹, ✦, ◆
  • Check/cross: ✓, ✗, ☐, ☑
  • Common symbols: ©, ®, ™, °, ±, ×, ÷

NOT safe (will render as missing glyph boxes):
  • Emoji: 🎯 🏢 💡 📌 ❓ ⚠ ▶ ⏱ 🔄 ⏳ 🧪 📋 📦 📊 🚀 ⚙️ 🔨 💻
  • Complex Unicode: ① ② ③ etc.

Workaround for emoji in PDF:
  Option A: Register a TTF with emoji support (e.g., NotoEmoji)
  Option B: Replace emoji with text labels — e.g., [TARGET] instead of 🎯
  Option C: Draw emoji as simple doodle icons programmatically on the canvas
  Recommended: Option C (matches blackboard style — draw chalk doodle icons)

Note: Emoji in this SKILL.md are for human readability only.
The PDF generator should map them to doodle icons or text labels.
```

---

## 11. CONTENT RULES

```
✓ BULLETS ONLY: no paragraph blocks — every explanation in bullet points
✓ BOLD TERMS:   <b>first 2-3 words</b> of every bullet inline
✓ ONE IDEA:     one concept per bullet, max 2 sub-levels
✓ DEFINE ONCE:  every acronym defined on first use
✓ REAL NUMBERS: actual stats, versions, company names
✓ EXAMPLES:     every chapter needs a real company example
✓ ACTIVE VOICE: "Terraform provisions" not "Servers are provisioned"

✗ No paragraph blocks before bullets
✗ No unexplained acronyms
✗ No vague claims ("makes things better")
✗ No visible HTML tags in output (use Paragraph, not drawString)
```

---

## 12. MODULE REGISTRY

```
Day 01  Module 1: Introduction to DevOps, Cloud & SRE
        Chapters: 14
        Topics:  Dev vs Ops, Traditional IT Problems, What is DevOps,
                 CALMS, Lifecycle, CI/CD, IaC, Cloud Computing, Why Cloud,
                 IaaS/PaaS/SaaS, Cloud Deployment, DevOps+Cloud,
                 Real Workflow, Career Path
        Pages:   ~55
        Status:  ✅ Complete

[Template — add after each session:]
Day NN  Module X: [Name]
        Chapters: [count]
        Topics:  [comma-separated list]
        Pages:   ~[estimate: chapters × 4]
        Status:  [✅ Complete / 🔄 In Progress / ⏳ Pending]

Cumulative chapter numbering:
  Module 1 = Ch 1–14  |  Module 2 = Ch 15–NN  |  etc.
```

---

## 13. SESSION INVOCATION

```
I just completed a DevOps training session.
Use the devops-90days-training skill.

Day number:    [e.g., Day 02]
Module:        [e.g., Module 2: Linux & Scripting]
Chapter title: [e.g., Linux Commands & File System]
Difficulty:    [Beginner / Intermediate / Advanced]

Content: [paste notes OR upload document]

Special instructions (optional):
  [e.g., "use cartoon style from reference image for diagrams"]
  [e.g., "add extra hands-on tasks"]
```

---

## 14. KNOWN BUGS FIXED (v2 → v4)

| Bug | Root Cause | Fix |
|-----|------------|-----|
| `<b>Term:</b>` shows literally in Quick Summary | `drawString()` treats HTML as plain text | All box content uses `Paragraph` objects |
| Text overflow outside box borders | `drawString()` never wraps | `Paragraph.wrap()` + `drawOn()` everywhere |
| Quiz options clipped at right edge | All 4 options on one long line | Each option = separate `Paragraph` on own line |
| Box height too small, content cut off | Fixed `h` values | `_ww()` helper pre-calculates wrapped height |
| Glossary LayoutError (page overflow) | Two-column Table 1200pt tall | Per-term rows with natural page-breaking |
| Diagrams generic/flat | No cartoon personality | Dark bg + stick figures + speech bubbles + sketch borders |
| Missing box specs ⑤⑥⑧ | Specs jumped from ④ to ⑦ | Added Diagram, Key Concepts, Table specs (v4) |
| Stat Callout overflow | Fixed height 80pt | Dynamic height using _ww() for stat labels (v4) |
| 7 of 14 diagram assignments | Incomplete mapping | All 14 chapters mapped to blackboard diagram type (v4) |
| Hardcoded output path | `/mnt/user-data/outputs/` only works in cloud | Project-relative path `content/day-{NN}/...` (v4) |
| No cover page spec | Only mentioned, no visual details | Full cover spec with blackboard style (v4) |
| Emoji rendering in PDF | ReportLab Helvetica lacks emoji glyphs | Font safety guide + chalk doodle icon workaround (v4) |
| Repo URL missing protocol | `github.com/...` not a valid URL | Added `https://` prefix (v4) |

---

## 15. QUALITY CHECKLIST

```
Content:
  ☐ All paragraphs → bullet format
  ☐ <b>First words</b> bolded in every bullet
  ☐ Every acronym defined on first use
  ☐ Real examples with numbers

Boxes (all present, no overflow):
  ☐ Learning Objectives — word-wrapped
  ☐ Did You Know — 3 stats, Paragraph labels
  ☐ Analogy Card — word-wrapped
  ☐ Diagram + caption
  ☐ Key Concepts — bullets + sub-bullets
  ☐ Before/After — both columns word-wrapped
  ☐ Table — alternating rows, Paragraph cells
  ☐ Real-World Example — all sections wrapped
  ☐ Misconceptions — myth + reality wrapped
  ☐ Try It Yourself — 3 tasks, wrapped
  ☐ Quick Summary — <b>tags rendered as BOLD (not literal)
  ☐ Mini Quiz — options on SEPARATE LINES (not one line)

Design:
  ☐ Chapter progress bar N/total correct
  ☐ Difficulty badge present
  ☐ All diagrams use blackboard style (dark bg #1a1a2e, chalk-dust frame)
  ☐ Diagram text uses HANDWRITING font (Patrick Hand > Caveat > Comic Neue > Helvetica fallback)
  ☐ Diagram shapes use doodle/sketch borders (wobbly lines, chalk markers)
  ☐ Diagram text uses chalk-style colours (yellow titles, white body)
  ☐ Stick figures use chalk doodle version (_stick with CHALK colours)
  ☐ Educational annotations present: numbered circles, callout arrows, underlines
  ☐ Comparison diagrams have chalk checkmark/crossmark doodles (not Unicode)
  ☐ All diagrams have captions (7.5pt italic, centred below)
  ☐ Header/footer on content pages
  ☐ Cover page: blackboard bg, chalk text, author + GitHub URL

Technical:
  ☐ No canvas.polygon() — use beginPath/drawPath
  ☐ No drawString() for box content — use Paragraph
  ☐ No Unicode sub/superscripts — use <sub>/<super>
  ☐ All wrap() sets self.w = aw first
  ☐ All Table cells use Paragraph
  ☐ Output to project-relative path: content/day-{NN}/module-{N}-{slug}/
  ☐ PDF builds without LayoutError
  ☐ No raw HTML tags visible in rendered PDF
```

---

*SKILL.md v4.0 — 2026-05-19 — Blackboard explainer style, missing box specs, complete diagram assignments, font safety, cover spec*
*Author: Aryashree Pritikrishna — https://github.com/aryashreep/learn-devops-in-90-days*
