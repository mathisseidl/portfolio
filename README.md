# Mathis Seidl — Portfolio

Personal portfolio site for Mathis Seidl (Mechanical Engineering & Robotics, Boston
University). Hand-written static HTML/CSS/JS — no framework, no build step — rebuilt
from an earlier Wix site to fix a layout bug and move to a self-hosted, ad-free site.

**Live site:** https://mathisseidl.com

## Structure

```
index.html                 Home page: hero, About (journey timeline, internships),
                           Projects, Certifications, Athletics, Contact
projects/                  One HTML page per project write-up (7 pages)
404.html                   Styled not-found page (uses root-absolute paths)
assets/css/style.css       Single shared stylesheet, cache-busted via ?v=N
assets/js/main.js          Mobile nav, scroll-spy, journey-timeline "today" marker,
                           lazy autoplay for the athletics video
assets/img/                Photos, logos, badges (per-project photos in img/projects/)
assets/video/              Project demo clips (MP4, compressed)
assets/files/              Resume PDF + SolidWorks archives
favicon.svg,               Icons
apple-touch-icon.png
robots.txt, sitemap.xml    SEO
CNAME                      Custom domain for GitHub Pages (mathisseidl.com)
scripts/                   One-off helpers: asset migration from the old Wix site,
                           image resizing, video compression, a tiny static server
```

Project pages: warehouse robot, cart beam balancing, ultrasonic sensor, Connect-4,
machine shop, Skittles color sorter, Siemens digital twin.

## Local preview

There is no build step. Opening `index.html` straight from disk works for most of the
site; note that `404.html` and a few root-absolute paths only resolve correctly when
the files are served from a domain root.

To serve the folder (requires Node):

```
node scripts/serve.js 8080
```

## Deployment

GitHub Pages serves `main` from the repo root (legacy build, no Actions workflow), with
the custom domain `mathisseidl.com` and HTTPS enforced. `www` and plain `http` both 301
to the apex — handled by GitHub, nothing to maintain. Pushing to `main` publishes.

Changing the custom domain in Settings → Pages makes GitHub commit `CNAME` directly to
the repo, so `git pull` after touching those settings or the local clone diverges.

## Editing notes

- Bump the `?v=` query on the stylesheet link in every page when `style.css` changes,
  otherwise returning visitors keep the cached file.
- The journey timeline uses a non-linear scale: each `.tl-seg` declares its own `--w`
  width plus `data-start`/`data-end`, and `main.js` positions the "today" light along
  that same scale. Adding or resizing a segment means keeping the widths summing to 100.
