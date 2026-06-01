create extension if not exists pgcrypto;

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null,
  display_name text not null default '',
  character_name text not null default '',
  avatar_url text,
  character_title text,
  character_description text,
  character_details jsonb not null default '{}'::jsonb,
  character_lore_ids uuid[] not null default '{}'::uuid[],
  role text not null default 'player' check (role in ('dm', 'player')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.profiles add column if not exists character_title text;
alter table public.profiles add column if not exists character_description text;
alter table public.profiles add column if not exists character_details jsonb not null default '{}'::jsonb;
alter table public.profiles add column if not exists character_lore_ids uuid[] not null default '{}'::uuid[];

create or replace function public.is_dm()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.profiles
    where id = auth.uid()
      and role = 'dm'
  );
$$;

create table if not exists public.timeline_events (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  date_label text,
  description text,
  sort_order numeric not null default 0,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.lore_entries (
  id uuid primary key default gen_random_uuid(),
  type text not null check (type in ('folder', 'religion', 'zone', 'faction', 'character', 'other')),
  title text not null,
  subtitle text,
  image_url text,
  parent_id uuid references public.lore_entries(id) on delete set null,
  summary text,
  description text,
  details jsonb not null default '{}'::jsonb,
  updated_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

do $$
begin
  alter table public.lore_entries drop constraint if exists lore_entries_type_check;
  alter table public.lore_entries
    add constraint lore_entries_type_check
    check (type in ('folder', 'religion', 'zone', 'faction', 'character', 'other'));
end;
$$;

create table if not exists public.lore_links (
  id uuid primary key default gen_random_uuid(),
  source_id uuid not null references public.lore_entries(id) on delete cascade,
  target_id uuid not null references public.lore_entries(id) on delete cascade,
  relation_label text not null default 'Relacionado con',
  created_at timestamptz not null default now(),
  unique (source_id, target_id),
  check (source_id <> target_id)
);

create table if not exists public.lore_entry_visibility (
  id uuid primary key default gen_random_uuid(),
  entry_id uuid not null references public.lore_entries(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (entry_id, user_id)
);

create or replace function public.can_read_lore(entry uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select public.is_dm()
    or not exists (
      select 1
      from public.lore_entry_visibility
      where entry_id = entry
    )
    or exists (
      select 1
      from public.lore_entry_visibility
      where entry_id = entry
        and user_id = auth.uid()
    );
$$;

create table if not exists public.player_notes (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  body text not null default '',
  tags text[] not null default '{}'::text[],
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.stat_cards (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users(id) on delete cascade,
  character_name text not null default '',
  image_url text,
  hp_current integer not null default 0,
  hp_max integer not null default 0,
  stress integer not null default 0,
  ac integer not null default 10,
  passive_perception integer not null default 10,
  passive_investigation integer not null default 10,
  passive_insight integer not null default 10,
  rations integer not null default 0,
  water integer not null default 0,
  inspiration integer not null default 0,
  exhaustion integer not null default 0,
  soul_coins integer not null default 0,
  other_stats jsonb not null default '{}'::jsonb,
  notes text,
  updated_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.stat_cards add column if not exists soul_coins integer not null default 0;

create table if not exists public.stress_rolls (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  die_size integer not null default 4 check (die_size in (4, 6, 8, 10, 12, 20)),
  rolled integer not null check (rolled > 0),
  previous_stress integer not null default 0,
  resulting_stress integer not null default 0,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now()
);

create table if not exists public.battle_states (
  id text primary key default 'main',
  initiative_requested boolean not null default false,
  active_combatant_id uuid,
  round integer not null default 1,
  map_hidden boolean not null default false,
  map_terrain jsonb not null default '[]'::jsonb,
  map_areas jsonb not null default '[]'::jsonb,
  map_width integer not null default 12,
  map_height integer not null default 8,
  map_background_url text,
  active_map_id text not null default 'main-map',
  maps jsonb not null default '[]'::jsonb,
  updated_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.battle_states add column if not exists map_hidden boolean not null default false;
alter table public.battle_states add column if not exists map_terrain jsonb not null default '[]'::jsonb;
alter table public.battle_states add column if not exists map_areas jsonb not null default '[]'::jsonb;
alter table public.battle_states add column if not exists map_width integer not null default 12;
alter table public.battle_states add column if not exists map_height integer not null default 8;
alter table public.battle_states add column if not exists map_background_url text;
alter table public.battle_states add column if not exists active_map_id text not null default 'main-map';
alter table public.battle_states add column if not exists maps jsonb not null default '[]'::jsonb;

create table if not exists public.battle_combatants (
  id uuid primary key default gen_random_uuid(),
  user_id uuid unique references auth.users(id) on delete cascade,
  type text not null default 'monster' check (type in ('player', 'monster', 'npc', 'object', 'trap')),
  name text not null,
  avatar_url text,
  visible_to_players boolean not null default true,
  map_id text,
  initiative integer,
  hp_current integer not null default 0,
  hp_max integer not null default 0,
  ac integer not null default 10,
  position_x integer not null default 0,
  position_y integer not null default 0,
  conditions text,
  notes text,
  created_by uuid references auth.users(id) on delete set null,
  updated_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

do $$
begin
  alter table public.battle_combatants drop constraint if exists battle_combatants_type_check;
  alter table public.battle_combatants
    add constraint battle_combatants_type_check
    check (type in ('player', 'monster', 'npc', 'object', 'trap'));
end;
$$;

alter table public.battle_combatants add column if not exists visible_to_players boolean not null default true;
alter table public.battle_combatants add column if not exists map_id text;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'battle_states_active_combatant_fk'
  ) then
    alter table public.battle_states
      add constraint battle_states_active_combatant_fk
      foreign key (active_combatant_id)
      references public.battle_combatants(id)
      on delete set null;
  end if;
end;
$$;

create table if not exists public.dice_rolls (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  roller_name text not null,
  label text,
  formula text not null,
  quantity integer not null default 1,
  sides integer not null,
  modifier integer not null default 0,
  rolls jsonb not null default '[]'::jsonb,
  total integer not null,
  created_at timestamptz not null default now()
);

create table if not exists public.inventory_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  image_url text,
  rarity text not null default 'mundane',
  quantity integer not null default 1,
  storage_slot text not null default 'mochila',
  lore_ids uuid[] not null default '{}'::uuid[],
  description text,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.inventory_items add column if not exists storage_slot text not null default 'mochila';

create table if not exists public.inventory_containers (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  icon text not null default 'package',
  sort_order integer not null default 100,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.infernal_contracts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  demon_name text not null,
  reward text not null,
  cost text not null,
  hidden_clause text,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.hunger_curses (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  enabled_user_id uuid references auth.users(id) on delete cascade,
  title text not null,
  effect text not null default '',
  severity text not null default 'menor',
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now()
);

create table if not exists public.hunger_table_entries (
  id uuid primary key default gen_random_uuid(),
  roll integer not null unique check (roll > 0),
  title text not null,
  effect text not null default '',
  severity text not null default 'menor',
  source_note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.infernal_shop (
  id text primary key default 'main',
  generated_at timestamptz not null default now(),
  offers jsonb not null default '[]'::jsonb,
  pool jsonb not null default '[]'::jsonb,
  crafting_resources jsonb not null default '[]'::jsonb,
  crafting_recipes jsonb not null default '[]'::jsonb,
  crafting_upgrades jsonb not null default '[]'::jsonb,
  updated_by uuid references auth.users(id) on delete set null,
  updated_at timestamptz not null default now()
);

alter table public.infernal_shop add column if not exists pool jsonb not null default '[]'::jsonb;
alter table public.infernal_shop add column if not exists crafting_resources jsonb not null default '[]'::jsonb;
alter table public.infernal_shop add column if not exists crafting_recipes jsonb not null default '[]'::jsonb;
alter table public.infernal_shop add column if not exists crafting_upgrades jsonb not null default '[]'::jsonb;

create table if not exists public.infiltration_ops (
  id text primary key default 'main',
  config jsonb not null default '{}'::jsonb,
  state jsonb not null default '{}'::jsonb,
  updated_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

drop trigger if exists set_profiles_updated_at on public.profiles;
create trigger set_profiles_updated_at
before update on public.profiles
for each row execute function public.set_updated_at();

drop trigger if exists set_timeline_events_updated_at on public.timeline_events;
create trigger set_timeline_events_updated_at
before update on public.timeline_events
for each row execute function public.set_updated_at();

drop trigger if exists set_lore_entries_updated_at on public.lore_entries;
create trigger set_lore_entries_updated_at
before update on public.lore_entries
for each row execute function public.set_updated_at();

drop trigger if exists set_player_notes_updated_at on public.player_notes;
create trigger set_player_notes_updated_at
before update on public.player_notes
for each row execute function public.set_updated_at();

drop trigger if exists set_stat_cards_updated_at on public.stat_cards;
create trigger set_stat_cards_updated_at
before update on public.stat_cards
for each row execute function public.set_updated_at();

drop trigger if exists set_battle_states_updated_at on public.battle_states;
create trigger set_battle_states_updated_at
before update on public.battle_states
for each row execute function public.set_updated_at();

drop trigger if exists set_battle_combatants_updated_at on public.battle_combatants;
create trigger set_battle_combatants_updated_at
before update on public.battle_combatants
for each row execute function public.set_updated_at();

drop trigger if exists set_inventory_items_updated_at on public.inventory_items;
create trigger set_inventory_items_updated_at
before update on public.inventory_items
for each row execute function public.set_updated_at();

drop trigger if exists set_inventory_containers_updated_at on public.inventory_containers;
create trigger set_inventory_containers_updated_at
before update on public.inventory_containers
for each row execute function public.set_updated_at();

drop trigger if exists set_infernal_contracts_updated_at on public.infernal_contracts;
create trigger set_infernal_contracts_updated_at
before update on public.infernal_contracts
for each row execute function public.set_updated_at();

drop trigger if exists set_infernal_shop_updated_at on public.infernal_shop;
create trigger set_infernal_shop_updated_at
before update on public.infernal_shop
for each row execute function public.set_updated_at();

drop trigger if exists set_infiltration_ops_updated_at on public.infiltration_ops;
create trigger set_infiltration_ops_updated_at
before update on public.infiltration_ops
for each row execute function public.set_updated_at();

drop trigger if exists set_hunger_table_entries_updated_at on public.hunger_table_entries;
create trigger set_hunger_table_entries_updated_at
before update on public.hunger_table_entries
for each row execute function public.set_updated_at();

alter table public.profiles enable row level security;
alter table public.timeline_events enable row level security;
alter table public.lore_entries enable row level security;
alter table public.lore_links enable row level security;
alter table public.lore_entry_visibility enable row level security;
alter table public.player_notes enable row level security;
alter table public.stat_cards enable row level security;
alter table public.stress_rolls enable row level security;
alter table public.battle_states enable row level security;
alter table public.battle_combatants enable row level security;
alter table public.dice_rolls enable row level security;
alter table public.inventory_items enable row level security;
alter table public.inventory_containers enable row level security;
alter table public.infernal_contracts enable row level security;
alter table public.hunger_curses enable row level security;
alter table public.hunger_table_entries enable row level security;
alter table public.infernal_shop enable row level security;
alter table public.infiltration_ops enable row level security;

drop policy if exists "Profiles are readable by logged users" on public.profiles;
create policy "Profiles are readable by logged users"
on public.profiles for select
to authenticated
using (true);

drop policy if exists "Users can create their own player profile" on public.profiles;
create policy "Users can create their own player profile"
on public.profiles for insert
to authenticated
with check (auth.uid() = id and role = 'player');

drop policy if exists "Users can update their own player profile" on public.profiles;
create policy "Users can update their own player profile"
on public.profiles for update
to authenticated
using (auth.uid() = id)
with check (auth.uid() = id and role = 'player');

drop policy if exists "DM can manage profiles" on public.profiles;
create policy "DM can manage profiles"
on public.profiles for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Timeline is readable by logged users" on public.timeline_events;
create policy "Timeline is readable by logged users"
on public.timeline_events for select
to authenticated
using (true);

drop policy if exists "DM can manage timeline" on public.timeline_events;
create policy "DM can manage timeline"
on public.timeline_events for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Lore is readable by logged users" on public.lore_entries;
create policy "Lore is readable by logged users"
on public.lore_entries for select
to authenticated
using (public.can_read_lore(id));

drop policy if exists "DM can manage lore" on public.lore_entries;
create policy "DM can manage lore"
on public.lore_entries for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Lore links are readable by logged users" on public.lore_links;
create policy "Lore links are readable by logged users"
on public.lore_links for select
to authenticated
using (public.can_read_lore(source_id) and public.can_read_lore(target_id));

drop policy if exists "DM can manage lore links" on public.lore_links;
create policy "DM can manage lore links"
on public.lore_links for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Users can read own lore visibility" on public.lore_entry_visibility;
create policy "Users can read own lore visibility"
on public.lore_entry_visibility for select
to authenticated
using (public.is_dm() or user_id = auth.uid());

drop policy if exists "DM can manage lore visibility" on public.lore_entry_visibility;
create policy "DM can manage lore visibility"
on public.lore_entry_visibility for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Users can read own notes" on public.player_notes;
create policy "Users can read own notes"
on public.player_notes for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can create own notes" on public.player_notes;
create policy "Users can create own notes"
on public.player_notes for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update own notes" on public.player_notes;
create policy "Users can update own notes"
on public.player_notes for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users can delete own notes" on public.player_notes;
create policy "Users can delete own notes"
on public.player_notes for delete
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Players read own stats and DM reads all" on public.stat_cards;
create policy "Players read own stats and DM reads all"
on public.stat_cards for select
to authenticated
using (auth.uid() = user_id or public.is_dm());

drop policy if exists "DM can manage stat cards" on public.stat_cards;
create policy "DM can manage stat cards"
on public.stat_cards for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Players can create own stats" on public.stat_cards;
create policy "Players can create own stats"
on public.stat_cards for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Players can update own stats for purchases" on public.stat_cards;
create policy "Players can update own stats for purchases"
on public.stat_cards for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Players read own stress rolls and DM reads all" on public.stress_rolls;
create policy "Players read own stress rolls and DM reads all"
on public.stress_rolls for select
to authenticated
using (auth.uid() = user_id or public.is_dm());

drop policy if exists "DM can create stress rolls" on public.stress_rolls;
create policy "DM can create stress rolls"
on public.stress_rolls for insert
to authenticated
with check (public.is_dm());

drop policy if exists "DM can delete stress rolls" on public.stress_rolls;
create policy "DM can delete stress rolls"
on public.stress_rolls for delete
to authenticated
using (public.is_dm());

drop policy if exists "Battle state is readable by logged users" on public.battle_states;
create policy "Battle state is readable by logged users"
on public.battle_states for select
to authenticated
using (true);

drop policy if exists "DM can manage battle state" on public.battle_states;
create policy "DM can manage battle state"
on public.battle_states for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Players can place visible battle overlays" on public.battle_states;
create policy "Players can place visible battle overlays"
on public.battle_states for update
to authenticated
using (true)
with check (true);

drop policy if exists "Combatants are readable by logged users" on public.battle_combatants;
create policy "Combatants are readable by logged users"
on public.battle_combatants for select
to authenticated
using (public.is_dm() or type = 'player' or visible_to_players = true);

drop policy if exists "Players can create own combatant initiative" on public.battle_combatants;
create policy "Players can create own combatant initiative"
on public.battle_combatants for insert
to authenticated
with check (auth.uid() = user_id and type = 'player');

drop policy if exists "Players can update own combatant initiative" on public.battle_combatants;
create policy "Players can update own combatant initiative"
on public.battle_combatants for update
to authenticated
using (auth.uid() = user_id and type = 'player')
with check (auth.uid() = user_id and type = 'player');

drop policy if exists "DM can manage combatants" on public.battle_combatants;
create policy "DM can manage combatants"
on public.battle_combatants for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Dice rolls are readable by logged users" on public.dice_rolls;
create policy "Dice rolls are readable by logged users"
on public.dice_rolls for select
to authenticated
using (true);

drop policy if exists "Users can create own dice rolls" on public.dice_rolls;
create policy "Users can create own dice rolls"
on public.dice_rolls for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "DM can delete dice rolls" on public.dice_rolls;
create policy "DM can delete dice rolls"
on public.dice_rolls for delete
to authenticated
using (public.is_dm());

drop policy if exists "Inventory readable by owner and DM" on public.inventory_items;
create policy "Inventory readable by owner and DM"
on public.inventory_items for select
to authenticated
using (auth.uid() = user_id or public.is_dm());

drop policy if exists "Users can create own inventory items" on public.inventory_items;
create policy "Users can create own inventory items"
on public.inventory_items for insert
to authenticated
with check (auth.uid() = user_id or public.is_dm());

drop policy if exists "Users can update own inventory items" on public.inventory_items;
create policy "Users can update own inventory items"
on public.inventory_items for update
to authenticated
using (auth.uid() = user_id or public.is_dm())
with check (auth.uid() = user_id or public.is_dm());

drop policy if exists "Users can delete own inventory items" on public.inventory_items;
create policy "Users can delete own inventory items"
on public.inventory_items for delete
to authenticated
using (auth.uid() = user_id or public.is_dm());

drop policy if exists "Inventory containers readable by owner and DM" on public.inventory_containers;
create policy "Inventory containers readable by owner and DM"
on public.inventory_containers for select
to authenticated
using (auth.uid() = user_id or public.is_dm());

drop policy if exists "Users can create own inventory containers" on public.inventory_containers;
create policy "Users can create own inventory containers"
on public.inventory_containers for insert
to authenticated
with check (auth.uid() = user_id or public.is_dm());

drop policy if exists "Users can update own inventory containers" on public.inventory_containers;
create policy "Users can update own inventory containers"
on public.inventory_containers for update
to authenticated
using (auth.uid() = user_id or public.is_dm())
with check (auth.uid() = user_id or public.is_dm());

drop policy if exists "Users can delete own inventory containers" on public.inventory_containers;
create policy "Users can delete own inventory containers"
on public.inventory_containers for delete
to authenticated
using (auth.uid() = user_id or public.is_dm());

drop policy if exists "Contracts readable by owner and DM" on public.infernal_contracts;
create policy "Contracts readable by owner and DM"
on public.infernal_contracts for select
to authenticated
using (auth.uid() = user_id or public.is_dm());

drop policy if exists "DM can manage contracts" on public.infernal_contracts;
create policy "DM can manage contracts"
on public.infernal_contracts for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Hunger readable by marked user and DM" on public.hunger_curses;
create policy "Hunger readable by marked user and DM"
on public.hunger_curses for select
to authenticated
using (public.is_dm() or auth.uid() = user_id or auth.uid() = enabled_user_id);

drop policy if exists "DM can manage hunger curses" on public.hunger_curses;
create policy "DM can manage hunger curses"
on public.hunger_curses for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Hunger table readable by logged users" on public.hunger_table_entries;
create policy "Hunger table readable by logged users"
on public.hunger_table_entries for select
to authenticated
using (true);

drop policy if exists "DM can manage hunger table" on public.hunger_table_entries;
create policy "DM can manage hunger table"
on public.hunger_table_entries for all
to authenticated
using (public.is_dm())
with check (public.is_dm());

drop policy if exists "Shop readable by logged users" on public.infernal_shop;
create policy "Shop readable by logged users"
on public.infernal_shop for select
to authenticated
using (true);

drop policy if exists "DM can create shop state" on public.infernal_shop;
drop policy if exists "Logged users can create shop state" on public.infernal_shop;
create policy "Logged users can create shop state"
on public.infernal_shop for insert
to authenticated
with check (true);

drop policy if exists "Logged users can update shop purchases" on public.infernal_shop;
create policy "Logged users can update shop purchases"
on public.infernal_shop for update
to authenticated
using (true)
with check (true);

drop policy if exists "Infiltration readable by DM or chosen player" on public.infiltration_ops;
create policy "Infiltration readable by DM or chosen player"
on public.infiltration_ops for select
to authenticated
using (
  public.is_dm()
  or (
    coalesce((config ->> 'visible_to_player')::boolean, false)
    and nullif(config ->> 'authorized_user_id', '')::uuid = auth.uid()
  )
);

drop policy if exists "DM can create infiltration ops" on public.infiltration_ops;
create policy "DM can create infiltration ops"
on public.infiltration_ops for insert
to authenticated
with check (public.is_dm());

drop policy if exists "DM or chosen player can update infiltration ops" on public.infiltration_ops;
create policy "DM or chosen player can update infiltration ops"
on public.infiltration_ops for update
to authenticated
using (
  public.is_dm()
  or (
    coalesce((config ->> 'visible_to_player')::boolean, false)
    and nullif(config ->> 'authorized_user_id', '')::uuid = auth.uid()
  )
)
with check (
  public.is_dm()
  or (
    coalesce((config ->> 'visible_to_player')::boolean, false)
    and nullif(config ->> 'authorized_user_id', '')::uuid = auth.uid()
  )
);

drop policy if exists "DM can delete infiltration ops" on public.infiltration_ops;
create policy "DM can delete infiltration ops"
on public.infiltration_ops for delete
to authenticated
using (public.is_dm());

create or replace function public.apply_stress_roll(target_user uuid, die_size integer default 4)
returns table (rolled integer, resulting_stress integer)
language plpgsql
security definer
set search_path = public
as $$
declare
  card_id uuid;
  previous_value integer := 0;
begin
  if not exists (
    select 1 from public.profiles
    where id = auth.uid()
      and role = 'dm'
  ) then
    raise exception 'Only the DM can roll stress' using errcode = '42501';
  end if;

  if die_size <> 4 then
    raise exception 'This campaign stress roll is fixed at 1d4';
  end if;

  rolled := floor(random() * die_size + 1)::integer;

  select id, coalesce(stress, 0)
  into card_id, previous_value
  from public.stat_cards
  where user_id = target_user
  for update;

  if card_id is null then
    insert into public.stat_cards (user_id, stress, updated_by)
    values (target_user, rolled, auth.uid())
    returning stress into resulting_stress;
    previous_value := 0;
  else
    update public.stat_cards
    set stress = previous_value + rolled,
        updated_by = auth.uid(),
        updated_at = now()
    where id = card_id
    returning stress into resulting_stress;
  end if;

  insert into public.stress_rolls (
    user_id,
    die_size,
    rolled,
    previous_stress,
    resulting_stress,
    created_by
  )
  values (
    target_user,
    die_size,
    rolled,
    previous_value,
    resulting_stress,
    auth.uid()
  );

  return next;
end;
$$;

grant execute on function public.apply_stress_roll(uuid, integer) to authenticated;

insert into storage.buckets (id, name, public)
values ('campaign-images', 'campaign-images', true)
on conflict (id) do update set public = true;

drop policy if exists "Campaign images are public" on storage.objects;
create policy "Campaign images are public"
on storage.objects for select
using (bucket_id = 'campaign-images');

drop policy if exists "Authenticated users can upload campaign images" on storage.objects;
create policy "Authenticated users can upload campaign images"
on storage.objects for insert
to authenticated
with check (bucket_id = 'campaign-images');

drop policy if exists "Authenticated users can update campaign images" on storage.objects;
create policy "Authenticated users can update campaign images"
on storage.objects for update
to authenticated
using (bucket_id = 'campaign-images')
with check (bucket_id = 'campaign-images');

drop policy if exists "DM can delete campaign images" on storage.objects;
create policy "DM can delete campaign images"
on storage.objects for delete
to authenticated
using (bucket_id = 'campaign-images' and public.is_dm());

-- Despues de crear tu primer usuario, conviertelo en DM desde el SQL editor:
-- update public.profiles set role = 'dm' where email = 'tu-email@example.com';
