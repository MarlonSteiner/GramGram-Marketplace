# GramGram

A Ruby on Rails marketplace where you can “rent a grandma 👵🏻”  
Pixar-style grandmas with quirky stats like teeth, speed, health and age. Makes for a hilarious, collectible experience.
Japan inspired concept 🎌

<p align="center">
  <a href="#preview">Preview</a> •
  <a href="#value-proposition">Value Proposition</a> •
  <a href="#the-idea">The Idea</a> •
  <a href="#features">Features</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#how-it-works">How It Works</a> •
  <a href="#tech-stack">Tech Stack</a> •
  <a href="#roadmap">Roadmap</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#team">Team</a> •
  <a href="#license">License</a> •
  <a href="#repo-about-and-topics">Repo About & Topics</a>
</p>

## Preview
<img width="1198" height="636" alt="Screenshot 2025-09-23 at 19 33 17" src="https://github.com/user-attachments/assets/a59e4f94-7ece-4279-a5e9-423d5d044e08" />


## Value Proposition
Many people never get to experience life with a grandparent—maybe their grandparents passed away early or live far away.  
GramGram lets anyone “rent a grandma” for company, advice, or just a good laugh.


## The Idea
Inspired by rental-person services in Japan, we created a marketplace where each grandma is an AI-generated Pixar character with her own **stats**:  
- **Speed**  
- **Health**  
- **Wisdom**
- **Teeth**

We imagined them becoming collectible cards and even battling each other in the future!


## Features
- **Browse & Book**: Choose from a lineup of unique grandmas with distinct personalities and stats.
- **Pixar-style Art**: Every grandma image was generated with Midjourney for a playful animated vibe.
- **Profile Stats**: Teeth count, speed rating, and age displayed like RPG characters.
- **Messaging & Booking**: Rails marketplace flow with authentication and bookings.

> Built with **Ruby on Rails** during the **Le Wagon Web Development Bootcamp**.

## Quick Start
**Prerequisites**: Ruby 3.x, Rails 7, Node.js, Yarn or Bun, SQLite or PostgreSQL, Git.

```bash
# 1) Clone
git clone https://github.com/<your-username>/gramgram.git
cd gramgram

# 2) Install dependencies
bundle install
yarn install

# 3) Database
bin/rails db:setup

# 4) Run the app
bin/rails server
# or with foreman/bin/dev
# bin/dev

```
### Important
Never commit real API keys (if using any). Use `.env` and ensure `.gitignore` excludes it.

## How It Works
1. **List Grandmas** – Admins create grandma profiles with stats and Midjourney artwork.  
2. **Browse & Rent** – Users sign up, explore grandmas, and book time.  
3. **Interact** – Users can message their chosen grandma (future feature: collectible battles!).

## Tech Stack
- **Ruby on Rails 7**  
- **PostgreSQL** (production) / **SQLite** (development)  
- **Devise** for authentication  
- **Cloudinary / Active Storage** for image hosting  
- **Stimulus / Turbo** for interactivity

## Roadmap
- [ ] Add grandma collectibles & trading cards  
- [ ] Grandma battle mini-game  
- [ ] Real-time chat with booked grandmas  
- [ ] Payment integration

## Contributing
PRs are welcome! Open an issue to propose features or bug fixes.

## Team
- **Marlon Steiner**  
- **Italo De Campo**

## License
MIT

## Repo About and Topics
Use this short About text in the GitHub sidebar:

> A Ruby on Rails marketplace where you can rent Pixar-style grandmas with quirky stats—fun, funny, and delightfully absurd.

Suggested topics: `rails`, `ruby`, `marketplace`, `grandma`, `midjourney`, `fun-project`, `lewagon`.

