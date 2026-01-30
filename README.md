# Culture Compass

**Collaborative Sensemaking — With Receipts**

Culture Compass is a real-time collaborative research platform where teams of experts can investigate complex topics together, map contradictions across perspectives, and generate evidence-based briefs with full citations.

---

## The Problem

In an age of information overload and polarized discourse, understanding complex topics requires synthesizing multiple perspectives. Traditional research tools are either:
- **Solo experiences** — No collaboration, no shared context
- **Summary-focused** — Lose the nuance and sources
- **Opinion-based** — No accountability for claims

## Our Solution

Culture Compass creates **Research Rooms** where 2-3 researchers can:

1. **Add Sources Together** — URLs are parsed for metadata, tagged by region/discipline/stance
2. **Extract Claims with Receipts** — Every claim links to its exact quote from the source
3. **Map Contradictions** — When sources disagree, mark the type of disagreement (geography, methodology, values, etc.)
4. **Challenge Claims** — AI suggests counter-sources from Crossref and arXiv
5. **Generate Briefs** — One-click AI synthesis with full citations
6. **Publish Reports** — Beautiful public pages with 3D globe visualization

All in **real-time** — your teammates see every action instantly.

---

## Key Features

### Real-Time Collaboration
- Live presence indicators showing who's online
- Instant sync when teammates add sources, claims, or contradictions
- Activity status ("Alice is reading Source #3")

### Receipts-First Design
Every claim must include the exact quote from the source. No unsourced assertions. This creates accountability and makes verification easy.

### Diversity Meter
Visual breakdown of your research coverage:
- **Regions**: US, EU, Asia, Other
- **Disciplines**: Economics, Policy, Culture, Tech
- **Stances**: Support, Critique, Neutral

### Challenge This Claim
Select any claim and get AI-powered counter-source suggestions from academic databases (Crossref, arXiv). One-tap to add as a new source.

### Morning Brief
AI-generated summary of your research with proper citations. Export or share with your team.

### Public Reports
Publish your research room as a beautiful web page featuring:
- Executive brief with citations
- Source list with metadata
- Claim cards with receipts
- Contradiction map
- 3D globe showing geographic diversity

---

## Tech Stack

### Backend
- **Serverpod 2.9** — Dart backend framework with real-time streaming
- **PostgreSQL** — Persistent storage for rooms, sources, claims
- **Redis** — Real-time presence and event broadcasting

### Frontend
- **Flutter** — Cross-platform app (Web, iOS, Android, Desktop)
- **Riverpod** — State management
- **Go Router** — Navigation
- **Google Fonts** — Fraunces (headlines) + Inter (body)

### Web Report
- **Vite** — Fast build tooling
- **Three.js + globe.gl** — 3D globe visualization
- **TypeScript** — Type-safe frontend

### AI Integration
- **Groq API** — Fast LLM inference for brief generation
- **Crossref API** — Academic paper search
- **arXiv API** — Preprint search

---

## Project Structure

```
culture_compass/
├── culture_compass_server/     # Serverpod backend
│   ├── lib/src/
│   │   ├── endpoints/          # API endpoints
│   │   ├── protocol/           # Data models (YAML)
│   │   ├── services/           # Business logic
│   │   └── web/routes/         # Web server routes
│   └── web/app/                # Built web report assets
│
├── culture_compass_flutter/    # Flutter app
│   ├── lib/
│   │   ├── core/               # Theme, providers, routing
│   │   └── features/           # Screens (auth, rooms, splash)
│   └── pubspec.yaml
│
├── culture_compass_client/     # Generated Serverpod client
│
└── webui/                      # Vite + Three.js web report
    ├── src/
    │   ├── main.ts
    │   ├── globe.ts
    │   └── report.ts
    └── package.json
```

---

## Getting Started

### Prerequisites
- Flutter 3.24+
- Dart 3.5+
- Docker (for local PostgreSQL)
- Node.js 18+ (for web report)

### Local Development

1. **Clone the repository**
```bash
git clone https://github.com/BhavyaAk25/Culture-Compass-.git
cd Culture-Compass-
```

