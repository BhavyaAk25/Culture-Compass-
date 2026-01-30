export async function loadReport(slug) {
    const response = await fetch(`/api/report/${slug}`);
    if (!response.ok)
        return null;
    return response.json();
}
export function renderReport(payload) {
    const titleEl = document.getElementById('report-title');
    const subtitleEl = document.getElementById('report-subtitle');
    const briefEl = document.getElementById('brief');
    const sourcesEl = document.getElementById('sources');
    const claimsEl = document.getElementById('claims');
    const contradictionsEl = document.getElementById('contradictions');
    if (titleEl)
        titleEl.textContent = payload.room.title;
    if (subtitleEl) {
        subtitleEl.textContent =
            payload.room.description || 'Collaborative brief with receipts.';
    }
    if (briefEl) {
        briefEl.innerHTML = payload.brief?.markdown
            ? `<pre>${payload.brief.markdown}</pre>`
            : '<p>No brief generated yet.</p>';
    }
    if (sourcesEl) {
        sourcesEl.innerHTML = payload.sources
            .map((source) => `<li><a href="${source.url}" target="_blank">${source.title || source.url}</a></li>`)
            .join('');
    }
    if (claimsEl) {
        claimsEl.innerHTML = payload.claims
            .map((claim) => `<li><strong>${claim.claimText}</strong><br/><em>${claim.quote}</em></li>`)
            .join('');
    }
    if (contradictionsEl) {
        contradictionsEl.innerHTML = payload.contradictions
            .map((item) => `<li><strong>${item.disagreementType}</strong><br/>${item.explanation}</li>`)
            .join('');
    }
}
