# LoomTracker

> **Mission:** Transforming financial chaos into a structured, automated ledger through AI orchestration.

LoomTracker is a sleek, AI-powered financial orchestration dashboard. It is designed to act as the "loom" for your personal finances—weaving unstructured data (statements, receipts, and manual entries) into a clean, actionable business asset.

## Features

* **Vibe-Coded UI:** A high-performance, dark-mode dashboard built with pure Vanilla JS and CSS—no heavy frameworks, just clean code.
* **AI Budget Coach:** A conversational interface that "reads" your real-time spending data to provide personalized savings advice and trend analysis.
* **Intelligent Extraction:** Drag-and-drop support for bank statements (PDF, Image, CSV). The system uses LLM vision to extract, categorize, and structure your transactions automatically.
* **Dynamic Analytics:**
    * **Budget Scoring:** Real-time feedback on your financial health.
    * **Custom SVG Visuals:** Interactive donut charts and progress bars generated on-the-fly without external libraries.
* **Savings Orchestration:** Visual tracking for sinking funds and goal-based accounts with detailed contribution histories.
* **Professional Reporting:** One-click PDF export for clean, printable monthly financial summaries.

## Tech Stack

* **Frontend:** HTML5, CSS3, JavaScript (ES6+)
* **Visuals:** Custom Inline SVG Orchestration
* **AI Integration:** Anthropic API (Claude 3.5 Sonnet)
* **Target Backend:** Designed for n8n webhooks and Supabase storage.

## Quick Start

LoomTracker is currently built as a single-file, portable web application.

1. **Clone the repo:**
   ```bash
   git clone https://github.com/billbotprocessing-star/loom-tracker.git
   cd loom-tracker
   ```
2. **Run it locally:**
   Open `index.html` in any modern browser. No `npm install` or build steps required.
3. **Live demo (GitHub Pages):**
   https://billbotprocessing-star.github.io/loom-tracker/
4. **Configure backends:**
   Replace the `SUPABASE_URL` / `SUPABASE_KEY` placeholders in `index.html` with your project values before signing in. For AI Coach / document upload, provide an Anthropic API key through a **secure backend** (see [SECURITY.md](SECURITY.md)) — do not embed production API keys in client-side HTML.

## Roadmap: From Chaos to Order

This project is evolving from a client-side prototype into a fully automated financial engine:

- [x] **Phase 1:** UI/UX Vibe & Logic (Current)
- [ ] **Phase 2:** Persistence. Decouple the hardcoded state and integrate with **Supabase** for real-time cloud storage.
- [ ] **Phase 3:** Automated Weaving. Route the "Upload" zone to an **n8n** webhook to handle secure API orchestration and automatic ledger updates.
- [ ] **Phase 4:** Componentization. Refactor the single-file build into modular JS components as the feature set expands.

## License

MIT - Feel free to use and adapt this for your own financial transformations.
