import { defineConfig } from 'vite';

export default defineConfig({
  base: '/',
  build: {
    outDir: '../culture_compass_server/web/app',
    emptyOutDir: true,
  },
});
