/* ==========================================================================
   main.js — Awesome SBOM
   Features: dark/light theme toggle, reading progress bar, back-to-top button
   ========================================================================== */

(function () {
  'use strict';

  /* ------------------------------------------------------------------
     Theme toggle (dark / light)
     Persists to localStorage; falls back to system preference.
  ------------------------------------------------------------------ */
  const STORAGE_KEY = 'theme';
  const html = document.documentElement;

  function getPreferredTheme() {
    const saved = localStorage.getItem(STORAGE_KEY);
    if (saved === 'dark' || saved === 'light') return saved;
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  }

  function applyTheme(theme) {
    html.setAttribute('data-theme', theme);
    localStorage.setItem(STORAGE_KEY, theme);
  }

  // Apply immediately (before paint) to avoid flash
  applyTheme(getPreferredTheme());

  document.addEventListener('DOMContentLoaded', function () {
    const toggleBtn = document.querySelector('.theme-toggle');
    if (toggleBtn) {
      toggleBtn.addEventListener('click', function () {
        const current = html.getAttribute('data-theme');
        applyTheme(current === 'dark' ? 'light' : 'dark');
      });
    }

    /* ------------------------------------------------------------------
       Reading progress bar
    ------------------------------------------------------------------ */
    const progressBar = document.querySelector('.reading-progress');
    if (progressBar) {
      let rafPending = false;
      function updateProgress() {
        if (rafPending) return;
        rafPending = true;
        requestAnimationFrame(function () {
          const scrollTop = window.scrollY;
          const docHeight = document.documentElement.scrollHeight - window.innerHeight;
          const pct = docHeight > 0 ? Math.min(1, scrollTop / docHeight) : 0;
          progressBar.style.transform = 'scaleX(' + pct + ')';
          rafPending = false;
        });
      }
      window.addEventListener('scroll', updateProgress, { passive: true });
      updateProgress();
    }

    /* ------------------------------------------------------------------
       Back-to-top button
    ------------------------------------------------------------------ */
    const backToTop = document.getElementById('back-to-top');
    if (backToTop) {
      window.addEventListener('scroll', function () {
        backToTop.classList.toggle('visible', window.scrollY > 400);
      }, { passive: true });

      backToTop.addEventListener('click', function () {
        const table = document.getElementById('tools-table');
        if (table) {
          table.scrollIntoView({ behavior: 'smooth', block: 'start' });
        } else {
          window.scrollTo({ top: 0, behavior: 'smooth' });
        }
      });
    }
  });
})();
