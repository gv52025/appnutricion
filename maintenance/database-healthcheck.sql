-- Availability check only: no tables, clinical data, or privileged execution.
create function public.nutricion_database_healthcheck()
returns integer
language sql
stable
security invoker
set search_path = pg_catalog
set statement_timeout = '5s'
as $$ select 1 $$;

revoke all on function public.nutricion_database_healthcheck() from public, anon, authenticated;
grant execute on function public.nutricion_database_healthcheck() to anon;
comment on function public.nutricion_database_healthcheck() is
  'Public availability probe. Returns 1 without reading or changing any records.';
notify pgrst, 'reload schema';
