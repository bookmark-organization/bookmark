create type "public"."continents" as enum ('Africa', 'Antarctica', 'Asia', 'Europe', 'Oceania', 'North America', 'South America');

create table "public"."bookmarks" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "inserted_by" uuid not null,
    "url" text not null,
    "title" text,
    "description" text
);


alter table "public"."bookmarks" enable row level security;

CREATE UNIQUE INDEX bookmarks_pkey ON public.bookmarks USING btree (id);

alter table "public"."bookmarks" add constraint "bookmarks_pkey" PRIMARY KEY using index "bookmarks_pkey";

alter table "public"."bookmarks" add constraint "bookmarks_inserted_by_fkey" FOREIGN KEY (inserted_by) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."bookmarks" validate constraint "bookmarks_inserted_by_fkey";


