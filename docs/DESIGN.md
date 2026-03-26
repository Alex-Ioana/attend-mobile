# Attend mobile UI design

## Reference artwork

- **File:** [design/app-design-proposal.jpg](design/app-design-proposal.jpg)  
- **Origin:** Pencil export; also kept at the local workspace root as `app-design-proposal.jpg` for convenience.

The reference mockup is **dark-themed** (glassmorphic / high-contrast UI direction per product notes).

## Theme requirement

The app **must** ship **both**:

- **Light** theme — full parity for layouts, typography, and key components.
- **Dark** theme — aligned with the reference where applicable.

Users should be able to choose explicitly (e.g. light / dark / system) once settings exist; until then, follow Flutter theming conventions so both `ThemeData` variants stay in sync.

## Implementation notes

- Define shared **color tokens** (background, surface, primary, on-surface, accents) for light and dark; avoid hard-coding only dark palette values from the image.
- Revisit this doc when design tokens are frozen or when Figma/other sources replace the pencil export.
