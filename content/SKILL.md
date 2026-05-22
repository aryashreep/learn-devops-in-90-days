---
name: devops-90days-training
description: >
  Use this skill to generate visually stunning, professional-grade HTML
  training modules for the DevOps 90-Day series. Trigger using:
  "Generate Day {NN} chapter on {Topic Name}". Generates "Blackboard Pro
  Edition" chapters with Golu & Ladoo characters, Hinglish tone, and
  full 11-element pedagogy. Fully optimized for PDF export (Cmd+P).
author: Aryashree Pritikrishna
repo: https://github.com/aryashreep/learn-devops-in-90-days
version: 6.0
edition: 2026
updated: 2026-05-22
---

# DevOps 90-Day Training — Generation Skill v6.0 (Blackboard Pro Edition)

---

## 1. IDENTITY & BRANDING (HEADER SPEC)

Every file MUST start with the Branded Author Header:
- **Author:** Aryashree Pritikrishna
- **Tagline:** DevOps & Cloud Training Series • 2026 Edition
- **GitHub:** https://github.com/aryashreep/learn-devops-in-90-days
- **LinkedIn:** https://www.linkedin.com/in/aryashreepritikrishna/
- **YouTube:** https://www.youtube.com/@aryashreepritikrishna
- **Email:** aryashreep@gmail.com
- **Phone:** +91 8147450705

---

## 2. THE CAST (DOODLE CHARACTERS)

- **Golu (The Learner):** Human stick-figure with a hand-drawn smile. Uses White chalk.
- **Ladoo (The Mentor):** Robot agent with antenna, glowing eyes, and a green bag. Uses Blue/Green chalk.
- **Dialogue:** Use conversational Hinglish (e.g., "Bhai, ye error kyu aa raha hai?") between characters to explain complex points.

---

## 3. PEDAGOGICAL STRUCTURE (THE 11 ELEMENTS)

Generate content strictly in this sequence:
1.  **LEARNING OBJECTIVES:** Goal setting + "Kyu Seekhein?" (Stake-setting).
2.  **ANALOGY:** Real-world Hinglish mental model using Golu & Ladoo.
3.  **DID YOU KNOW?:** 3-column fast facts/stats.
4.  **Key Directories — What Lives Where:** Technical context with Micro-Doodles (House, Gear, etc.).
5.  **Key Concepts:** Deep technical breakdown with diagrams/anatomy.
6.  **Compare (What can go wrong):** Split-screen "VS" layout (Dangerous vs. Secure).
7.  **REAL-WORLD EXAMPLE:** Story-based troubleshooting scenario (e.g., Nginx errors).
8.  **COMMON MISCONCEPTIONS:** "Myth vs Reality" list.
9.  **TRY IT YOURSELF:** Hands-on terminal tasks.
10. **QUICK SUMMARY:** High-level bullet-first recap.
11. **MINI QUIZ:** 7-question knowledge check + PDF-friendly Footer Answer Key.

---

## 4. DESIGN SYSTEM (CSS SPEC)

```css
:root {
    --bg-blackboard: #0a0e14;   /* Darkest Slate */
    --chalk-white:   #f1f2f6;   /* Body */
    --chalk-yellow:  #feca57;   /* Titles/Golu name */
    --chalk-blue:    #48dbfb;   /* Tech/Mentor */
    --chalk-green:   #1dd1a1;   /* Success/Ops */
    --chalk-red:     #ff6b6b;   /* Errors/Danger */
    --wood-frame:    #2f3542;
}
```
- **Fonts:** 'Architects Daughter' (Handwritten), 'Inter' (Body), 'Fira Code' (Technical).
- **PDF Fix:** Always include `-webkit-print-color-adjust: exact !important;`.

---

## 5. CONTENT RULES

✓ **HINGLISH FIRST**: Use engaging, conversational language.
✓ **BULLETS ONLY**: No long paragraphs.
✓ **PDF OPTIMIZED**: No hovers; use static answer keys.
✓ **VERIFIED CONTENT**: Cross-reference with `Linux_Foundations.pdf` for accuracy.

---

*SKILL.md v6.0 — The "Golu & Ladoo" Pro Standard*
