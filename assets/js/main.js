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

  const sections = Array.from(document.querySelectorAll("main [id]"));
  const navLinks = Array.from(document.querySelectorAll(".main-nav a[href^='#'], .main-nav a[href*='index.html#']"));

  if (sections.length && navLinks.length && "IntersectionObserver" in window) {
    const setActive = (id) => {
      navLinks.forEach((link) => {
        const hash = link.getAttribute("href").split("#")[1];
        link.classList.toggle("active", hash === id);
      });
    };

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) setActive(entry.target.id);
        });
      },
      { rootMargin: "-45% 0px -50% 0px", threshold: 0 }
    );

    sections.forEach((section) => observer.observe(section));
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
