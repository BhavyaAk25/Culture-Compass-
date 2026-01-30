import './style.css';
import { initGlobe } from './globe';
import { loadReport, renderReport } from './report';

function getSlug(): string | null {
  const parts = window.location.pathname.split('/').filter(Boolean);
  const reportIndex = parts.indexOf('report');
  if (reportIndex === -1 || reportIndex + 1 >= parts.length) {
    return null;
  }
  return parts[reportIndex + 1];
}

async function bootstrap() {
  const slug = getSlug();
  if (!slug) return;

  const payload = await loadReport(slug);
  if (payload) {
    renderReport(payload);
  }

  const globeContainer = document.getElementById('globe');
  if (globeContainer) {
    initGlobe(globeContainer, []);
  }
}

bootstrap();
