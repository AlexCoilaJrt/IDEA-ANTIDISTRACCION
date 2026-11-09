---
name: Enfoque
colors:
  surface: '#13131b'
  surface-dim: '#13131b'
  surface-bright: '#393841'
  surface-container-lowest: '#0d0d15'
  surface-container-low: '#1b1b23'
  surface-container: '#1f1f27'
  surface-container-high: '#292932'
  surface-container-highest: '#34343d'
  on-surface: '#e4e1ed'
  on-surface-variant: '#c7c4d6'
  inverse-surface: '#e4e1ed'
  inverse-on-surface: '#302f38'
  outline: '#918f9f'
  outline-variant: '#464553'
  surface-tint: '#c1c1ff'
  primary: '#c1c1ff'
  on-primary: '#1b119b'
  primary-container: '#5b5bd6'
  on-primary-container: '#edeaff'
  inverse-primary: '#4e4ec9'
  secondary: '#41deb7'
  on-secondary: '#00382b'
  secondary-container: '#00c19c'
  on-secondary-container: '#004939'
  tertiary: '#ffb68d'
  on-tertiary: '#532200'
  tertiary-container: '#ae4f00'
  on-tertiary-container: '#ffe8dd'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e2dfff'
  primary-fixed-dim: '#c1c1ff'
  on-primary-fixed: '#0a006b'
  on-primary-fixed-variant: '#3533b0'
  secondary-fixed: '#65fbd2'
  secondary-fixed-dim: '#41deb7'
  on-secondary-fixed: '#002018'
  on-secondary-fixed-variant: '#005140'
  tertiary-fixed: '#ffdbc9'
  tertiary-fixed-dim: '#ffb68d'
  on-tertiary-fixed: '#321200'
  on-tertiary-fixed-variant: '#763300'
  background: '#13131b'
  on-background: '#e4e1ed'
  surface-variant: '#34343d'
typography:
  display-timer:
    fontFamily: Plus Jakarta Sans
    fontSize: 64px
    fontWeight: '700'
    lineHeight: 72px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.005em
  headline-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  title-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Plus Jakarta Sans
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.03em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style
The design system reflects Material Design 3 (Material You) tuned specifically for intensive academic flow states and digital discipline. Built as a focused mobile companion for high school and university students, it balances cognitive calm with dynamic, rewarding feedback. 

Visual tone:
- **Atmospheric & Immersive:** Pure dark-mode foundations minimize optical strain during late-night study sessions, turning the interface into a distraction-free sanctuary.
- **Goal-Oriented Vitality:** Crisp mint accents and expressive streak hues bring kinetic validation to study milestones without inducing dopamine overload or anxiety.
- **Systematic & Predictable:** Native Android navigation metaphors, fluid motion physics, and explicit surface hierarchy eliminate cognitive friction.

## Colors
The palette adopts an expressive dark theme using tonal surfaces to maintain visual depth and structure.

### Surface System
- **Background (`surface`):** `#0F0F17` (Deep obsidian indigo; base layer for all canvases).
- **Surface Container:** `#1A1A26` (Default card surface, list items, input fields).
- **Surface Container High:** `#24243A` (Modal bottom sheets, elevated cards, active state highlights).
- **Surface Container Highest:** `#2F2F4A` (Dividers, borders, inactive chip states).

### Brand & Accents
- **Primary:** `#5B5BD6` (Deep Indigo/Violet used for brand anchoring, primary navigation highlights, and standard interactive elements).
- **Accent & Active State:** `#3DDBB4` (Mint/Turquoise dedicated to active focus states, complete tasks, verified timers, and positive reinforcement).
- **Streak & Fire:** `#FF8A3D` (Fire Orange allocated strictly to streaks, daily continuity counters, and high-urgency goals).

### Academic & Subject Coding
- **Cálculo (Mathematics):** `#3B82F6`
- **Física (Sciences):** `#8B5CF6`
- **Historia (Humanities):** `#10B981`
- **Inglés (Languages):** `#EC4899`

### Status Indicators
- **Concentrado (Focused):** `#3DDBB4`
- **En descanso (Break):** `#F5B544`
- **Distraído / Salió (Abandoned/Distracted):** `#FF6B6B`

## Typography
Plus Jakarta Sans serves across all typographic levels. Semibold headings ground structural hierarchies, while standard weights provide legibility on dark surfaces.

Numeric displays (timers, session lengths, streak counters, study analytics) must always enable tabular figures (`font-variant-numeric: tabular-nums` or `tnum`) to eliminate layout jitter during active countdowns. Display-timer represents the visual focal point during active focus sessions.

## Layout & Spacing
Designed explicitly for the standard Android mobile viewport of 412 × 915 dp. 

