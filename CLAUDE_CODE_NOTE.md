# Claude Code Note — Culture Compass

## Summary
Completed Phases 2–7 in a fast demo-focused way. The app now supports demo auth, room creation/joining, sources/claims/contradictions, real-time streams + presence, brief generation + publish, and a public web report page with a globe. This is optimized for hackathon demo flow rather than production.

## Key Decisions
- **Serverpod 3 upgrade blocked**: Dart SDK is 3.5.4, so Serverpod 3.2.3 cannot be installed. Kept Serverpod 2.9.2 and implemented features on top of it.
- **Demo auth**: Implemented a lightweight `AuthEndpoint` that creates/returns a `UserProfile` by display name (no email/password) for fast judging.
- **Real-time updates**: Used Serverpod message channels (`session.messages`) with `RoomEvent` and `Presence` streams.
- **Web report**: Built with Vite; globe loads from CDN to avoid build issues in the local Three.js exports.

## Server Changes (culture_compass_server)
- Added protocol models:
  - `user_profile.yaml` (demo users)
  - `suggested_source.yaml` (for challenge suggestions)
  - updated `room.yaml` with `publicSlug`, `publishedAt`
  - updated `presence.yaml` to `userId`
- Added endpoints:
  - `auth_endpoint.dart` (demo sign-in)
  - `room_endpoint.dart` (create/join/list/publish + members)
  - `source_endpoint.dart` (add/list + metadata scrape)
  - `claim_endpoint.dart`
  - `contradiction_endpoint.dart`
  - `brief_endpoint.dart` (demo brief generation)
  - `presence_endpoint.dart` (status + heartbeat + stream)
  - `suggest_endpoint.dart` (Crossref + arXiv)
- Added `services/room_event_bus.dart` for emitting RoomEvent messages.
- Added web routes:
  - `ReportApiRoute` at `/api/report/*`
  - `ReportRoute` at `/report/*`
- Updated `lib/server.dart` to serve `/report/*`, `/api/report/*`, and static `web/app`.
- Ran `serverpod generate` after protocol/endpoint changes.

## Flutter Changes (culture_compass_flutter)
- Added demo auth flow:
  - `features/auth/auth_screen.dart`
  - `SessionController` state in `core/providers/session_provider.dart`
- Router setup with go_router + splash gate:
  - `core/providers/router_provider.dart`
  - `main.dart` uses `MaterialApp.router`
- Room UI:
  - `features/rooms/room_list_screen.dart` (create/join/list)
  - `features/rooms/room_detail_screen.dart` (sources/claims/contradictions/brief)
  - Real-time room event and presence streams
  - Challenge suggestions + brief generation + publish flow
  - Diversity meter (simple chips view)
- Flutter analyze + dart format run clean.

## Web Report (webui)
- Added Vite project in `serverpod/culture_compass/webui`.
- `npm run build` outputs to `culture_compass_server/web/app`.
- Globe loads from CDN in `index.html` and renders via `globe.ts`.

## Commands Run
- `dart pub get` (server/client)
- `flutter pub get` (flutter)
- `serverpod generate`
- `dart analyze` (server)
- `flutter analyze` (flutter)
- `dart format` (server/flutter)
- `npm install` + `npm run build` (webui)

## Remaining / Optional
- Run DB migrations (`serverpod create-migration` + apply) once Docker DB is up.
- Start server + app:
  - `cd culture_compass_server && docker compose up -d && dart run bin/main.dart`
  - `cd culture_compass_flutter && flutter run`
- If you want real auth + Serverpod 3 features, upgrade Dart SDK to >=3.8 and re-align packages.
- Polish UI interactions, add tags for sources to make diversity meter richer.

## File Locations of Core Logic
- Server endpoints: `culture_compass_server/lib/src/endpoints/`
- Streams: `culture_compass_server/lib/src/services/room_event_bus.dart`
- Web report API: `culture_compass_server/lib/src/web/routes/`
- Flutter screens: `culture_compass_flutter/lib/features/`
- Router + session: `culture_compass_flutter/lib/core/providers/`
- Web report: `webui/` (builds to `culture_compass_server/web/app/`)

## Additional Phase 8 Polish (Jan 29, 2026)
- Added source tag selectors (region/discipline/stance) and diversity meter chips.
- Added invite code copy + share actions in room header.
- Updated SourceEndpoint signature to accept tags, regenerated client with `serverpod generate`.
- Created new migration `migrations/20260129205121636` for protocol changes.
- Added `CREDITS.md` in repo root.

## Jan 29, 2026 — Run Fixes
- Removed `serverpod_auth_shared_flutter` and `serverpod_auth_client` from Flutter to eliminate `image_cropper` web build error (Color.toARGB32).
- Updated Source add flow to include region/discipline/stance tags in endpoint signature.
- Added `applyMigrations: true` in `config/development.yaml` to auto-create tables on first run.
- Added Ollama-based brief generation in `BriefEndpoint` (falls back to demo markdown if Ollama not running).

### How to run locally now
1. `cd serverpod/culture_compass/culture_compass_server && docker compose up -d`
2. `dart run bin/main.dart` (auto-applies migrations)
3. `cd ../culture_compass_flutter && flutter run` → pick Chrome for fastest demo

### Ollama
- Start Ollama with `ollama serve` and pull a model: `ollama pull llama3.1:8b`
- Brief endpoint will hit `http://localhost:11434/api/generate` if available.

## Jan 29, 2026 — Flutter auth client fix
- Re-added `serverpod_auth_client` dependency to client + Flutter to satisfy generated client imports (no more missing package errors). Kept `serverpod_auth_shared_flutter` removed to avoid image_cropper web compile errors.

## Jan 29, 2026 — UI + Groq integration
- Switched app theme to warm parchment/wood palette (light mode) for readability.
- Added wood gradient to auth screen, quick-start card on room list, quick steps in sources tab.
- Kept typography but updated colors to match warm palette.
- Added Groq LLM support in `BriefEndpoint` (reads `session.passwords['groqApiKey']`). Falls back to Ollama if no key, then demo brief.

### Groq setup (local)
Add to `culture_compass_server/config/passwords.yaml` under `shared`:
```
  groqApiKey: "YOUR_KEY_HERE"
```
Then restart server.

## Jan 29, 2026 — Challenge/Contradiction UX + Groq-only
- Challenge sheet now scrolls (no overflow) and explains use-case. Added “Add as source” action for suggestions.
- Claims tab includes a small “Use Challenge” explainer card.
- Contradictions tab now shows Claim A vs Claim B texts with a type chip for clarity.
- Removed Ollama entirely; brief generation now uses Groq key only (fallback to template if Groq unavailable).
- Adjusted palette to warm parchment/wood and refreshed splash/auth/list visuals.
