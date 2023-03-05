/*
PostgreSQL Backup
Database: pruebaITBF/public
Backup Time: 2023-03-05 17:33:24
*/

DROP SEQUENCE IF EXISTS "public"."accommodations_id_seq";
DROP SEQUENCE IF EXISTS "public"."cities_id_seq";
DROP SEQUENCE IF EXISTS "public"."failed_jobs_id_seq";
DROP SEQUENCE IF EXISTS "public"."hotel_confs_id_seq";
DROP SEQUENCE IF EXISTS "public"."hotels_id_seq";
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
DROP SEQUENCE IF EXISTS "public"."personal_access_tokens_id_seq";
DROP SEQUENCE IF EXISTS "public"."room_types_id_seq";
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
DROP TABLE IF EXISTS "public"."accommodations";
DROP TABLE IF EXISTS "public"."cities";
DROP TABLE IF EXISTS "public"."failed_jobs";
DROP TABLE IF EXISTS "public"."hotel_confs";
DROP TABLE IF EXISTS "public"."hotels";
DROP TABLE IF EXISTS "public"."migrations";
DROP TABLE IF EXISTS "public"."password_resets";
DROP TABLE IF EXISTS "public"."personal_access_tokens";
DROP TABLE IF EXISTS "public"."room_types";
DROP TABLE IF EXISTS "public"."users";
CREATE SEQUENCE "accommodations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "cities_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "hotel_confs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "hotels_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
CREATE SEQUENCE "personal_access_tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "room_types_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE SEQUENCE "users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
CREATE TABLE "accommodations" (
  "id" int8 NOT NULL DEFAULT nextval('accommodations_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "accommodations" OWNER TO "postgres";
CREATE TABLE "cities" (
  "id" int8 NOT NULL DEFAULT nextval('cities_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;
ALTER TABLE "cities" OWNER TO "postgres";
CREATE TABLE "failed_jobs" (
  "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
  "uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "failed_jobs" OWNER TO "postgres";
CREATE TABLE "hotel_confs" (
  "id" int8 NOT NULL DEFAULT nextval('hotel_confs_id_seq'::regclass),
  "amount" int4 NOT NULL,
  "accommodation_id" int8 NOT NULL,
  "room_types_id" int8 NOT NULL,
  "hotel_id" int8 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;
ALTER TABLE "hotel_confs" OWNER TO "postgres";
CREATE TABLE "hotels" (
  "id" int8 NOT NULL DEFAULT nextval('hotels_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "direction" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "city_id" int8 NOT NULL,
  "nit" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "number_rooms" int4 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;
ALTER TABLE "hotels" OWNER TO "postgres";
CREATE TABLE "migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;
ALTER TABLE "migrations" OWNER TO "postgres";
CREATE TABLE "password_resets" (
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;
ALTER TABLE "password_resets" OWNER TO "postgres";
CREATE TABLE "personal_access_tokens" (
  "id" int8 NOT NULL DEFAULT nextval('personal_access_tokens_id_seq'::regclass),
  "tokenable_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tokenable_id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "abilities" text COLLATE "pg_catalog"."default",
  "last_used_at" timestamp(0),
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;
ALTER TABLE "personal_access_tokens" OWNER TO "postgres";
CREATE TABLE "room_types" (
  "id" int8 NOT NULL DEFAULT nextval('room_types_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP
)
;
ALTER TABLE "room_types" OWNER TO "postgres";
CREATE TABLE "users" (
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email_verified_at" timestamp(0),
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;
ALTER TABLE "users" OWNER TO "postgres";
BEGIN;
LOCK TABLE "public"."accommodations" IN SHARE MODE;
DELETE FROM "public"."accommodations";
COMMIT;
BEGIN;
LOCK TABLE "public"."cities" IN SHARE MODE;
DELETE FROM "public"."cities";
COMMIT;
BEGIN;
LOCK TABLE "public"."failed_jobs" IN SHARE MODE;
DELETE FROM "public"."failed_jobs";
COMMIT;
BEGIN;
LOCK TABLE "public"."hotel_confs" IN SHARE MODE;
DELETE FROM "public"."hotel_confs";
INSERT INTO "public"."hotel_confs" ("id","amount","accommodation_id","room_types_id","hotel_id","created_at","updated_at") VALUES (25, 10, 1, 3, 6, '2023-03-05 22:04:40', '2023-03-05 22:04:40'),(26, 5, 1, 3, 6, '2023-03-05 22:04:40', '2023-03-05 22:04:40'),(27, 5, 1, 3, 6, '2023-03-05 22:04:40', '2023-03-05 22:04:40');
COMMIT;
BEGIN;
LOCK TABLE "public"."hotels" IN SHARE MODE;
DELETE FROM "public"."hotels";
INSERT INTO "public"."hotels" ("id","name","direction","city_id","nit","number_rooms","created_at","updated_at") VALUES (6, 'Hotel paraiso', 'asdfsafsdfasdfsdfas', 1, '900123123', 20, '2023-03-05 21:55:58', '2023-03-05 21:55:58'),(7, 'Hotel Kiwi', 'Av Ciudad de cali', 1, '900123123-1', 10, '2023-03-05 22:08:04', '2023-03-05 22:08:04'),(8, 'Hotel Country Garden Suites', 'San Cristóbal, Edo. Táchira', 1, '900123123-2', 100, '2023-03-05 22:09:24', '2023-03-05 22:09:24'),(9, 'Motel Faraon', 'San Cristóbal, Edo. Táchira', 1, '900123123-3', 25, '2023-03-05 22:12:51', '2023-03-05 22:12:51');
COMMIT;
BEGIN;
LOCK TABLE "public"."migrations" IN SHARE MODE;
DELETE FROM "public"."migrations";
INSERT INTO "public"."migrations" ("id","migration","batch") VALUES (14, '2023_03_04_043654_create_city_table', 2),(39, '2014_10_12_000000_create_users_table', 3),(40, '2014_10_12_100000_create_password_resets_table', 3),(41, '2019_08_19_000000_create_failed_jobs_table', 3),(42, '2019_12_14_000001_create_personal_access_tokens_table', 3),(43, '2023_03_04_061046_create_cities_table', 3),(44, '2023_03_04_061253_create_hotels_table', 3),(45, '2023_03_04_155543_create_room_types_table', 4),(46, '2023_03_04_155817_create_accommodations_table', 4),(48, '2023_03_04_161235_create_hotel_confs_table', 5);
COMMIT;
BEGIN;
LOCK TABLE "public"."password_resets" IN SHARE MODE;
DELETE FROM "public"."password_resets";
COMMIT;
BEGIN;
LOCK TABLE "public"."personal_access_tokens" IN SHARE MODE;
DELETE FROM "public"."personal_access_tokens";
COMMIT;
BEGIN;
LOCK TABLE "public"."room_types" IN SHARE MODE;
DELETE FROM "public"."room_types";

COMMIT;
BEGIN;
LOCK TABLE "public"."users" IN SHARE MODE;
DELETE FROM "public"."users";
COMMIT;
ALTER TABLE "accommodations" ADD CONSTRAINT "accommodations_pkey" PRIMARY KEY ("id");
ALTER TABLE "cities" ADD CONSTRAINT "cities_pkey" PRIMARY KEY ("id");
ALTER TABLE "failed_jobs" ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");
ALTER TABLE "hotel_confs" ADD CONSTRAINT "hotel_confs_pkey" PRIMARY KEY ("id");
ALTER TABLE "hotels" ADD CONSTRAINT "hotels_pkey" PRIMARY KEY ("id");
ALTER TABLE "migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");
CREATE INDEX "password_resets_email_index" ON "password_resets" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
ALTER TABLE "personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id");
CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "personal_access_tokens" USING btree (
  "tokenable_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tokenable_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
ALTER TABLE "room_types" ADD CONSTRAINT "room_types_pkey" PRIMARY KEY ("id");
ALTER TABLE "users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");
ALTER TABLE "failed_jobs" ADD CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid");
ALTER TABLE "hotel_confs" ADD CONSTRAINT "hotel_confs_accommodation_id_foreign" FOREIGN KEY ("accommodation_id") REFERENCES "public"."accommodations" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "hotel_confs" ADD CONSTRAINT "hotel_confs_hotel_id_foreign" FOREIGN KEY ("hotel_id") REFERENCES "public"."hotels" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "hotel_confs" ADD CONSTRAINT "hotel_confs_room_types_id_foreign" FOREIGN KEY ("room_types_id") REFERENCES "public"."room_types" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "hotels" ADD CONSTRAINT "hotels_nit_unique" UNIQUE ("nit");
ALTER TABLE "hotels" ADD CONSTRAINT "hotels_city_id_foreign" FOREIGN KEY ("city_id") REFERENCES "public"."cities" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token");
ALTER TABLE "users" ADD CONSTRAINT "users_email_unique" UNIQUE ("email");
ALTER SEQUENCE "accommodations_id_seq"
OWNED BY "accommodations"."id";
SELECT setval('"accommodations_id_seq"', 5, true);
ALTER SEQUENCE "accommodations_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "cities_id_seq"
OWNED BY "cities"."id";
SELECT setval('"cities_id_seq"', 1001, true);
ALTER SEQUENCE "cities_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "failed_jobs_id_seq"
OWNED BY "failed_jobs"."id";
SELECT setval('"failed_jobs_id_seq"', 2, false);
ALTER SEQUENCE "failed_jobs_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "hotel_confs_id_seq"
OWNED BY "hotel_confs"."id";
SELECT setval('"hotel_confs_id_seq"', 28, true);
ALTER SEQUENCE "hotel_confs_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "hotels_id_seq"
OWNED BY "hotels"."id";
SELECT setval('"hotels_id_seq"', 10, true);
ALTER SEQUENCE "hotels_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "migrations_id_seq"
OWNED BY "migrations"."id";
SELECT setval('"migrations_id_seq"', 49, true);
ALTER SEQUENCE "migrations_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "personal_access_tokens_id_seq"
OWNED BY "personal_access_tokens"."id";
SELECT setval('"personal_access_tokens_id_seq"', 2, false);
ALTER SEQUENCE "personal_access_tokens_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "room_types_id_seq"
OWNED BY "room_types"."id";
SELECT setval('"room_types_id_seq"', 4, true);
ALTER SEQUENCE "room_types_id_seq" OWNER TO "postgres";
ALTER SEQUENCE "users_id_seq"
OWNED BY "users"."id";
SELECT setval('"users_id_seq"', 2, false);
ALTER SEQUENCE "users_id_seq" OWNER TO "postgres";
