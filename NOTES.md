# Astro School, working notes

Last session: 14 Sep 2026. Pick up from "Next" at the bottom.

## What this is

Teaching a Webflow designer on the A&M team to build and deploy Astro sites to Cloudflare, nose to tail. Mac mini, browser, no terminal background. Small sessions, each with one stated goal and something live at the end.

## Where things live

| Thing | Where |
|---|---|
| This repo (setup script, dotfiles, lesson pages) | github.com/CaraCodeDev/astro-school, public. Local: ~/repo/astro-school |
| Starter site for lesson 1 | github.com/CaraCodeDev/delightful-deli, public, template flag on. Local: ~/repo/delightful-deli |
| Published lessons | Astro School org on riar.fyi, via `fyi publish lessons/<file>.html --yes`. Mapping in .fyi.json |
| Lesson 0 | https://fyi.riar.app/caracode/astro-school/lesson-0-set-up-your-mac |
| Lesson 1 | https://fyi.riar.app/caracode/astro-school/lesson-1-from-your-terminal-to-a-live-site |
| Brand tokens for lesson pages | design-system/ (copied from am-rebrand-astro-scratchpad). Tailwind 4 syntax, translated to plain CSS inside each lesson HTML. Fonts from Google Fonts. |

## The arc (agreed)

0. Set up your Mac. One `curl | bash`, Brewfile, dotfiles, gh login. **Written and published.**
1. Terminal to live site. Template-clone the deli, pnpm install, pnpm dev, Cloudflare import, invite Rich, one manual edit-commit-push. **Written and published.**
2. Claude does the typing. Install Claude Code live, repeat the lesson 1 loop with Claude, then a Webflow-shaped ask ("add a testimonials section like that one"). Not written.
3. Start from nothing. `pnpm create astro@latest` (minimal template, say yes to install and git), `gh repo create`, connect Cloudflare, Claude builds header, footer, hero. Not written.
4. A real page. Cards, second page, nav. The "that's not what I meant" loop. Not written.
5. Content and a domain. Content collections as markdown, custom domain on Cloudflare, preview deploys. Not written.

## Principles Rich set (don't relitigate)

- No browser-only steps. The first success has to happen in the terminal or GitHub web editing becomes the sticky process and they stop learning.
- Astro internals are Claude's job. The designer learns the folder map, "component = symbol", and how to read a diff. No props, slots, or build internals.
- Manual git stays tiny. One commit in lesson 1, so "Claude committed and pushed" is a sentence they can verify. Never taught again after that.
- pnpm, not npm, throughout, because Rich's repos use pnpm. Both lesson 0 and lesson 1 explain the difference and the lockfile rule.
- Claude Code is deliberately not in the setup Brewfile. It's installed live in lesson 2 so it's an event.
- Leave out: branches, PRs, SSR, the Cloudflare adapter, Tailwind. Answer if asked, don't teach.
- Their own Cloudflare and GitHub accounts. They invite Rich as an admin / collaborator. Nothing ever needs moving between accounts.
- Starter needed variety, not a toy. Deli has nine home sections and a catering page so lessons 2 and 4 can say "one like that".

## Setup details

- setup.sh: xcode tools, Homebrew, clone this repo to ~/repo, brew bundle, install dotfiles (backs up existing), git identity, gh auth login.
- Brewfile: git, gh, node, pnpm, starship, zsh-autosuggestions, zsh-syntax-highlighting, eza, zoxide, micro, ghostty, zed, JetBrains Mono Nerd Font.
- Dotfiles are a trimmed version of Rich's. Kept: autosuggest, highlighting, eza, zoxide as cd, micro as EDITOR, Gruvbox ghostty, shift+enter binding. Dropped: yazi, lazygit, OTEL claude wrapper, Tailscale, p10k leftovers. Starship shows folder, branch, dirty marker only. Two-line prompt.

## Starter details

- Astro 7.3, static, no adapter, plain scoped CSS. Palette from the "Eosine Pink & Burnt Sienna" Wada set. Bricolage Grotesque + Instrument Sans.
- Components: Header, Footer, ProductCard, Quote. Layout: Base.astro. Pages: index, catering. Tokens: src/styles/global.css.
- All data (menu, provisions, hours, FAQs, boxes) is plain lists at the top of the page files, so a first edit is one line.
- Images are on-brand SVG placeholders in public/images. Swap for photos with the same names.
- wrangler.jsonc with assets dir ./dist so the Cloudflare dashboard import needs no settings. Build `pnpm build`, deploy `npx wrangler deploy`.
- Astro 7 scaffolds an AGENTS.md with a CLAUDE.md symlink. Free win for lesson 2.

## Not yet verified

- setup.sh has never been run on a clean machine. Rehearse on a fresh macOS user account before it goes to the designer.
- Lesson 1's Cloudflare dashboard steps are from the docs, not clicked through on a fresh account. Button labels may have drifted.
- The template-clone + Workers Builds import with pnpm hasn't been run end to end.
- Lesson pages checked at desktop width in Chrome only. Look at both on a phone.

## Next

1. Rehearse lesson 0 and lesson 1 on a clean user account. Fix whatever breaks.
2. Write lesson 2 (Claude Code). Open questions: install method (brew cask claude-code is in Rich's setup; or the native installer), what the first ask is, how to teach reading a diff, and a short list of prompt shapes that work for a designer ("cards three across on desktop, stacked on mobile, 24 gap").
3. Decide whether lesson 4 is one session or two.
4. Lesson 2 candidates for the Webflow-shaped ask, all against the deli: add a testimonial, add a provisions card, add a section like the catering band but for a Sunday market, change the brand pink in global.css.