2. **Start the database**
```bash
cd culture_compass_server
docker compose up -d
```

3. **Generate Serverpod code**
```bash
serverpod generate
```

4. **Run the server**
```bash
dart run bin/main.dart --apply-migrations
```

5. **Run the Flutter app** (new terminal)
```bash
cd ../culture_compass_flutter
flutter run -d chrome
```

6. **Build web report** (optional)
```bash
cd ../webui
npm install
npm run build
```

---

## Deployment (Serverpod Cloud)

This project is set up to host **everything** on Serverpod Cloud:
- Flutter web app served at `/app/`
- Public report served at `/report/<slug>`

### One-time setup
```bash
dart pub global activate serverpod_cloud_cli
scloud auth login
```

### Deploy
```bash
cd culture_compass_server
scloud deploy
```

`scloud deploy` runs a pre-deploy script that builds:
- `webui` → `culture_compass_server/web/app/`
- Flutter web (`--base-href /app/`) → `culture_compass_server/web/flutter/app/`

### Live URLs
- App: `https://culturecompass.serverpod.space/app/` (and `/` redirects here)
- Report: `https://culturecompass.serverpod.space/report/<slug>`
- API: `https://culturecompass.api.serverpod.space/`

### Environment Variables

Create `config/passwords.yaml` in the server directory:
```yaml
shared:
  groqApiKey: "your-groq-api-key"
```

---

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `auth.signIn` | POST | Create/get user profile |
| `room.createRoom` | POST | Create new research room |
| `room.joinByCode` | POST | Join room with invite code |
| `room.listUserRooms` | GET | List user's rooms |
| `room.publishRoom` | POST | Generate public report URL |
| `source.addSource` | POST | Add source with metadata extraction |
| `source.listSources` | GET | List room sources |
| `source.streamRoomEvents` | STREAM | Real-time room updates |
| `claim.addClaim` | POST | Create claim with quote |
| `claim.listClaims` | GET | List room claims |
| `contradiction.addContradiction` | POST | Link contradicting claims |
| `brief.generateBrief` | POST | AI-generate summary |
| `suggest.suggestForClaim` | GET | Get counter-source suggestions |
| `presence.streamPresence` | STREAM | Real-time presence updates |

---

## Design Philosophy

### "Cozy Library" Aesthetic
- Warm parchment backgrounds
- Walnut wood accents
- Brass highlights
- Elegant serif typography for headlines
- Clean sans-serif for body text

### Receipts Over Opinions
Every claim requires a direct quote from the source. This:
- Prevents misrepresentation
- Makes fact-checking easy
- Creates accountability
- Preserves context

### Contradictions Are Features
Disagreement between sources isn't a bug — it's valuable information. Culture Compass helps you:
- Identify where experts disagree
- Understand why (methodology, geography, values)
- Make informed judgments

---

## Demo Flow

1. **Create Room**: "Why are cities expensive?"
2. **Add Sources**: Economist article + Chinese housing report
3. **Extract Claims**: Highlight key passages with quotes
4. **Mark Contradiction**: "Rent control reduces supply" vs "Rent control protects tenants"
5. **Challenge Claim**: Get academic counter-sources
6. **Generate Brief**: AI synthesis with citations
7. **Publish**: Share beautiful public report

---

## Contributing

We welcome contributions! Please see our contributing guidelines.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Built for the **Serverpod Flutter Butler Hackathon 2026**
- Powered by [Serverpod](https://serverpod.dev) — the missing server for Flutter
- Globe visualization by [globe.gl](https://globe.gl)
- Academic search via [Crossref](https://crossref.org) and [arXiv](https://arxiv.org)

---

## Contact

**Bhavya Khimavat** - [@BhavyaAk25](https://github.com/BhavyaAk25)

Project Link: [https://github.com/BhavyaAk25/Culture-Compass-](https://github.com/BhavyaAk25/Culture-Compass-)

---

*Culture Compass — Because truth emerges from dialogue, not monologue.*
