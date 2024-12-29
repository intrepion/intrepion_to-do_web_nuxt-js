#!/bin/bash

# /init.sh

# This script initializes the complete Nuxt.js project structure with testing support

# Define project names and versions
app_name="intrepion-to-do-nuxt-js"
human_name="intrepion To Do NuxtJS"

# Version specifications
version_npm="11.0.0"

# Update npm to specified version
npm install --global npm@${version_npm}

# Create Nuxt.js application
npx nuxi@latest init ${app_name}

# Move into the project directory
cd ${app_name}

# Install testing dependencies
npm install --save-dev @nuxt/test-utils vitest @vitejs/plugin-vue @vue/test-utils jsdom @testing-library/vue happy-dom

# Create vitest.config.ts with proper Nuxt.js configuration
cat > vitest.config.ts << 'EOL'
import { defineConfig } from 'vitest/config'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath } from 'node:url'
import { resolve } from 'path'

export default defineConfig({
  plugins: [vue()],
  test: {
    // Enable happy-dom for component testing
    environment: 'happy-dom',
    // Enable global test utilities
    globals: true,
    // Include Vue files for testing
    include: ['./tests/**/*.spec.ts'],
    deps: {
      inline: ['@vue', '@nuxt']
    }
  },
  resolve: {
    alias: {
      // Set up aliases to match Nuxt.js conventions
      '~': fileURLToPath(new URL('./', import.meta.url)),
      '@': fileURLToPath(new URL('./', import.meta.url)),
      '#app': resolve(__dirname, 'node_modules/nuxt/dist/app'),
      'vue': 'vue/dist/vue.esm-bundler.js'
    }
  }
})
EOL

# Create test directory and example test that works with Nuxt's structure
mkdir -p tests/components
cat > tests/components/welcome.spec.ts << 'EOL'
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import { defineComponent } from 'vue'

// Create a simple component to test
const WelcomeComponent = defineComponent({
  template: '<div class="welcome">Welcome to Nuxt!</div>'
})

describe('Welcome Component', () => {
  it('renders the welcome message', () => {
    const wrapper = mount(WelcomeComponent)
    expect(wrapper.text()).toContain('Welcome to Nuxt!')
  })
})
EOL

# Create a simple welcome component to test
mkdir -p components
cat > components/Welcome.vue << 'EOL'
<template>
  <div class="welcome">
    Welcome to Nuxt!
  </div>
</template>

<script lang="ts">
export default defineComponent({
  name: 'Welcome'
})
</script>
EOL

# Update package.json scripts
node -e '
const fs = require("fs");
const package = require("./package.json");

// Add test scripts
package.scripts = {
  ...package.scripts,
  "test": "vitest",
  "test:watch": "vitest watch",
  "test:coverage": "vitest run --coverage"
};

fs.writeFileSync("package.json", JSON.stringify(package, null, 2));
'

# Return to parent directory
cd ..

echo "Project initialization complete with testing setup!"
