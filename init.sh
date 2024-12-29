#!/bin/bash

# /init.sh

# This script initializes the complete Nuxt.js project structure

app_name="intrepion-to-do-nuxt-js"
human_name="intrepion To Do NuxtJS"

# Version specifications
version_nuxt="3.10.0"
version_npm="11.0.0"

# Update npm to specified version
npm install --global npm@${version_npm}

# Create Nuxt project
npx nuxi@${version_nuxt} init ${app_name}

cd ${app_name}

# Initialize git repository
git init

# Install additional dependencies
npm install --save-dev \
    @nuxt/test-utils \
    @vue/test-utils \
    vitest \
    @playwright/test \
    eslint \
    prettier \
    @nuxtjs/tailwindcss

# Configure Nuxt for TypeScript
npm install --save-dev typescript @types/node

# Update package.json scripts
node -e "
const pkg = require('./package.json');
pkg.scripts = {
  ...pkg.scripts,
  'test': 'vitest',
  'test:watch': 'vitest watch',
  'test:e2e': 'playwright test',
  'lint': 'eslint .',
  'format': 'prettier --write .',
  'typecheck': 'tsc --noEmit'
};
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2))
"

# Create basic project structure
mkdir -p \
    src/components \
    src/composables \
    src/utils \
    tests/e2e \
    tests/unit

# Initialize TypeScript configuration
echo '{
  "extends": "./.nuxt/tsconfig.json",
  "compilerOptions": {
    "strict": true,
    "types": ["vitest/globals"]
  }
}' > tsconfig.json

# Create Playwright configuration
echo 'import { defineConfig } from "@playwright/test";

export default defineConfig({
  testDir: "./tests/e2e",
  use: {
    baseURL: "http://localhost:3000"
  },
  webServer: {
    command: "npm run dev",
    url: "http://localhost:3000",
    reuseExistingServer: !process.env.CI
  }
});' > playwright.config.ts

# Initialize Vitest configuration
echo 'import { defineConfig } from "vitest/config";
import vue from "@vitejs/plugin-vue";

export default defineConfig({
  plugins: [vue()],
  test: {
    globals: true,
    environment: "jsdom"
  }
});' > vitest.config.ts

echo "Project initialization complete!"
