<!-- /README.md -->

# intrepion_to-do_web_nuxt-js
intrepion To Do web app written using Nuxt.js framework

# Intrepion To Do - Nuxt.js Project

This project is a To Do application built with Nuxt.js 3, set up for local development using Docker Compose and prepared for deployment to various cloud providers. The project uses TypeScript for type safety, includes comprehensive testing setups, and follows modern Vue development practices.

## Project Overview

The application is structured as a modern Nuxt.js project with TypeScript support, incorporating best practices for testing, styling, and development workflow. It uses Docker for consistent development and deployment environments across different platforms.

## Prerequisites

Before starting, ensure you have these tools installed on your system:

- **Docker**: [Installation Guide](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Installation Guide](https://docs.docker.com/compose/install/)
- **Git**: [Installation Guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Project Structure

```
intrepion-to-do-nuxt-js/
├── docker/                     # Docker configuration files
│   ├── Dockerfile             # Development environment
│   ├── Dockerfile.init        # Project initialization
│   └── Dockerfile.publish     # Production build
├── src/                       # Source code directory
│   ├── pages/                 # Nuxt.js pages directory
│   ├── components/            # Reusable Vue components
│   ├── composables/           # Vue composables (hooks)
│   ├── utils/                 # Utility functions and helpers
│   ├── tests/                 # Test files
│   │   ├── unit/             # Unit and component tests
│   │   └── e2e/              # End-to-end tests
│   └── types/                 # TypeScript type definitions
├── .gitignore                 # Git ignore configuration
├── docker-compose.yml         # Docker Compose configuration
├── init.sh                    # Project initialization script
├── vitest.config.ts          # Vitest test configuration
├── nuxt.config.ts           # Nuxt.js configuration
├── package.json             # Project dependencies and scripts
├── cypress.config.ts       # Cypress test configuration
├── tailwind.config.ts     # Tailwind CSS configuration
└── tsconfig.json         # TypeScript configuration
```

## Technology Stack

- **Framework**: Nuxt.js 3
- **Language**: TypeScript 5
- **Styling**: Tailwind CSS
- **Testing**:
  - Vitest for unit testing
  - Vue Test Utils for component testing
  - Cypress for end-to-end testing
- **Development Environment**: Docker
- **Node Version**: 22.0.0

## Getting Started

### 1. Initialize the Project

Create the project structure and install dependencies:

```bash
docker compose run --rm nuxtjs-init
```

This command:
- Creates the Nuxt.js project with TypeScript support
- Sets up the testing environment (Vitest and Cypress)
- Installs all necessary dependencies
- Configures development tools (ESLint, Prettier)

### 2. Start Development Environment

Launch the development server with hot reloading:

```bash
docker compose up nuxtjs-dev
```

The application will be available at `http://localhost:3000`. Changes to your source files will automatically trigger a rebuild and refresh in the browser.

### 3. Running Tests

The project includes several types of tests that can be run in different ways:

#### Unit and Component Tests

Run Vitest tests:
```bash
# Run tests once
docker compose run --rm nuxtjs-dev npm test

# Run tests in watch mode
docker compose run --rm nuxtjs-dev npm run test:watch

# Run tests with coverage
docker compose run --rm nuxtjs-dev npm run test:coverage
```

#### End-to-End Tests

Run Cypress tests:
```bash
docker compose run --rm nuxtjs-dev npm run test:e2e
```

### 4. Production Build

Build and run the production version locally:

```bash
docker compose up nuxtjs-prod
```

The production build will be available at `http://localhost:3000`.

### 5. Additional Commands

Format code using Prettier:
```bash
docker compose run --rm nuxtjs-dev npm run format
```

Run linting:
```bash
docker compose run --rm nuxtjs-dev npm run lint
```

### 6. Stop the Environment

To stop running containers:

```bash
docker compose down
```

## Project Customization

### Adding New Components

1. Create a new component in `components/`
2. Create corresponding test file in `tests/unit/components/`
3. Import and use the component as needed

### Creating Composables

1. Add new composables in `composables/`
2. Create corresponding test file in `tests/unit/composables/`
3. Import and use the composable in your components

### Adding E2E Tests

1. Create new test files in `tests/e2e/`
2. Run the tests using the test:e2e script

## Best Practices

- Keep components small and focused on a single responsibility
- Write tests for all new features
- Use TypeScript types/interfaces for all props and state
- Follow the project's established coding style
- Use Tailwind CSS for styling
- Commit code regularly with clear commit messages

## Deployment

The project includes a production-ready Dockerfile (`Dockerfile.publish`) that creates an optimized build for deployment. The production image:

- Uses multi-stage builds to minimize the final image size
- Implements proper Node.js production settings
- Includes only the necessary files for running the application
- Configures the application for production use

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Troubleshooting

### Common Issues

1. **Port Already in Use**
   - Stop any running applications on port 3000
   - Or modify the port in docker-compose.yml

2. **Node Modules Issues**
   - Remove the node_modules directory
   - Run `docker compose down`
   - Restart with `docker compose up nuxtjs-dev`

3. **Test Runner Issues**
   - Ensure all dependencies are installed
   - Try clearing Vitest cache: `docker compose run --rm nuxtjs-dev npm run test -- --clearCache`

### Getting Help

If you encounter any issues:
1. Check the error messages in the console
2. Review the Docker logs
3. Ensure all prerequisites are properly installed
4. Verify your Docker environment is functioning correctly

## License

This project is licensed under the MIT License - see the LICENSE file for details.
