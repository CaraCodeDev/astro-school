# Design system

- `tokens.css` — self-hosted font faces and the Tailwind 4 `@theme` block: colours, type ramp, layout. The only place a brand value should be typed.
- `typography.css` — `type-*` utilities that bundle family, weight, size, leading, tracking and case per text role.
- `tokens.figma.json` — raw extraction from the Figma styles node, kept for diffing when the designer updates the file. Not imported by the site.

`src/styles/global.css` imports the two CSS files. Decisions that are ours rather than the designer's are listed in `_reference/DIGEST.md`.
