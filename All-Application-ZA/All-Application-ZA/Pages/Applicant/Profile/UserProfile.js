document.addEventListener('DOMContentLoaded', function () {
    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const userNav = document.querySelector('.user-nav');

    mobileMenuBtn.addEventListener('click', function () {
        this.classList.toggle('active');
        userNav.classList.toggle('active');
    });

    // Profile picture upload preview
    const fileUpload = document.querySelector('.file-upload');
    const profileImg = document.getElementById('profileImg');

    fileUpload.addEventListener('change', function (e) {
        if (this.files && this.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                profileImg.src = e.target.result;
                showNotification('Profile picture updated successfully', 'success');
            }

            reader.readAsDataURL(this.files[0]);
        }
    });

    // Form validation and submission
    const saveBtn = document.getElementById('btnSaveChanges');
    const changePasswordBtn = document.getElementById('btnChangePassword');
    const deleteAccountBtn = document.getElementById('btnDeleteAccount');

    saveBtn.addEventListener('click', function (e) {
        e.preventDefault();

        // Simple validation
        const firstName = document.getElementById('txtFirstName').value;
        const lastName = document.getElementById('txtLastName').value;
        const email = document.getElementById('txtEmail').value;

        if (!firstName || !lastName || !email) {
            showNotification('Please fill in all required fields', 'error');
            return;
        }

        // Simulate save action
        showNotification('Profile updated successfully', 'success');

        // Update displayed name
        document.getElementById('userFullName').textContent = `${firstName} ${lastName}`;
        document.getElementById('userEmail').textContent = email;
        document.getElementById('userPhone').textContent = document.getElementById('txtPhone').value;
        document.getElementById('userAddress').textContent = document.getElementById('txtAddress').value;
    });

    changePasswordBtn.addEventListener('click', function (e) {
        e.preventDefault();
        showChangePasswordModal();
    });

    deleteAccountBtn.addEventListener('click', function (e) {
        e.preventDefault();
        showDeleteAccountModal();
    });

    // Change Password Modal
    function showChangePasswordModal() {
        const modal = document.createElement('div');
        modal.className = 'modal';
        modal.innerHTML = `
            <div class="modal-content">
                <div class="modal-header">
                    <h3>Change Password</h3>
                    <button class="close-modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="currentPassword">Current Password</label>
                        <input type="password" id="currentPassword" class="form-control" placeholder="Enter current password">
                    </div>
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" id="newPassword" class="form-control" placeholder="Enter new password">
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password</label>
                        <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm new password">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="cancel-btn">Cancel</button>
                    <button class="submit-btn">Update Password</button>
                </div>
            </div>
        `;

        document.body.appendChild(modal);

        // Close modal
        modal.querySelector('.close-modal').addEventListener('click', () => {
            modal.remove();
        });

        modal.querySelector('.cancel-btn').addEventListener('click', () => {
            modal.remove();
        });

        // Submit password change
        modal.querySelector('.submit-btn').addEventListener('click', () => {
            const currentPassword = modal.querySelector('#currentPassword').value;
            const newPassword = modal.querySelector('#newPassword').value;
            const confirmPassword = modal.querySelector('#confirmPassword').value;

            if (!currentPassword || !newPassword || !confirmPassword) {
                showNotification('Please fill in all password fields', 'error');
                return;
            }

            if (newPassword !== confirmPassword) {
                showNotification('New passwords do not match', 'error');
                return;
            }

            if (newPassword.length < 8) {
                showNotification('Password must be at least 8 characters', 'error');
                return;
            }

            // Simulate password change
            modal.remove();
            showNotification('Password changed successfully', 'success');
        });
    }

    // Delete Account Modal
    function showDeleteAccountModal() {
        const modal = document.createElement('div');
        modal.className = 'modal';
        modal.innerHTML = `
            <div class="modal-content">
                <div class="modal-header">
                    <h3>Delete Account</h3>
                    <button class="close-modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete your account? This action cannot be undone.</p>
                    <div class="form-group">
                        <label for="deletePassword">Enter your password to confirm</label>
                        <input type="password" id="deletePassword" class="form-control" placeholder="Enter your password">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="cancel-btn">Cancel</button>
                    <button class="delete-btn">Delete Account</button>
                </div>
            </div>
        `;

        document.body.appendChild(modal);

        // Close modal
        modal.querySelector('.close-modal').addEventListener('click', () => {
            modal.remove();
        });

        modal.querySelector('.cancel-btn').addEventListener('click', () => {
            modal.remove();
        });

        // Delete account
        modal.querySelector('.delete-btn').addEventListener('click', () => {
            const password = modal.querySelector('#deletePassword').value;

            if (!password) {
                showNotification('Please enter your password', 'error');
                return;
            }

            // Simulate account deletion
            modal.remove();
            showNotification('Account deleted successfully', 'success');

            // Redirect to login page after delay
            setTimeout(() => {
                window.location.href = '../../../Pages/Login/Login.aspx';
            }, 2000);
        });
    }

    // Notification function
    function showNotification(message, type) {
        const notification = document.createElement('div');
        notification.className = `notification ${type}`;
        notification.innerHTML = `
            <i class="fas fa-${type === 'success' ? 'check-circle' : type === 'error' ? 'exclamation-circle' : 'info-circle'}"></i>
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

    // Add modal and notification styles dynamically
    const style = document.createElement('style');
    style.textContent = `
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 2000;
        }
        
        .modal-content {
            background-color: white;
            border-radius: 8px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            animation: modalFadeIn 0.3s;
        }
        
        @keyframes modalFadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .modal-header {
            padding: 1.5rem;
            background-color: #006400;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .modal-header h3 {
            margin: 0;
        }
        
        .close-modal {
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
        }
        
        .modal-body {
            padding: 1.5rem;
        }
        
        .modal-footer {
            padding: 1rem 1.5rem;
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            border-top: 1px solid #eee;
        }
        
        .cancel-btn, .submit-btn, .delete-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .cancel-btn {
            background-color: #f5f5f5;
        }
        
        .cancel-btn:hover {
            background-color: #e0e0e0;
        }
        
        .submit-btn {
            background-color: #006400;
            color: white;
        }
        
        .submit-btn:hover {
            background-color: #228B22;
        }
        
        .delete-btn {
            background-color: #f44336;
            color: white;
        }
        
        .delete-btn:hover {
            background-color: #d32f2f;
        }
        
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