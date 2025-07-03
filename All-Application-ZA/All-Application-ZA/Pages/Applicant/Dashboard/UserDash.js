document.addEventListener('DOMContentLoaded', function () {
    // Initialize user data display
    initializeUserData();

    // Mobile menu toggle with animation
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const userNav = document.querySelector('.user-nav');

    if (mobileMenuBtn && userNav) {
        mobileMenuBtn.addEventListener('click', function () {
            this.classList.toggle('active');
            userNav.classList.toggle('active');

            if (userNav.classList.contains('active')) {
                userNav.style.animation = 'fadeIn 0.5s ease forwards';
            } else {
                userNav.style.animation = 'fadeOut 0.5s ease forwards';
            }
        });
    }

    // Search and filter functionality with animations
    const txtSearch = document.getElementById('txtSearch');
    const btnSearch = document.getElementById('btnSearch');
    const universitiesGrid = document.getElementById('universitiesGrid');
    const universityCards = document.querySelectorAll('.university-card');
    const ddlProvince = document.getElementById('ddlProvince');
    const ddlStatus = document.getElementById('ddlStatus');

    if (txtSearch && btnSearch && universitiesGrid) {
        function filterUniversities() {
            const searchTerm = txtSearch.value.toLowerCase();
            const provinceFilter = ddlProvince ? ddlProvince.value : '';
            const statusFilter = ddlStatus ? ddlStatus.value : '';
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

        if (btnSearch) {
            btnSearch.addEventListener('click', function (e) {
                e.preventDefault();
                filterUniversities();

                // Add button click animation
                this.classList.add('clicked');
                setTimeout(() => this.classList.remove('clicked'), 300);
            });
        }

        if (ddlProvince) ddlProvince.addEventListener('change', filterUniversities);
        if (ddlStatus) ddlStatus.addEventListener('change', filterUniversities);
    }

    // Enhanced card click with ripple effect
    if (universitiesGrid) {
        universitiesGrid.addEventListener('click', function (e) {
            const card = e.target.closest('.university-card');
            if (!card) return;

            // Don't trigger if clicking on interactive elements
            if (e.target.tagName === 'BUTTON' ||
                e.target.tagName === 'A' ||
                e.target.parentElement.tagName === 'A') {
                return;
            }

            const ripple = document.createElement('span');
            ripple.className = 'ripple-effect';
            ripple.style.left = `${e.clientX - card.getBoundingClientRect().left}px`;
            ripple.style.top = `${e.clientY - card.getBoundingClientRect().top}px`;
            card.appendChild(ripple);

            setTimeout(() => ripple.remove(), 600);

            // Show university details 
            const universityName = card.querySelector('h3').textContent;
            console.log(`Selected university: ${universityName}`);
        });
    }

    // Initialize with animation
    setTimeout(() => {
        document.body.style.opacity = '1';
        if (universitiesGrid) filterUniversities();
    }, 100);
});

// user data display
function initializeUserData() {
    updateUsernameDisplay();
    updateApplicationStats();
}

function updateUsernameDisplay() {
    const usernameElements = document.querySelectorAll('.username');
    const firstName = "User"; 

    usernameElements.forEach(element => {
        element.textContent = firstName;
    });
}

function updateApplicationStats() {
    // This comes from an API call
    const stats = {
        submitted: 3,
        pending: 2,
        interested: 5
    };

    document.querySelectorAll('.stat-number').forEach(element => {
        const statType = element.nextElementSibling.textContent.toLowerCase();
        if (stats[statType] !== undefined) {
            element.textContent = stats[statType];
        }
    });
}

// Add ripple effect style dynamically
const rippleStyle = document.createElement('style');
rippleStyle.textContent = `
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
    
    .loading-spinner {
        border: 4px solid rgba(0, 100, 0, 0.1);
        border-radius: 50%;
        border-top: 4px solid #006400;
        width: 40px;
        height: 40px;
        animation: spin 1s linear infinite;
        margin: 0 auto;
    }
    
    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
`;
document.head.appendChild(rippleStyle);

document.body.style.opacity = '0';
document.body.style.transition = 'opacity 0.5s ease';