The layout follows an 8dp vertical grid system with a 4dp baseline sub-grid for tight groupings:
- **Canvas Margins:** 16dp (`1rem`) on horizontal edges to maximize content area on compact devices.
- **Internal Column Gutters:** 16dp (`1rem`) separating horizontal cards or modular metric panels.
- **Top Safe Area:** Respect system status bars; dynamic padding applies beneath camera punch-holes.
- **Bottom Navigation Clearance:** 80dp baseline bar height plus Android system navigation inset (gesture pill or 3-button zone). Content layers maintain a minimum `space-xl` bottom clearance to prevent collision with fixed actions.

## Elevation & Depth
Depth adheres strictly to Material 3 dark mode tonal elevation principles rather than direct drop shadows:

- **Level 0 (Canvas):** Base background `#0F0F17`.
- **Level 1 (Cards, Static Modules):** Surface Container `#1A1A26` with no shadow. Structural differentiation is achieved through color contrast.
- **Level 2 (Active Cards, Floating Controls):** Surface Container High `#24243A` supplemented with a subtle tinted ambient glow: `0 8px 24px rgba(0, 0, 0, 0.45)`.
- **Level 3 (Bottom Sheets, Dialogs):** Surface Container High `#24243A` with full scrim overlay (`rgba(15, 15, 23, 0.72)`) and edge highlight (`1px solid rgba(255, 255, 255, 0.08)`).
- **Active Focus Aura:** When in "Concentrado" state, cards and primary circular progress indicators project an ambient mint bloom (`0 0 32px rgba(61, 219, 180, 0.15)`).

## Shapes
Shapes define the tactile nature of interactive elements:
- **Cards & Surface Modules:** 16px (`rounded-2xl` equivalent) creating soft, modern frames for study tasks and stat widgets.
- **Action Buttons & Mode Switches:** Fully rounded pill shapes (`rounded-full`, 9999px) for primary CTA buttons ("Iniciar Sesión", "Pausar", "Unirse a Sala").
- **Bottom Sheets:** 28px (`rounded-t-3xl`) top radius with an integrated 4 × 32dp pill grab-handle.
- **Avatars & Streak Badges:** Strict circular forms (1:1 ratio, 100% radius).
- **Subject Tag Badges:** 8px (`rounded-md`) pill-adjacent tags for discrete categorization.

## Components

### Botones (Buttons)
- **Primary Action ("Iniciar Enfoque"):** Full-width or centered pill button (56dp height). Background in `#5B5BD6` or `#3DDBB4` (when starting a focus block), with label set in `label-lg` (pure dark `#0F0F17` text when paired with mint, white when paired with indigo).
- **Secondary Action ("Descanso Corto"):** Surface container high `#24243A`, text in `#FFFFFF`, pill shape.
- **Destructive / Abandon Action ("Terminar Sesión"):** Ghost button with Coral outline `#FF6B6B` and low-opacity background (`rgba(255, 107, 107, 0.1)`).

### Tarjetas de Estudio (Study Cards)
- Container background `#1A1A26`, 16px corner radius, 16px internal padding.
- Includes a 4dp left border or subject pill tag using the designated subject palette (`#3B82F6` Cálculo, `#8B5CF6` Física, etc.).
- Active session cards replace default container tone with an animated, soft pulse using `#3DDBB4` at 5% opacity.

### Barra de Navegación Inferior (Bottom Navigation)
- Fixed at screen bottom, height 80dp, Surface `#0F0F17` with subtle top separator border `#24243A`.
- 4 navigation tabs with standard M3 pill indicators on active state:
  1. **Inicio** (Focus timer, active session launch)
  2. **Horario** (Study schedules, blocked apps configuration)
  3. **Salas** (Collaborative study groups, virtual silent rooms)
  4. **Progreso** (Stats, charts, streak continuity)
- Active icon container: Pill shaped in `#24243A`, active icon/text in `#3DDBB4` or `#5B5BD6`. Inactive items in muted slate (`rgba(255, 255, 255, 0.5)`).

### Chips & Filtros (Chips)
- Pill shape (32dp height), horizontal scrolling rows.
- Unselected: Surface Container `#1A1A26`, text muted.
- Selected: Background `#5B5BD6`, text white. Filter chips for subjects use the corresponding subject tint at 20% opacity with solid text matching the hue.

### Temporizador Circular (Focus Timer Display)
- Central circular ring (stroke width 12dp), track color `#24243A`, progress indicator colored dynamically by status: `#3DDBB4` (Concentrado), `#F5B544` (Descanso).
- Centered tabular digits using `display-timer`. Immediate sub-label displaying current subject in `label-md`.

### Controles de Entrada (Inputs & Toggles)
- Inputs utilize filled container style (`#1A1A26`), bottom line indicator `#5B5BD6` upon focus. 
- M3-style Switch toggle: Track `#24243A` (inactive) / `#3DDBB4` (active), with an enlarged white circular thumb for simple one-handed mobile toggling.