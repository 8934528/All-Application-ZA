document.addEventListener('DOMContentLoaded', function () {
    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const userNav = document.querySelector('.user-nav');

    if (mobileMenuBtn && userNav) {
        mobileMenuBtn.addEventListener('click', function () {
            this.classList.toggle('active');
            userNav.classList.toggle('active');
        });
    }

    // DOM Elements
    const notificationFilter = document.getElementById('ddlFilter');
    const notificationsList = document.getElementById('notificationsList');
    const notificationItems = document.querySelectorAll('.notification-item');
    const noNotifications = document.getElementById('noNotifications');
    const markAllReadBtn = document.getElementById('btnMarkAllRead');

    // Filter notifications function
    function filterNotifications() {
        const filterValue = notificationFilter.value.toLowerCase();
        let visibleCount = 0;

        notificationItems.forEach(item => {
            const isUnread = item.classList.contains('unread');
            const notificationType = item.classList[2]; // application, system, deadline

            const shouldShow =
                filterValue === 'all' ||
                (filterValue === 'unread' && isUnread) ||
                (filterValue === notificationType);

            item.style.display = shouldShow ? 'flex' : 'none';
            if (shouldShow) visibleCount++;
        });

        // Show/hide no notifications message
        noNotifications.style.display = visibleCount === 0 ? 'block' : 'none';
        notificationsList.style.display = visibleCount === 0 ? 'none' : 'grid';
    }

    // Mark all as read functionality
    if (markAllReadBtn) {
        markAllReadBtn.addEventListener('click', function (e) {
            e.preventDefault();

            notificationItems.forEach(item => {
                item.classList.remove('unread');
                item.style.borderLeft = 'none';
                item.style.backgroundColor = 'white';
            });

            showNotification('All notifications marked as read', 'success');
            filterNotifications();
        });
    }

    // Dismiss notification functionality
    document.querySelectorAll('.dismiss-btn').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const notificationItem = this.closest('.notification-item');

            // Add fade-out animation
            notificationItem.style.animation = 'fadeOut 0.3s forwards';

            // Remove after animation completes
            setTimeout(() => {
                notificationItem.remove();

                // Check if any notifications left
                const remainingItems = document.querySelectorAll('.notification-item');
                if (remainingItems.length === 0) {
                    noNotifications.style.display = 'block';
                    notificationsList.style.display = 'none';
                }
            }, 300);

            showNotification('Notification dismissed', 'info');
        });
    });

    // View application button functionality
    document.querySelectorAll('.view-btn').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const notificationItem = this.closest('.notification-item');
            const notificationTitle = notificationItem.querySelector('h3').textContent.split(' ')[0];

            showNotification(`Redirecting to ${notificationTitle} details...`, 'info');

            // In a real app, this would navigate to the relevant application
            setTimeout(() => {
                window.location.href = '../Applications/MyApplications.aspx';
            }, 1000);
        });
    });

    // Notification toast function
    function showNotification(message, type) {
        const toast = document.createElement('div');
        toast.className = `notification-toast ${type} slide-in`;
        toast.innerHTML = `
            <i class="fas fa-${type === 'success' ? 'check-circle' : 'info-circle'}"></i>
            <span>${message}</span>
            <button class="close-btn"><i class="fas fa-times"></i></button>
        `;

        document.body.appendChild(toast);

        // Auto-remove after 5 seconds
        const autoRemove = setTimeout(() => {
            toast.style.animation = 'fadeOut 0.5s forwards';
            setTimeout(() => toast.remove(), 500);
        }, 5000);

        // Close button
        toast.querySelector('.close-btn').addEventListener('click', () => {
            clearTimeout(autoRemove);
            toast.style.animation = 'fadeOut 0.5s forwards';
            setTimeout(() => toast.remove(), 500);
        });
    }

    // Initialize filter
    if (notificationFilter) {
        notificationFilter.addEventListener('change', filterNotifications);
        filterNotifications();
    }

    // Initialize page with fade-in effect
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease';
    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});