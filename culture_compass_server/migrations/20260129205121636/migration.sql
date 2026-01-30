BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "briefs" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "markdown" text NOT NULL,
    "version" bigint NOT NULL,
    "createdBy" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "brief_room_idx" ON "briefs" USING btree ("roomId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "claims" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "sourceId" bigint NOT NULL,
    "claimText" text NOT NULL,
    "quote" text NOT NULL,
    "createdBy" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "claim_room_idx" ON "claims" USING btree ("roomId");
CREATE INDEX "claim_source_idx" ON "claims" USING btree ("sourceId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "contradictions" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "claimAId" bigint NOT NULL,
    "claimBId" bigint NOT NULL,
    "disagreementType" text NOT NULL,
    "explanation" text NOT NULL,
    "createdBy" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "resolvedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "contradiction_room_idx" ON "contradictions" USING btree ("roomId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "presences" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "status" text NOT NULL,
    "lastSeenAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "presence_room_idx" ON "presences" USING btree ("roomId");
CREATE INDEX "presence_user_idx" ON "presences" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "room_members" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "role" text NOT NULL,
    "joinedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "room_member_idx" ON "room_members" USING btree ("roomId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "rooms" (
    "id" bigserial PRIMARY KEY,
    "code" text NOT NULL,
    "title" text NOT NULL,
    "description" text,
    "publicSlug" text,
    "publishedAt" timestamp without time zone,
    "createdBy" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "room_code_idx" ON "rooms" USING btree ("code");
CREATE UNIQUE INDEX "room_public_slug_idx" ON "rooms" USING btree ("publicSlug");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sources" (
    "id" bigserial PRIMARY KEY,
    "roomId" bigint NOT NULL,
    "url" text NOT NULL,
    "title" text,
    "author" text,
    "publishedAt" timestamp without time zone,
    "snippet" text,
    "regionTag" text,
    "disciplineTag" text,
    "stanceTag" text,
    "addedBy" bigint NOT NULL,
    "addedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "source_room_idx" ON "sources" USING btree ("roomId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_profiles" (
    "id" bigserial PRIMARY KEY,
    "displayName" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_auth_key" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_auth" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_email" ON "serverpod_email_auth" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_create_request" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL,
    "verificationCode" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_create_account_request_idx" ON "serverpod_email_create_request" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_failed_sign_in" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_email_failed_sign_in_email_idx" ON "serverpod_email_failed_sign_in" USING btree ("email");
CREATE INDEX "serverpod_email_failed_sign_in_time_idx" ON "serverpod_email_failed_sign_in" USING btree ("time");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_reset" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_reset_verification_idx" ON "serverpod_email_reset" USING btree ("verificationCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_image" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "version" bigint NOT NULL,
    "url" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_user_image_user_id" ON "serverpod_user_image" USING btree ("userId", "version");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_info" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "created" timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_user_identifier" ON "serverpod_user_info" USING btree ("userIdentifier");
CREATE INDEX "serverpod_user_info_email" ON "serverpod_user_info" USING btree ("email");


--
-- MIGRATION VERSION FOR culture_compass
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('culture_compass', '20260129205121636', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260129205121636', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
