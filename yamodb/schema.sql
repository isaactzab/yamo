-- Creator:       MySQL Workbench 5.2.47/ExportSQLite plugin 2009.12.02
-- Author:        levi
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2014-05-05 19:15
-- Created:       2014-05-03 09:30
PRAGMA foreign_keys = OFF;

-- Schema: mydb
BEGIN;
CREATE TABLE "Files"(
  "idFile" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name" VARCHAR(45),
  "size" INTEGER,-- Size in bytes
  "hash" VARCHAR(32),
  "createOn" DATETIME,
  "createdBy" INTEGER
);
CREATE TABLE "Artist"(
  "idArtist" INTEGER PRIMARY KEY NOT NULL,
  "name" VARCHAR(45),
  "url" VARCHAR(45),
  "picture" VARCHAR(45)
);
CREATE TABLE "Group"(
  "idGroup" INTEGER PRIMARY KEY NOT NULL,
  "name" VARCHAR(45),
  "url" VARCHAR(45),
  "picture" VARCHAR(45)
);
CREATE TABLE "Composer"(
  "idComposer" INTEGER PRIMARY KEY NOT NULL,
  "name" VARCHAR(50),
  "url" VARCHAR(45)
);
CREATE TABLE "Genere"(
  "idGenere" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name" VARCHAR(45),
  "url" VARCHAR(45),
  "picture" VARCHAR(45)
);
CREATE TABLE "Track"(
  "idTrack" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name" VARCHAR(64),
  "idFile" INTEGER NOT NULL,
  "idGenere" INTEGER,
  "idComposer" INTEGER,
  "idArtist" INTEGER,
  "idGruop" INTEGER,
  "year" DATETIME,
  CONSTRAINT "fk_Track_Files"
    FOREIGN KEY("idFile")
    REFERENCES "Files"("idFile"),
  CONSTRAINT "fk_Track_Artist"
    FOREIGN KEY("idArtist")
    REFERENCES "Artist"("idArtist"),
  CONSTRAINT "fk_Track_Group"
    FOREIGN KEY("idGruop")
    REFERENCES "Group"("idGroup"),
  CONSTRAINT "fk_Track_Composer"
    FOREIGN KEY("idComposer")
    REFERENCES "Composer"("idComposer"),
  CONSTRAINT "fk_Track_Genere"
    FOREIGN KEY("idGenere")
    REFERENCES "Genere"("idGenere")
);
CREATE INDEX "Track.fk_Track_Files_idx" ON "Track"("idFile");
CREATE INDEX "Track.fk_Track_Artist_idx" ON "Track"("idArtist");
CREATE INDEX "Track.fk_Track_Group_idx" ON "Track"("idGruop");
CREATE INDEX "Track.fk_Track_Composer_idx" ON "Track"("idComposer");
CREATE INDEX "Track.fk_Track_Genere_idx" ON "Track"("idGenere");
CREATE TABLE "Album"(
  "idAlbum" INTEGER PRIMARY KEY NOT NULL,
  "name" VARCHAR(45),
  "year" YEAR,
  "idArtist" INTEGER,
  "idGroup" INTEGER,
  "crossfade" BIT,
  CONSTRAINT "fk_Album_Group"
    FOREIGN KEY("idGroup")
    REFERENCES "Group"("idGroup"),
  CONSTRAINT "fk_Album_Artist"
    FOREIGN KEY("idArtist")
    REFERENCES "Artist"("idArtist")
);
CREATE INDEX "Album.fk_Album_Group_idx" ON "Album"("idGroup");
CREATE INDEX "Album.fk_Album_Artist_idx" ON "Album"("idArtist");
CREATE TABLE "Album_has_Track"(
  "Album_idAlbum" INTEGER NOT NULL,
  "Track_idTrack" INTEGER NOT NULL,
  "tracknumber" INTEGER,
  PRIMARY KEY("Album_idAlbum","Track_idTrack"),
  CONSTRAINT "fk_Album_has_Track_Album1"
    FOREIGN KEY("Album_idAlbum")
    REFERENCES "Album"("idAlbum"),
  CONSTRAINT "fk_Album_has_Track_Track1"
    FOREIGN KEY("Track_idTrack")
    REFERENCES "Track"("idTrack")
);
CREATE INDEX "Album_has_Track.fk_Album_has_Track_Track1_idx" ON "Album_has_Track"("Track_idTrack");
CREATE INDEX "Album_has_Track.fk_Album_has_Track_Album1_idx" ON "Album_has_Track"("Album_idAlbum");
CREATE TABLE "Track_Collaborators"(
  "Track_idTrack" INTEGER NOT NULL,
  "Artist_idArtist" INTEGER NOT NULL,
  "Group_idGroup" INTEGER NOT NULL,
  PRIMARY KEY("Track_idTrack","Artist_idArtist","Group_idGroup"),
  CONSTRAINT "fk_Track_has_Artist_Track1"
    FOREIGN KEY("Track_idTrack")
    REFERENCES "Track"("idTrack"),
  CONSTRAINT "fk_Track_has_Artist_Artist1"
    FOREIGN KEY("Artist_idArtist")
    REFERENCES "Artist"("idArtist"),
  CONSTRAINT "fk_Track_has_Group_Group1"
    FOREIGN KEY("Group_idGroup")
    REFERENCES "Group"("idGroup")
);
CREATE INDEX "Track_Collaborators.fk_Track_has_Artist_Artist1_idx" ON "Track_Collaborators"("Artist_idArtist");
CREATE INDEX "Track_Collaborators.fk_Track_has_Artist_Track1_idx" ON "Track_Collaborators"("Track_idTrack");
CREATE INDEX "Track_Collaborators.fk_Track_has_Group_Group1_idx" ON "Track_Collaborators"("Group_idGroup");
COMMIT;
