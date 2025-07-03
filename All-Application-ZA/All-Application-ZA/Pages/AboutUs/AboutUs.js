document.addEventListener('DOMContentLoaded', function () {
    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const mainNav = document.querySelector('.main-nav');

    mobileMenuBtn.addEventListener('click', function () {
        this.classList.toggle('active');
        mainNav.classList.toggle('active');
    });

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Animate stats counter
    function animateValue(id, start, end, duration) {
        const obj = document.getElementById(id);
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            const value = Math.floor(progress * (end - start) + start);
            obj.innerHTML = id === 'success-rate' ? value + '%' : value;
            if (progress < 1) {
                window.requestAnimationFrame(step);
            }
        };
        window.requestAnimationFrame(step);

        // Add animation class
        obj.classList.add('animate-count');
    }

    // Intersection Observer for animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                // Trigger stats animation when stats section is visible
                if (entry.target.classList.contains('stats-section')) {
                    animateValue('students-helped', 0, 12500, 2000);
                    animateValue('universities', 0, 26, 1500);
                    animateValue('success-rate', 0, 98, 2500);
                }

                // Add animation class to visible elements
                entry.target.classList.add('animate__animated');

                // For elements that should only animate once
                if (!entry.target.classList.contains('repeat-animation')) {
                    observer.unobserve(entry.target);
                }
            }
        });
    }, observerOptions);

    // Observe all sections with animations
    document.querySelectorAll('.animate__animated').forEach(section => {
        observer.observe(section);
    });

    // Scroll down button
    const scrollDownBtn = document.querySelector('.scroll-down');
    if (scrollDownBtn) {
        scrollDownBtn.addEventListener('click', function () {
            window.scrollTo({
                top: document.querySelector('.mission-section').offsetTop - 80,
                behavior: 'smooth'
            });
        });
    }

    // Initialize page with fade-in effect
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';
    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});

// Add ripple effect to team cards
document.addEventListener('DOMContentLoaded', function () {
    const teamCards = document.querySelectorAll('.team-card');

    teamCards.forEach(card => {
        card.addEventListener('click', function (e) {
            // Don't trigger if clicking on social links
            if (e.target.tagName === 'A' || e.target.parentElement.tagName === 'A') {
                return;
            }

            const ripple = document.createElement('span');
            ripple.className = 'ripple-effect';
            ripple.style.left = `${e.clientX - this.getBoundingClientRect().left}px`;
            ripple.style.top = `${e.clientY - this.getBoundingClientRect().top}px`;
            this.appendChild(ripple);

            setTimeout(() => ripple.remove(), 600);
        });
    });
});

// Add ripple effect style
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
`;
document.head.appendChild(style);
