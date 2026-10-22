# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Static site for *One More Voice* (onemorevoice.org), a digital humanities project publishing TEI-encoded transcriptions, essays and image-based "artifact" pages. There is no build system, package manager, test suite or linter. GitHub Pages serves the repo root (`CNAME` = onemorevoice.org).

## Running locally

`python3 -m http.server 8000` from the repo root, then open http://localhost:8000. (`bash/local-server.command` still uses the Python 2 `SimpleHTTPServer`.)

## Branches and publishing

Flow is `dev-hm` → `dev` → `stage` → `master`; `master` is what gets published. Full command sequences are in `bash/ic-github-commands.txt`; `bash/update_github-stage-to-master.sh` does stage → master. `sitemap.xml` is a generated file (xml-sitemaps.com stylesheet header) and must be refreshed when pages are added or removed.

## Content pipeline

- `xml/TEI-archive-xml`, `xml/TEI-book-xml`, `xml/OBJ-archive-xml`, `xml/OBJ-book-xml`: source TEI/OBJ XML. TEI files reference `xml/omv-integrated.xsl` via `<?xml-stylesheet?>`.
- `html/**` (transcriptions, essays, bipoc-voices, recovering-histories, ivens-craft, materials): published pages, one HTML per XML source (`liv_NNNNNN_TEI.html`, `_ART.html`, `_HTML.html`). Each page carries its own `<head>` metadata (og/twitter tags, JSON-LD breadcrumbs). Pages do not set `rel="canonical"`.
- `xml/0_python-transformers/*.py`: fill XML templates from CSV (placeholder → text); run from that directory.
- `0_dev/`: unpublished working notes (disallowed in robots.txt). Checklists: `03-transcription-workflow.txt`, `04-artifact-workflow.txt`, `05a-Image-prep-workflow-new.txt`; TEI coding rules in `02-new-TEI-notes.txt`; HTML template in `0_dev/2_templates/`.
- Adding an item touches several places: process images (`img/`), add to Zotero and `xml/OMV-MODS-worksheet.xlsx`, then `html/sitemap.html`, `sitemap.xml`, and the relevant listing page (e.g. `html/documents.html`).

## Shared front-end

`common/` (header, footer, overlay fragments), `css/` (`style.css`, `styleTEI.css`, `critical.css`), `js/` (`scripts.js`, `accordion.js`, `tooltips.js`, `journal-transform.js`, `manuscript-transform.js`). `sw.js` is a service worker with a hand-maintained precache list and a `version` string; `js/scripts.js` unregisters all service workers on load. Bump `version` if the precached files change.

## Indexing

`robots.txt` disallows `/0_dev/`, `/bash/`, `/common/`, `/css/`, `/js/`, `/xml/` and some `/img/` subdirectories. The session "fix-indexing-issue" addresses a Google Search Console report (kept in an untracked `issues.txt` in the main checkout): 404s, duplicate-without-canonical (query-string variants like `liv_021020_ART.html?=294669`, `/index.html` vs `/`), http/www redirects, and crawled-but-not-indexed docx/pdf/xlsx and some TEI pages.
