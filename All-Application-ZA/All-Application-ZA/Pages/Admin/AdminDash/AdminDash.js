document.addEventListener('DOMContentLoaded', function () {
    // Initialize Bootstrap tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Initialize scrollspy
    var scrollSpy = new bootstrap.ScrollSpy(document.body, {
        target: '#admin-nav'
    });

    // Smooth scrolling for navigation
    document.querySelectorAll('#admin-nav .nav-link').forEach(link => {
        link.addEventListener('click', function (e) {
            e.preventDefault();

            // Remove active class from all links
            document.querySelectorAll('#admin-nav .nav-link').forEach(navLink => {
                navLink.classList.remove('active');
            });

            // Add active class to clicked link
            this.classList.add('active');

            // If this is a parent link, also activate the first child
            if (this.nextElementSibling && this.nextElementSibling.classList.contains('nav')) {
                this.nextElementSibling.querySelector('.nav-link').classList.add('active');
            }

            // Scroll to section
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 20,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Mobile menu toggle (for smaller screens)
    const mobileMenuBtn = document.createElement('button');
    mobileMenuBtn.className = 'btn btn-primary mobile-menu-btn d-lg-none';
    mobileMenuBtn.innerHTML = '<i class="fas fa-bars"></i> Menu';
    mobileMenuBtn.style.position = 'fixed';
    mobileMenuBtn.style.bottom = '20px';
    mobileMenuBtn.style.right = '20px';
    mobileMenuBtn.style.zIndex = '1000';
    mobileMenuBtn.style.borderRadius = '50px';
    mobileMenuBtn.style.padding = '0.75rem 1.5rem';
    mobileMenuBtn.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.2)';

    document.body.appendChild(mobileMenuBtn);

    mobileMenuBtn.addEventListener('click', function () {
        document.querySelector('.sidebar').classList.toggle('active');
    });

    // Close mobile menu when clicking on a link
    document.querySelectorAll('#admin-nav .nav-link').forEach(link => {
        link.addEventListener('click', function () {
            if (window.innerWidth < 992) {
                document.querySelector('.sidebar').classList.remove('active');
            }
        });
    });

    // Highlight active nav item based on scroll position
    window.addEventListener('scroll', function () {
        const scrollPosition = window.scrollY;

        document.querySelectorAll('.content-section').forEach(section => {
            const sectionTop = section.offsetTop - 100;
            const sectionBottom = sectionTop + section.offsetHeight;

            if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
                const id = section.getAttribute('id');
                const navLink = document.querySelector(`#admin-nav .nav-link[href="#${id}"]`);

                if (navLink) {
                    // Remove active class from all links
                    document.querySelectorAll('#admin-nav .nav-link').forEach(link => {
                        link.classList.remove('active');
                    });

                    // Add active class to current link
                    navLink.classList.add('active');

                    // Also activate parent if this is a child link
                    const parentNav = navLink.closest('.nav');
                    if (parentNav && parentNav.previousElementSibling && parentNav.previousElementSibling.classList.contains('nav-link')) {
                        parentNav.previousElementSibling.classList.add('active');
                    }
                }
            }
        });
    });

    // Simulate loading data (in a real app, this would be AJAX calls)
    setTimeout(() => {
        // This is just for demo purposes
        console.log("Admin dashboard initialized");
    }, 500);
});