document.addEventListener('DOMContentLoaded', function () {
    // Mobile menu toggle with animation
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const userNav = document.querySelector('.user-nav');

    mobileMenuBtn.addEventListener('click', function () {
        this.classList.toggle('active');
        userNav.classList.toggle('active');

        if (userNav.classList.contains('active')) {
            userNav.style.animation = 'fadeIn 0.5s ease forwards';
        } else {
            userNav.style.animation = 'fadeOut 0.5s ease forwards';
        }
    });

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Search and filter functionality with animations
    const txtSearch = document.getElementById('txtSearch');
    const btnSearch = document.getElementById('btnSearch');
    const universitiesGrid = document.getElementById('universitiesGrid');
    const universityCards = document.querySelectorAll('.university-card');
    const ddlProvince = document.getElementById('ddlProvince');
    const ddlStatus = document.getElementById('ddlStatus');

    function filterUniversities() {
        const searchTerm = txtSearch.value.toLowerCase();
        const provinceFilter = ddlProvince.value;
        const statusFilter = ddlStatus.value;
        let hasResults = false;

        // Add loading animation
        universitiesGrid.innerHTML = `
            <div style="grid-column: 1/-1; text-align: center;">
                <div class="loading-spinner"></div>
            </div>
        `;

        // Simulate loading delay for better UX
        setTimeout(() => {
            universitiesGrid.innerHTML = '';

            universityCards.forEach((card, index) => {
                const universityName = card.querySelector('h3').textContent.toLowerCase();
                const province = card.getAttribute('data-province');
                const status = card.getAttribute('data-status');

                const matchesSearch = universityName.includes(searchTerm);
                const matchesProvince = provinceFilter === '' || province === provinceFilter;
                const matchesStatus = statusFilter === '' || status === statusFilter;

                if (matchesSearch && matchesProvince && matchesStatus) {
                    card.style.display = 'block';
                    universitiesGrid.appendChild(card.cloneNode(true));
                    hasResults = true;

                    // Add staggered animation
                    const newCard = universitiesGrid.lastElementChild;
                    newCard.style.animation = `fadeInUp 0.5s ease forwards ${index * 0.1}s`;
                    newCard.style.opacity = '0';
                } else {
                    card.style.display = 'none';
                }
            });

            if (!hasResults) {
                universitiesGrid.innerHTML = `
                    <div class="no-results animate__animated animate__fadeIn" style="grid-column: 1/-1; text-align: center; padding: 2rem;">
                        <i class="fas fa-university" style="font-size: 3rem; color: #006400; margin-bottom: 1rem;"></i>
                        <h3 style="color: #006400;">No universities found matching your criteria</h3>
                        <p style="color: #555;">Try adjusting your search or filters</p>
                    </div>
                `;
            }
        }, 500);
    }

    // Event listeners with debounce for search input
    let searchTimeout;
    txtSearch.addEventListener('input', function () {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(filterUniversities, 300);
    });

    btnSearch.addEventListener('click', function (e) {
        e.preventDefault();
        filterUniversities();

        // Add button click animation
        this.classList.add('clicked');
        setTimeout(() => this.classList.remove('clicked'), 300);
    });

    ddlProvince.addEventListener('change', filterUniversities);
    ddlStatus.addEventListener('change', filterUniversities);

    // Enhanced card click with ripple effect
    universityCards.forEach(card => {
        card.addEventListener('click', function (e) {
            // Don't trigger if clicking on interactive elements
            if (e.target.tagName === 'BUTTON' ||
                e.target.tagName === 'A' ||
                e.target.parentElement.tagName === 'A') {
                return;
            }

            // Create ripple effect
            const ripple = document.createElement('span');
            ripple.className = 'ripple-effect';
            ripple.style.left = `${e.clientX - this.getBoundingClientRect().left}px`;
            ripple.style.top = `${e.clientY - this.getBoundingClientRect().top}px`;
            this.appendChild(ripple);

            // Remove ripple after animation
            setTimeout(() => ripple.remove(), 600);

            // Show university details (would be replaced with actual navigation)
            const universityName = this.querySelector('h3').textContent;
            console.log(`Selected university: ${universityName}`);
        });
    });

    // Initialize with animation
    setTimeout(() => {
        document.body.style.opacity = '1';
        filterUniversities();
    }, 100);
});

// Add ripple effect style dynamically
const style = document.createElement('style');
style.textContent = `
    .ripple-effect {
        position: absolute;
        border-radius: 50%;
        background-color: rgba(0, 100, 0, 0.3);
        transform: scale(0);
        animation: ripple 0.6s linear;
        pointer-events: none;
        width: 100px;
        height: 100px;
    }
    
    @keyframes ripple {
        to {
            transform: scale(4);
            opacity: 0;
        }
    }
    
    .clicked {
        transform: scale(0.95);
    }
`;
document.head.appendChild(style);

// Initialize page with fade-in effect
document.body.style.opacity = '0';
document.body.style.transition = 'opacity 0.5s ease';

// Update username display
function updateUsernameDisplay() {
    const usernameElements = document.querySelectorAll('.username');
    // In a real app, this would come from user data
    const username = "User Name";

    usernameElements.forEach(element => {
        element.textContent = username;
    });
}

// Call the function when the page loads
document.addEventListener('DOMContentLoaded', updateUsernameDisplay);

// Application stats interaction
document.querySelectorAll('.stat-card').forEach(card => {
    card.addEventListener('click', function () {
        // In a real app, this would navigate to the relevant section
        const statType = this.querySelector('.stat-label').textContent.toLowerCase();
        console.log(`Viewing ${statType} applications`);
    });
});