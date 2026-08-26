document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.querySelector(".nav-toggle");
  const nav = document.querySelector(".main-nav");

  if (toggle && nav) {
    toggle.addEventListener("click", () => {
      const isOpen = nav.classList.toggle("open");
      toggle.setAttribute("aria-expanded", String(isOpen));
    });

    nav.querySelectorAll("a").forEach((link) => {
      link.addEventListener("click", () => {
        nav.classList.remove("open");
        toggle.setAttribute("aria-expanded", "false");
      });
    });
  }

  /* ------------------------------------------------------------------
     Scroll spy — highlight a nav item for the whole length of its
     section, not just while its heading is on screen, and always
     highlight the last one once the page is scrolled to the bottom.
     Only real nav targets are tracked (never stray ids inside a section).
     ------------------------------------------------------------------ */
  const navLinks = Array.from(document.querySelectorAll(".main-nav a[href*='#']"));
  const spy = navLinks
    .map((link) => {
      const id = link.getAttribute("href").split("#")[1];
      const el = id ? document.getElementById(id) : null;
      return el ? { link, el } : null;
    })
    .filter(Boolean)
    .sort((a, b) => (a.el.compareDocumentPosition(b.el) & Node.DOCUMENT_POSITION_FOLLOWING ? -1 : 1));

  if (spy.length > 1) {
    const header = document.querySelector(".site-header");
    let queued = false;

    const update = () => {
      queued = false;
      const scrollY = window.scrollY;
      const line = scrollY + (header ? header.offsetHeight : 0) + 24;
      const atBottom =
        window.innerHeight + scrollY >= document.documentElement.scrollHeight - 2;

      let current = spy[0];
      if (atBottom) {
        current = spy[spy.length - 1];
      } else {
        spy.forEach((entry) => {
          if (entry.el.getBoundingClientRect().top + scrollY <= line) current = entry;
        });
      }

      spy.forEach((entry) => entry.link.classList.toggle("active", entry === current));
    };

    const request = () => {
      if (queued) return;
      queued = true;
      requestAnimationFrame(update);
    };

    window.addEventListener("scroll", request, { passive: true });
    window.addEventListener("resize", request);
    window.addEventListener("load", request);
    update();
  }

  /* ------------------------------------------------------------------
     Education timeline — place the "today" light on the same
     non-linear scale the markup declares via --w on each segment.
     ------------------------------------------------------------------ */
  const timeline = document.getElementById("eduTimeline");
  if (timeline) {
    const now = Date.now();
    let acc = 0;
    let pos = null;

    timeline.querySelectorAll(".tl-seg").forEach((seg) => {
      const width = parseFloat(seg.style.getPropertyValue("--w"));
      const start = Date.parse(seg.dataset.start + "T00:00:00");
      const end = Date.parse(seg.dataset.end + "T23:59:59");

      if (pos === null && now <= end) {
        pos = now < start ? acc : acc + ((now - start) / (end - start)) * width;
      }
      acc += width;
    });

    if (pos === null) pos = acc;
    timeline.style.setProperty("--today", pos.toFixed(2) + "%");
  }

  const tennisFrame = document.querySelector(".athletics-video iframe");
  if (tennisFrame && "IntersectionObserver" in window) {
    const baseSrc = tennisFrame.getAttribute("src");
    const videoObserver = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            tennisFrame.src = baseSrc + (baseSrc.includes("?") ? "&" : "?") + "autoplay=1&mute=1";
            videoObserver.unobserve(tennisFrame);
          }
        });
      },
      { threshold: 0.5 }
    );
    videoObserver.observe(tennisFrame);
  }
});
