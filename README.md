# Mathis Seidl — Portfolio

Personal portfolio site for Mathis Seidl (Mechanical Engineering & Robotics, Boston
University). Hand-written static HTML/CSS/JS, rebuilt from an earlier Wix site to fix a
layout bug and move to a self-hosted, ad-free site on GitHub Pages.

**Live site:** add your GitHub Pages URL here once deployed.

## Structure

```
index.html                 Home page (hero, about, projects, certifications, athletics, contact)
projects/                  One HTML page per project write-up
assets/css/style.css       Shared stylesheet
assets/js/main.js          Mobile nav toggle + scroll-spy active nav state
assets/img/                Photos, logos, badges (project photos under assets/img/projects/)
assets/files/               Resume PDF + SolidWorks archives
scripts/                   One-off scripts used to migrate assets from the old Wix site
```

## Local preview

No build step — just open `index.html` in a browser, or serve the folder with any
static file server, e.g.:

```
npx serve .
```

## Deploying to GitHub Pages

1. Push this repo to GitHub.
2. In the repo's Settings → Pages, set the source to the `main` branch, root folder.
3. The site will be live at `https://<username>.github.io/<repo>/`.

## Known limitation

The two embedded video clips from the original site (Warehouse Robot build/test clip,
tennis highlight video) use Wix's proprietary video player and couldn't be extracted
during migration. Photo galleries stand in for them for now — drop the actual video
files into `assets/video/` and add `<video>` tags if you'd like them back.
