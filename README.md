# DHBW Karlsruhe Thesis Template (Typst)

A Typst template for project and bachelor theses at DHBW Karlsruhe, following the *Hinweise zur Anfertigung von Projekt- und Bachelorarbeiten 2.0* formatting guidelines.

## Requirements

- [Typst](https://typst.app/) ≥ 0.13 — install via `winget install --id Typst.Typst` or from [typst.app/docs](https://typst.app/docs)
- **Times New Roman** must be installed on your system (used for all body text)

Typst resolves packages automatically from the [Typst Universe](https://typst.app/universe) registry on first compile. No manual package installation is needed.

## Quick start

1. Clone or download this repository.
2. Open `main.typ` and fill in your details (title, name, course, etc.).
3. Compile once:
   ```
   typst compile main.typ
   ```
4. Or watch for live updates while writing:
   ```
   typst watch main.typ
   ```

You can also use the [Tinymist VS Code extension](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) for an integrated editor experience with live preview.

## Configuration

All metadata is passed to `project()` in `main.typ`. Each parameter is documented inline there.

## Packages used

| Package | Purpose |
|---|---|
| [glossarium](https://typst.app/universe/package/glossarium) | Acronym list and `@KEY` references |
| [hydra](https://typst.app/universe/package/hydra) | Running header with current section title |
| [codly](https://typst.app/universe/package/codly) | Styled source code listings |
| [codly-languages](https://typst.app/universe/package/codly-languages) | Language icons for codly |
| [drafting](https://typst.app/universe/package/drafting) | Margin notes for review |
| [linguify](https://typst.app/universe/package/linguify) | FTL-based i18n for EN/DE strings |
