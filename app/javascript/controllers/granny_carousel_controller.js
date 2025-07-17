import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  async connect() {
  this.currentCategory = 'all'
  this.currentFilter = 'all'
  this.favorites = new Set()

  // Fetch from your Rails API
  await this.loadGrannies()
    this.renderContent()
  }

  async loadGrannies() {
    try {
      const response = await fetch('/api/grannies')
      this.granniesData = await response.json()
    } catch (error) {
      console.error('Failed to load grannies:', error)
      // Keep sample data as fallback
    }
  }

  connect() {
    this.currentCategory = 'all'
    this.currentFilter = 'all'
    this.favorites = new Set()
    this.renderContent()
  }

  renderContent() {
    const filteredGrannies = this.getFilteredGrannies()

    if (filteredGrannies.length === 0) {
      this.containerTarget.innerHTML = this.createNoResultsHTML()
      return
    }

    // Group by category
    const categories = {}
    filteredGrannies.forEach(granny => {
      const categoryName = this.getCategoryDisplayName(granny.category)
      if (!categories[categoryName]) {
        categories[categoryName] = []
      }
      categories[categoryName].push(granny)
    })

    // Render carousels
    let html = ''
    Object.keys(categories).forEach(categoryName => {
      html += this.createCarouselSection(categoryName, categories[categoryName])
    })

    this.containerTarget.innerHTML = html
  }

  getFilteredGrannies() {
    let filtered = [...this.granniesData]

    // Apply category filter
    if (this.currentCategory !== 'all') {
      filtered = filtered.filter(granny => granny.category === this.currentCategory)
    }

    // Apply additional filters
    switch (this.currentFilter) {
      case 'available':
        filtered = filtered.filter(granny => granny.availability === 'available')
        break
      case 'price-low':
        filtered = filtered.filter(granny => granny.price < 100)
        break
      case 'price-high':
        filtered = filtered.filter(granny => granny.price >= 150)
        break
      case 'high-rated':
        filtered = filtered.filter(granny => granny.superhost)
        break
    }

    return filtered
  }

  getCategoryDisplayName(category) {
    const names = {
      'cat-lovers': 'Grannies who love cats',
      'chefs': 'Master chef grannies',
      'healers': 'Healing & wellness grannies',
      'adventurers': 'World traveler grannies',
      'crafters': 'Arts & crafts grannies',
      'book-lovers': 'Literary & educational grannies'
    }
    return names[category] || category
  }

  createCarouselSection(categoryName, grannies) {
    const carouselId = categoryName.replace(/\s+/g, '-').toLowerCase()

    return `
      <div class="carousel-section">
        <div class="carousel-header">
          <h3 class="carousel-title">${categoryName}</h3>
          <div class="carousel-nav">
            <button class="nav-button" data-action="click->granny-carousel#scrollLeft" data-carousel="${carouselId}">
              ←
            </button>
            <button class="nav-button" data-action="click->granny-carousel#scrollRight" data-carousel="${carouselId}">
              →
            </button>
          </div>
        </div>
        <div class="card-grid" id="grid-${carouselId}">
          ${grannies.map(granny => this.createGrannyCard(granny)).join('')}
        </div>
      </div>
    `
  }

  createGrannyCard(granny) {
    const heartFilled = this.favorites.has(granny.id)
    const superhostBadge = granny.superhost ? '<span class="superhost-badge">SUPERHOST</span>' : ''

    return `
      <div class="granny-card" data-id="${granny.id}" data-action="click->granny-carousel#showDetails">
        <div class="card-image-container">
          <img src="${granny.image}" alt="${granny.name}" class="card-image">
          <button class="heart-button" data-action="click->granny-carousel#toggleFavorite" data-granny-id="${granny.id}">
            ${heartFilled ? '❤️' : '🤍'}
          </button>
          <div class="availability-indicator ${granny.availability}">
            ${granny.availability === 'available' ? 'Available' : 'Unavailable'}
          </div>
        </div>
        <div class="card-content">
          <div class="card-header">
            <h4 class="granny-name">${granny.name}${superhostBadge}</h4>
            <div class="rating">
              <span class="star-icon">★</span>
              <span class="rating-number">${granny.rating}</span>
            </div>
          </div>
          <div class="location">${granny.location}</div>
          <div class="granny-bio">${granny.bio}</div>

          <div class="granny-stats">
            <div class="stat">
              <div class="stat-value">${granny.stats.speed}/10</div>
              <div class="stat-label">Speed</div>
            </div>
            <div class="stat">
              <div class="stat-value">${granny.stats.health}/10</div>
              <div class="stat-label">Health</div>
            </div>
            <div class="stat">
              <div class="stat-value">${granny.stats.wisdom}/10</div>
              <div class="stat-label">Wisdom</div>
            </div>
            <div class="stat">
              <div class="stat-value">${granny.stats.teeth}/10</div>
              <div class="stat-label">Teeth</div>
            </div>
          </div>

          <div class="price-container">
            <div class="price">
              $${granny.price} <span class="price-period">USD night</span>
            </div>
          </div>
        </div>
      </div>
    `
  }

  createNoResultsHTML() {
    return `
      <div class="no-results">
        <h3>No grannies found</h3>
        <p>Try adjusting your search or removing filters</p>
      </div>
    `
  }

  scrollLeft(event) {
    const carouselId = event.currentTarget.dataset.carousel
    const grid = document.getElementById(`grid-${carouselId}`)
    if (grid) {
      grid.scrollBy({ left: -300, behavior: 'smooth' })
    }
  }

  scrollRight(event) {
    const carouselId = event.currentTarget.dataset.carousel
    const grid = document.getElementById(`grid-${carouselId}`)
    if (grid) {
      grid.scrollBy({ left: 300, behavior: 'smooth' })
    }
  }

  toggleFavorite(event) {
    event.stopPropagation()
    const grannyId = parseInt(event.currentTarget.dataset.grannyId)

    if (this.favorites.has(grannyId)) {
      this.favorites.delete(grannyId)
    } else {
      this.favorites.add(grannyId)
    }

    this.renderContent()
  }

  showDetails(event) {
    const grannyId = event.currentTarget.dataset.id
    // Navigate to granny show page
    window.location.href = `/grannies/${grannyId}`
  }

  // Methods called by other controllers
  filterByCategory(category) {
    this.currentCategory = category
    this.renderContent()
  }

  filterByType(filter) {
    this.currentFilter = filter
    this.renderContent()
  }
}
