import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]
  static values = { grannies: Array }  // ADD THIS LINE

  connect() {
    console.log("Granny carousel connected!")
    this.currentCategory = 'all'
    this.currentFilter = 'all'
    this.favorites = new Set()

    // REPLACE the loadRealGrannies section with this:
    // Use grannies passed from Rails via Stimulus values
    if (this.granniesValue && this.granniesValue.length > 0) {
      this.granniesData = this.granniesValue
      console.log("Using grannies from Rails Stimulus values:", this.granniesData.length)
    } else {
      console.log("No grannies from Stimulus values, trying API...")
      this.loadRealGrannies()
    }
    this.renderContent()
  }

  async loadRealGrannies() {
    try {
      // Fetch grannies from your Rails controller
      const response = await fetch('/grannies.json')
      this.granniesData = await response.json()
      console.log("Loaded grannies from database:", this.granniesData.length)
      this.renderContent()
    } catch (error) {
      console.error('Failed to load grannies from database:', error)
      // Fallback: try to get grannies passed from Rails
      this.loadGranniesFromRails()
    }
  }

  loadGranniesFromRails() {
    // Alternative: Get grannies passed from your Rails controller
    if (window.granniesData) {
      this.granniesData = window.granniesData
      console.log("Using grannies from Rails:", this.granniesData.length)
    } else {
      console.error("No grannies data found!")
      this.granniesData = []
    }
    this.renderContent()
  }

  renderContent() {
    console.log("renderContent called!")
    const container = document.getElementById('carousel-container')
    console.log("Container found:", container)

    if (!container) {
      console.error("Carousel container not found!")
      return
    }

    const filteredGrannies = this.getFilteredGrannies()
    console.log("Filtered grannies:", filteredGrannies)

    if (filteredGrannies.length === 0) {
      container.innerHTML = this.createNoResultsHTML()
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

    console.log("Categories:", categories)

    // Render carousels
    let html = ''
    Object.keys(categories).forEach(categoryName => {
      html += this.createCarouselSection(categoryName, categories[categoryName])
    })

    console.log("Generated HTML:", html.substring(0, 200) + "...")
    container.innerHTML = html
    console.log("HTML inserted into container")
  }

  getFilteredGrannies() {
    if (!this.granniesData) return []

    let filtered = [...this.granniesData]

    // Apply category filter (from category navigation OR search)
    if (this.currentCategory !== 'all') {
      filtered = filtered.filter(granny => granny.category === this.currentCategory)
    }

    // Apply search filters if they exist
    if (this.searchCriteria) {
      // Category filter from search
      if (this.searchCriteria.category) {
        filtered = filtered.filter(granny => granny.category === this.searchCriteria.category)
      }

      // Price filter from search
      if (this.searchCriteria.maxPrice) {
        const maxPrice = parseInt(this.searchCriteria.maxPrice)
        filtered = filtered.filter(granny => granny.price <= maxPrice)
      }

      // Date availability filter (for now, just filter available grannies)
      // Later you can add proper date checking logic
      if (this.searchCriteria.checkin && this.searchCriteria.checkout) {
        filtered = filtered.filter(granny => granny.available === true)
      }
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

    // Debug: Log the image information
    console.log(`Granny ${granny.name}:`, {
      image_key: granny.image_key,
      image_url: granny.image_url,
      has_image_key: !!granny.image_key,
      has_image_url: !!granny.image_url
    })

    // Use the image_url approach first
    const imageUrl = granny.image_url

    return `
      <div class="granny-card" data-id="${granny.id}" data-action="click->granny-carousel#showDetails">
        <div class="card-image-container">
          ${imageUrl ?
            `<img src="${imageUrl}" alt="${granny.name}" class="card-image" onload="console.log('Image loaded for ${granny.name}')" onerror="console.log('Image failed for ${granny.name}:', this.src)">` :
            `<div style="background: #f0f0f0; display: flex; align-items: center; justify-content: center; height: 250px; color: #999;">No Image</div>`
          }
          <button class="heart-button" data-action="click->granny-carousel#toggleFavorite" data-granny-id="${granny.id}">
            ${heartFilled ? '❤️' : '🤍'}
          </button>
          <div class="availability-badge ${granny.available ? '' : 'unavailable'}">
            ${granny.available ? 'Available' : 'Unavailable'}
          </div>
        </div>
        <div class="card-content">
          <div class="card-header">
            <h4 class="granny-name">${granny.name}${superhostBadge}</h4>
            <div class="rating">
              <span class="star-icon">★</span>
              <span class="rating-number">${granny.rating}.0</span>
            </div>
          </div>
          <div class="location">${granny.location}</div>
          <div class="granny-bio">${granny.bio}</div>

          <div class="granny-stats">
            <div class="stat">
              <div class="stat-value">${granny.stats_speed}/10</div>
              <div class="stat-label">Speed</div>
            </div>
            <div class="stat">
              <div class="stat-value">${granny.stats_health}/10</div>
              <div class="stat-label">Health</div>
            </div>
            <div class="stat">
              <div class="stat-value">${granny.stats_wisdom}/10</div>
              <div class="stat-label">Wisdom</div>
            </div>
            <div class="stat">
              <div class="stat-value">${granny.stats_teeth}/10</div>
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
      <div style="text-align: center; padding: 3rem; color: #666;">
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
    window.location.href = `/grannies/${grannyId}`
  }

  filterByCategory(category) {
    this.currentCategory = category
    this.renderContent()
  }

  applySearchFilters(searchCriteria) {
    console.log("Applying search filters:", searchCriteria)

    // Store the search criteria
    this.searchCriteria = searchCriteria

    // Re-render with filters applied
    this.renderContent()
  }
}
