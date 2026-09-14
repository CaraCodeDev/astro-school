<!-- fyi-cli -->
## Publishing with `fyi`

Markdown and HTML files in this directory publish to the **Astro School** org on riar.fyi.

```bash
fyi publish notes.md          # create the doc the first time, update it after
fyi publish docs/             # every .md in docs/ and in its subdirectories
fyi pull docs/                # bring edits made in the fyi app back into the files
fyi publish report.html       # replace the file behind an HTML doc
fyi publish new-report.html --title "Q3 Report"   # first publish of a new file
```

- **Markdown docs are editable in the app, so publish looks before it writes.**
  A doc that changed in fyi since your last publish is skipped, not overwritten,
  and the message names who changed it. Run `fyi pull <file|dir>` to write their
  version into your file, where git can diff it, or `--force` to send yours
  instead. Neither one writes while somebody has the doc open in the editor.
- **HTML docs are replaced silently.** Every upload is kept as a version, and
  restoring one is a click in the app.
- **`fyi publish <dir>` treats `<dir>` as the org root, not as a folder.**
  Its `.md` files land at the org root; each subdirectory becomes an fyi folder
  with the directory's name, created if it doesn't exist. Folders are one level
  deep, so a `.md` file nested any deeper is an error. To publish docs into a
  folder, publish the parent: `fyi publish docs/` puts `docs/guides/*.md` in
  a folder called "guides", while `fyi publish docs/guides/` puts them at the
  root. Files that aren't `.md` are counted and ignored rather than published.
- A file with no mapping yet **creates a doc**, published immediately. A new
  Markdown doc is titled from its first `# H1`, else from its filename;
  `--title` names one doc and is refused for a directory. `--draft` creates the
  doc unpublished.
- The file → doc mapping lives in `.fyi.json` in this directory. Commit it; it
  holds no secrets. Titles, folders and publish status belong to the app after
  creation. Change them there, not here.
- Add `--yes` in scripts: it never prompts.
<!-- /fyi-cli -->
