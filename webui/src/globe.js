export function initGlobe(container, points) {
    const globeFactory = window.Globe;
    if (!globeFactory)
        return;
    const globe = globeFactory()
        .globeImageUrl('//unpkg.com/three-globe/example/img/earth-blue-marble.jpg')
        .backgroundColor('rgba(0,0,0,0)')
        .atmosphereColor('#2F4A3C')
        .pointsData(points)
        .pointAltitude(0.01)
        .pointColor(() => '#C4A86A')
        .pointRadius(0.5)
        .enablePointerInteraction(false);
    globe(container);
    globe.controls().autoRotate = true;
    globe.controls().autoRotateSpeed = 0.4;
}
