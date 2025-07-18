import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    console.log("Granny carousel connected!")
    this.currentCategory = 'all'
    this.currentFilter = 'all'
    this.favorites = new Set()

    // Sample data (we'll connect to your database later)
    this.granniesData = [
      {
        id: 1, name: "Yuki Sato", location: "Tokyo, Japan", price: 75, category: "cat-lovers",
        bio: "Cat lover from Japan who has rescued many street cats. I teach origami.",
        available: true, stats_speed: 3, stats_health: 8, stats_wisdom: 9, stats_teeth: 6,
        superhost: true, rating: 4, review_count: 23, age: 72
      },
      {
        id: 2, name: "Sakura Nakamura", location: "Tokyo, Japan", price: 110, category: "chefs",
        bio: "Master chef specializing in traditional Japanese cuisine.",
        available: true, stats_speed: 6, stats_health: 9, stats_wisdom: 8, stats_teeth: 9,
        superhost: true, rating: 5, review_count: 45, age: 69
      },
      {
        id: 3, name: "Tomoko Yamamoto", location: "Kyoto, Japan", price: 95, category: "healers",
        bio: "Traditional healer specializing in herbal medicine and acupuncture.",
        available: true, stats_speed: 5, stats_health: 10, stats_wisdom: 9, stats_teeth: 7,
        superhost: true, rating: 5, review_count: 51, age: 71
      }
    ]

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

    // Apply category filter
    if (this.currentCategory !== 'all') {
      filtered = filtered.filter(granny => granny.category === this.currentCategory)
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

    // Use the image.key format like your ERB template
    const imageUrl = granny.image ? `https://res.cloudinary.com/YOUR_CLOUD_NAME/image/upload/c_fill,h_250,w_300/${granny.image}` : null

    return `
      <div class="granny-card" data-id="${granny.id}" data-action="click->granny-carousel#showDetails">
        <div class="card-image-container">
          ${imageUrl
            ? `<img src="${imageUrl}" alt="${granny.name}" class="card-image" onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">`
            : ''
          }
          <div class="card-placeholder" ${imageUrl ? 'style="display: none;"' : ''}>👵</div>
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
}
