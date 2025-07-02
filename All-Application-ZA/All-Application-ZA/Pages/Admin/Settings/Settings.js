document.addEventListener('DOMContentLoaded', function () {
    // Initialize Bootstrap components
    const dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
    const dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
        return new bootstrap.Dropdown(dropdownToggleEl);
    });

    // Initialize tab functionality
    const settingsTabs = document.querySelector('#settingsTabs');
    if (settingsTabs) {
        const tab = new bootstrap.Tab(settingsTabs.querySelector('.nav-link.active'));
    }

    // Maintenance mode toggle effect
    const maintenanceToggle = document.getElementById('<%= cbMaintenanceMode.ClientID %>');
    if (maintenanceToggle) {
        maintenanceToggle.addEventListener('change', function () {
            if (this.checked) {
                if (!confirm('Enabling maintenance mode will restrict access to all users except administrators. Continue?')) {
                    this.checked = false;
                }
            }
        });
    }

    console.log("Settings page initialized successfully");
});

// Copy API key to clipboard
function copyApiKey() {
    const apiKeyInput = document.getElementById('<%= txtApiKey.ClientID %>');
    apiKeyInput.select();
    document.execCommand('copy');

    // Show toast notification
    const toast = new bootstrap.Toast(document.getElementById('toastNotification'));
    document.getElementById('<%= litToastMessage.ClientID %>').innerHTML = 'API key copied to clipboard!';
    toast.show();
}

// Show toast message from server-side
function showToast(message) {
    const toast = new bootstrap.Toast(document.getElementById('toastNotification'));
    document.getElementById('<%= litToastMessage.ClientID %>').innerHTML = message;
    toast.show();
}