-- sunset in a jar · supabase setup
-- run this once in your project's SQL editor (supabase.com → SQL editor → new query)

-- 1. metadata table
create table public.sunsets (
  id          bigint primary key,          -- Date.now() from the app
  title       text not null default '',
  date        date not null default current_date,
  lid         int  not null default 0,     -- lid color index
  note        text not null default '',    -- the story, if there is one
  image_path  text not null,               -- file name inside the 'sunsets' bucket
  created_at  timestamptz not null default now()
);

alter table public.sunsets enable row level security;

-- prototype policies: anyone holding your anon key can read/write.
-- fine while it's personal; add supabase auth + owner checks before sharing the link.
create policy "anon select" on public.sunsets for select using (true);
create policy "anon insert" on public.sunsets for insert with check (true);
create policy "anon delete" on public.sunsets for delete using (true);

-- 2. public storage bucket for the photos
insert into storage.buckets (id, name, public) values ('sunsets', 'sunsets', true);

create policy "public read sunsets"  on storage.objects for select using (bucket_id = 'sunsets');
create policy "anon upload sunsets"  on storage.objects for insert with check (bucket_id = 'sunsets');
create policy "anon delete sunsets"  on storage.objects for delete using (bucket_id = 'sunsets');
