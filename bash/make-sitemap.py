# Rebuilds sitemap.xml from the file tree, replacing the old xml-sitemaps.com export.
# Run from anywhere with: python3 bash/make-sitemap.py        (writes sitemap.xml at the repo root)
#                         python3 bash/make-sitemap.py --dry-run   (prints the summary, writes nothing)
#
# Included: index.html (as "/"), every html/**/*.html that has a self-referencing
#           <link rel="canonical">, and every pdf/**/*.pdf.
# Excluded: redirect stubs (pages with http-equiv="refresh"), 404.html, pages without a
#           canonical (unpublished drafts/templates), and .docx/.xlsx files.
# lastmod:  date of the newest commit that touched the file, ignoring bulk commits (those
#           touching BULK_N or more files under html/), so mechanical site-wide edits do not
#           make every page look freshly changed. No such commit -> lastmod is left out.
# priority: kept from the existing sitemap.xml when the URL is already listed; otherwise the
#           most common priority among listed URLs in the same directory.
import collections, datetime, os, re, subprocess, sys

BASE = "https://onemorevoice.org/"
BULK_N = 100
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(root)
dry = "--dry-run" in sys.argv

old = open("sitemap.xml", encoding="utf-8").read() if os.path.isfile("sitemap.xml") else ""
old_prio = dict(zip(re.findall(r"<loc>([^<]*)</loc>", old), re.findall(r"<priority>([^<]*)</priority>", old)))
by_dir = collections.defaultdict(collections.Counter)
for u, pr in old_prio.items():
    by_dir[u.rsplit("/", 1)[0]][pr] += 1

# newest-first history, skipping bulk commits
log = subprocess.run(["git", "log", "--no-renames", "--name-only", "--format=COMMIT\t%H\t%cI"],
                     capture_output=True, text=True, check=True).stdout
latest = {}
for block in log.split("COMMIT\t")[1:]:
    lines = block.splitlines()
    files = [l for l in lines[1:] if l.strip()]
    if sum(f.startswith("html/") for f in files) >= BULK_N:
        continue
    date = datetime.datetime.fromisoformat(lines[0].split("\t")[1]).astimezone(datetime.timezone.utc)
    for f in files:
        latest.setdefault(f, date)

paths, skipped = [], collections.defaultdict(list)
candidates = ["index.html"]
for d, _, fs in os.walk("html"):
    candidates += [os.path.join(d, f) for f in fs if f.endswith(".html")]
for p in sorted(candidates):
    text = open(p, encoding="utf-8", errors="replace").read()
    url = BASE if p == "index.html" else BASE + p
    if 'http-equiv="refresh"' in text:
        skipped["redirect stub"].append(p)
        continue
    m = re.search(r'rel="canonical" href="([^"]*)"', text)
    if not m:
        skipped["no canonical"].append(p)
        continue
    if m.group(1) != url:
        skipped["canonical points elsewhere"].append(p)
        continue
    paths.append(p)
for d, _, fs in os.walk("pdf"):
    paths += [os.path.join(d, f) for f in fs if f.endswith(".pdf")]

def url_of(p):
    return BASE if p == "index.html" else BASE + p

def priority(url):
    if url in old_prio:
        return old_prio[url]
    if by_dir[url.rsplit("/", 1)[0]]:
        return by_dir[url.rsplit("/", 1)[0]].most_common(1)[0][0]
    return f"{0.8 ** len([s for s in url.replace(BASE, '').split('/') if s]):.4f}"

entries = sorted(((url_of(p), latest.get(p), priority(url_of(p))) for p in paths),
                 key=lambda e: (e[0] != BASE, e[0]))

out = ['<?xml version="1.0" encoding="UTF-8"?>',
       '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">',
       ""]
for url, lm, pr in entries:
    out.append("  <url>")
    out.append(f"       <loc>{url}</loc>")
    if lm:
        out.append(f"       <lastmod>{lm.strftime('%Y-%m-%dT%H:%M:%S+00:00')}</lastmod>")
    out.append(f"       <priority>{pr}</priority>")
    out.append("  </url>")
out.append("</urlset>")

print(f"{len(entries)} URLs; skipped: { {k: len(v) for k, v in skipped.items()} }")
for k, v in skipped.items():
    for p in v:
        print(f"  skipped ({k}): {p}")
if dry:
    print("dry run: sitemap.xml not written")
else:
    with open("sitemap.xml", "w", encoding="utf-8") as fh:
        fh.write("\n".join(out))
    print("wrote sitemap.xml")
