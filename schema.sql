create table if not exists public.training_settings (
 user_id uuid primary key references auth.users(id) on delete cascade,
 start_date date not null check (extract(isodow from start_date)=1)
);
create table if not exists public.training_records (
 user_id uuid not null references auth.users(id) on delete cascade,
 training_date date not null,
 kind text not null check (kind in ('run','strength')),
 distance_km numeric(6,2), duration_seconds integer,
 primary key(user_id,training_date),
 check ((kind='run' and distance_km is not null and distance_km>0 and distance_km<=100 and duration_seconds is not null and duration_seconds between 1 and 86399) or (kind='strength' and distance_km is null and duration_seconds is null))
);
alter table public.training_settings enable row level security;
alter table public.training_records enable row level security;
drop policy if exists own_settings on public.training_settings;
create policy own_settings on public.training_settings for all to authenticated using (auth.uid()=user_id) with check (auth.uid()=user_id);
drop policy if exists own_records on public.training_records;
create policy own_records on public.training_records for all to authenticated using (auth.uid()=user_id) with check (auth.uid()=user_id);
revoke all on public.training_settings, public.training_records from anon;
grant select,insert,update,delete on public.training_settings, public.training_records to authenticated;
