# Acme Dashboard - Next.js App Router

A modern, full-featured dashboard application built with Next.js 15 and the App Router, following the official [Next.js Learn Course](https://nextjs.org/learn).

🔗 **Live Demo**: [https://nextjs-dashboard-five-sepia-97.vercel.app/](https://nextjs-dashboard-five-sepia-97.vercel.app/)

## ✨ Features

- **📊 Dashboard Overview** - Real-time statistics cards, revenue charts, and latest invoices
- **📝 Invoice Management** - Full CRUD operations with search, filtering, and pagination
- **👥 Customer Management** - Comprehensive customer listing with detailed information
- **🔐 Authentication** - Secure login system powered by NextAuth.js v5
- **🎨 Responsive Design** - Optimized for all screen sizes (mobile, tablet, desktop)
- **⚡ Server Actions** - Modern data mutations without API routes
- **🔄 Streaming UI** - Progressive rendering with React Suspense
- **✅ Form Validation** - Type-safe validation using Zod
- **🐳 Docker Ready** - Complete containerization setup

## 🛠️ Tech Stack

- **Framework**: [Next.js 15](https://nextjs.org/) (App Router + Turbopack)
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **Database**: PostgreSQL (Neon)
- **Authentication**: NextAuth.js v5 (Beta)
- **Validation**: Zod
- **Icons**: Heroicons v2
- **Password Hashing**: bcrypt
- **Deployment**: Vercel / Docker

## 📁 Project Structure

```

app/
├── page.tsx # Landing page
├── layout.tsx # Root layout with metadata
├── login/
│ └── page.tsx # Login page
├── dashboard/
│ ├── layout.tsx # Dashboard layout with sidebar
│ ├── (overview)/ # Dashboard overview (route group)
│ │ ├── page.tsx # Main dashboard
│ │ └── loading.tsx # Loading skeleton
│ ├── invoices/
│ │ ├── page.tsx # Invoice list with search & pagination
│ │ ├── error.tsx # Error boundary
│ │ ├── create/ # Create new invoice
│ │ └── [id]/edit/ # Edit invoice (dynamic route)
│ └── customers/
│ └── page.tsx # Customer list
├── lib/
│ ├── actions.ts # Server Actions for mutations
│ ├── data.ts # Database queries
│ ├── definitions.ts # TypeScript type definitions
│ ├── placeholder-data.ts # Seed data
│ └── utils.ts # Helper functions
├── ui/ # Reusable UI components
│ ├── dashboard/ # Dashboard-specific components
│ ├── invoices/ # Invoice-related components
│ ├── customers/ # Customer-related components
│ └── ... # Shared components
├── query/
│ └── route.ts # API route for queries
└── seed/
└── route.ts # Database seeding endpoint

```

## 🚀 Getting Started

### Prerequisites

- **Node.js** 20.x or higher
- **pnpm** (recommended) or npm
- **PostgreSQL** database (or use [Neon](https://neon.tech/))

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/sulhanfuadi/nextjs-dashboard.git
   cd nextjs-dashboard
   ```

2. **Install dependencies**:

   ```bash
   pnpm install
   ```

3. **Set up environment variables**:

   ```bash
   cp .env.example .env
   ```

   Fill in your `.env` file:

   ```env
   # Database (Neon PostgreSQL)
   POSTGRES_URL=postgresql://username:password@host/database?sslmode=require

   # Authentication (generate with: openssl rand -base64 32)
   AUTH_SECRET=your_secret_key_here
   AUTH_URL=http://localhost:3000/api/auth
   ```

4. **Seed the database** (optional):

   After starting the dev server, visit:

   ```
   http://localhost:3000/seed
   ```

5. **Start development server**:

   ```bash
   pnpm dev
   ```

6. **Open the app**:

   Navigate to [http://localhost:3000](http://localhost:3000)

### Default Login Credentials

After seeding the database, you can login with:

- **Email**: `user@nextmail.com`
- **Password**: `123456`

## 🐳 Docker Deployment

### Using Docker Compose

1. **Create Docker environment file**:

   ```bash
   cp .env.docker.example .env.docker
   ```

   Update `.env.docker` with your credentials.

2. **Build and run**:

   ```bash
   docker-compose up -d
   ```

   Or use the provided scripts:

   ```bash
   # Windows
   .\scripts\docker-start.bat

   # Background mode
   .\scripts\docker-start-bg.bat
   ```

3. **Access the app**:

   Open [http://localhost:3000](http://localhost:3000)

### Available Docker Scripts

| Script                | Description                   |
| --------------------- | ----------------------------- |
| `docker-start.bat`    | Start container in foreground |
| `docker-start-bg.bat` | Start container in background |
| `docker-stop.bat`     | Stop running container        |
| `docker-rebuild.bat`  | Rebuild image from scratch    |
| `docker-logs.bat`     | View container logs           |
| `docker-clean.bat`    | Clean up Docker resources     |

## 📜 Available Scripts

| Command      | Description                             |
| ------------ | --------------------------------------- |
| `pnpm dev`   | Start development server with Turbopack |
| `pnpm build` | Build production bundle                 |
| `pnpm start` | Start production server                 |
| `pnpm lint`  | Run ESLint checks                       |

## 🔐 Authentication & Authorization

This application uses **NextAuth.js v5** with a Credentials provider:

- **Public routes**: `/`, `/login`
- **Protected routes**: All `/dashboard/*` routes
- **Middleware**: Automatic redirect to `/login` for unauthenticated users
- **Password hashing**: bcrypt for secure password storage

## 🎓 Learning Concepts

This project implements key concepts from the Next.js Learn Course:

### Core Features

- ✅ **App Router** - File-based routing with layouts and route groups
- ✅ **Server Components** - Default server rendering for better performance
- ✅ **Client Components** - Interactive components with `'use client'`
- ✅ **Data Fetching** - Async/await directly in components
- ✅ **Streaming** - Progressive UI rendering with Suspense boundaries

### Advanced Features

- ✅ **Server Actions** - Form mutations without API routes
- ✅ **Optimistic Updates** - Instant UI feedback with `useOptimistic`
- ✅ **Error Handling** - Error boundaries with `error.tsx`
- ✅ **Loading States** - Skeleton UIs with `loading.tsx`
- ✅ **Form Validation** - Type-safe validation with Zod
- ✅ **URL Search Params** - Shareable search and filter states
- ✅ **Pagination** - Efficient large dataset handling
- ✅ **Middleware** - Route protection and authentication
- ✅ **Not Found Pages** - Custom 404 pages with `not-found.tsx`

## 🏗️ Database Schema

The application uses PostgreSQL with the following main tables:

- **users** - User authentication data
- **customers** - Customer information
- **invoices** - Invoice records
- **revenue** - Monthly revenue data

## 🎨 UI Components

Built with reusable, composable components:

- **Cards** - Dashboard statistics cards
- **Charts** - Revenue visualization
- **Tables** - Paginated data tables
- **Forms** - Create and edit forms
- **Search** - Debounced search input
- **Pagination** - Navigation controls
- **Breadcrumbs** - Navigation hierarchy
- **Skeletons** - Loading placeholders

## 🌐 Deployment

### Vercel (Recommended)

1. Push your code to GitHub
2. Import project in [Vercel](https://vercel.com)
3. Add environment variables
4. Deploy!

### Docker

Use the provided Dockerfile and docker-compose.yml for containerized deployment.

## 📖 Resources

- [Next.js Documentation](https://nextjs.org/docs)
- [Next.js Learn Course](https://nextjs.org/learn)
- [NextAuth.js Documentation](https://authjs.dev/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Heroicons](https://heroicons.com/)
- [Neon PostgreSQL](https://neon.tech/)

## 🤝 Contributing

This is a learning project following the official Next.js course. Feel free to fork and experiment!

## 📄 License

This project is created for educational purposes based on the [Next.js Learn Course](https://nextjs.org/learn).

---

**Built with ❤️ using Next.js**

```

```
