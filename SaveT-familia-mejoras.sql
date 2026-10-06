-- SaveT · mejoras de Familia
-- Ejecutar una sola vez en Supabase > SQL Editor.
-- Añade relación e icono para conservarlos entre dispositivos.

begin;

alter table public.familia_miembros
  add column if not exists relacion text default 'other';

alter table public.familia_miembros
  add column if not exists icono text default '⭐';

update public.familia_miembros
set relacion = coalesce(relacion, 'other'),
    icono = coalesce(icono, '⭐');

notify pgrst, 'reload schema';
commit;
