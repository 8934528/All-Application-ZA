document.addEventListener('DOMContentLoaded', function () {
    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const userNav = document.querySelector('.user-nav');

    mobileMenuBtn.addEventListener('click', function () {
        this.classList.toggle('active');
        userNav.classList.toggle('active');
    });

    // Filter applications by status
    const statusFilter = document.getElementById('ddlStatusFilter');
    const applicationsList = document.getElementById('applicationsList');
    const applicationCards = document.querySelectorAll('.application-card');
    const noApplications = document.getElementById('noApplications');

    function filterApplications() {
        const selectedStatus = statusFilter.value.toLowerCase();
        let visibleCount = 0;

        applicationCards.forEach(card => {
            const cardStatus = card.classList[1]; // Get the status class (submitted, processing, etc.)

            if (selectedStatus === 'all' || cardStatus === selectedStatus) {
                card.style.display = 'block';
                visibleCount++;
            } else {
                card.style.display = 'none';
            }
        });

        // Show/hide no applications message
        if (visibleCount === 0) {
            noApplications.style.display = 'block';
            applicationsList.style.display = 'none';
        } else {
            noApplications.style.display = 'none';
            applicationsList.style.display = 'grid';
        }
    }

    // Initialize filter
    filterApplications();

    // Add event listener for filter change
    statusFilter.addEventListener('change', filterApplications);

    // Refresh button functionality
    const refreshBtn = document.getElementById('btnRefresh');
    refreshBtn.addEventListener('click', function (e) {
        e.preventDefault();
        // Simulate refresh with a loading animation
        this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Refreshing...';

        setTimeout(() => {
            this.innerHTML = 'Refresh';
            filterApplications();
            // Show a temporary notification
            showNotification('Applications refreshed successfully', 'success');
        }, 1500);
    });

    // View details button functionality
    document.querySelectorAll('.view-btn').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            // In a real app, this would navigate to application details
            const card = this.closest('.application-card');
            const universityName = card.querySelector('h3').textContent;
            showNotification(`Viewing details for ${universityName} application`, 'info');
        });
    });

    // Accept/Decline offer functionality
    document.querySelectorAll('.accept-btn, .decline-btn').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const action = this.classList.contains('accept-btn') ? 'accept' : 'decline';
            const card = this.closest('.application-card');
            const universityName = card.querySelector('h3').textContent;

            if (action === 'accept') {
                if (confirm(`Are you sure you want to accept the offer from ${universityName}?`)) {
                    showNotification(`Offer from ${universityName} accepted successfully`, 'success');
                    // Update UI
                    card.querySelector('.status-badge').textContent = 'Accepted';
                    card.querySelector('.status-badge').className = 'status-badge accepted';
                }
            } else {
                if (confirm(`Are you sure you want to decline the offer from ${universityName}?`)) {
                    showNotification(`Offer from ${universityName} declined`, 'info');
                    // Update UI
                    card.querySelector('.status-badge').textContent = 'Declined';
                    card.querySelector('.status-badge').className = 'status-badge rejected';
                }
            }
        });
    });

    // Browse universities button functionality
    const browseBtn = document.getElementById('btnBrowseUniversities');
    if (browseBtn) {
        browseBtn.addEventListener('click', function (e) {
            e.preventDefault();
            // In a real app, this would navigate to universities page
            showNotification('Redirecting to universities page...', 'info');
            setTimeout(() => {
                window.location.href = '../Dashboard/UserDash.aspx';
            }, 1000);
        });
    }

    // Notification function
    function showNotification(message, type) {
        const notification = document.createElement('div');
        notification.className = `notification ${type}`;
        notification.innerHTML = `
            <i class="fas fa-${type === 'success' ? 'check-circle' : 'info-circle'}"></i>
            <span>${message}</span>
            <button class="close-btn"><i class="fas fa-times"></i></button>
        `;

        document.body.appendChild(notification);

        // Auto-remove after 5 seconds
        setTimeout(() => {
            notification.classList.add('fade-out');
            setTimeout(() => {
                notification.remove();
            }, 300);
        }, 5000);

        // Close button
        notification.querySelector('.close-btn').addEventListener('click', () => {
            notification.classList.add('fade-out');
            setTimeout(() => {
                notification.remove();
            }, 300);
        });
    }

    // Add notification styles dynamically
    const style = document.createElement('style');
    style.textContent = `
        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 15px 20px;
            border-radius: 5px;
            color: white;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            transform: translateX(100%);
            animation: slideIn 0.3s forwards;
        }
        
        .notification.success {
            background-color: #4CAF50;
        }
        
        .notification.info {
            background-color: #2196F3;
        }
        
        .notification.error {
            background-color: #F44336;
        }
        
        .notification .close-btn {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            margin-left: 10px;
        }
        
        @keyframes slideIn {
            to {
                transform: translateX(0);
            }
        }
        
        .fade-out {
            animation: fadeOut 0.3s forwards;
        }
        
        @keyframes fadeOut {
            to {
                opacity: 0;
                transform: translateY(20px);
            }
        }
    `;
    document.head.appendChild(style);

    // Initialize page with fade-in effect
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';
    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});