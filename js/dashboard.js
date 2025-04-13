// dashboard.js - Dashboard functionality
document.addEventListener('DOMContentLoaded', function() {
    // Check authentication
    const authToken = localStorage.getItem('authToken');
    if (!authToken && window.location.pathname.includes('dashboard/')) {
        window.location.href = '../auth/login.html';
        return;
    }

    // Load user data
    const user = JSON.parse(localStorage.getItem('user'));
    if (user) {
        // Update user display
        const usernameElements = document.querySelectorAll('.username');
        usernameElements.forEach(element => {
            element.textContent = user.name;
        });

        // Set dashboard title based on role
        if (user.role === 'admin') {
            document.title = 'Admin Dashboard - All Application ZA';
            const dashboardTitle = document.querySelector('.dashboard-content h1');
            if (dashboardTitle) {
                dashboardTitle.textContent = 'Admin Dashboard';
            }
        }
    }

    // Load applications data
    if (document.getElementById('applications-container')) {
        loadApplications();
    }

    // Load documents data
    if (document.querySelector('.documents-list')) {
        loadDocuments();
    }
});

function loadApplications() {
    // Mock data - in a real app, this would be an API call
    const applications = [
        {
            id: 1,
            university: 'University of Cape Town',
            course: 'Bachelor of Science',
            status: 'pending',
            date: '2023-08-01',
            apsScore: 42
        },
        {
            id: 2,
            university: 'University of Johannesburg',
            course: 'Bachelor of Commerce',
            status: 'accepted',
            date: '2023-07-15',
            apsScore: 38
        }
    ];

    const container = document.getElementById('applications-container');
    if (!container) return;

    container.innerHTML = '';
    
    applications.forEach(app => {
        const card = document.createElement('div');
        card.className = 'application-card';
        card.innerHTML = `
            <div class="application-header">
                <h3>${app.university}</h3>
                <span class="status-badge ${app.status}">${app.status.charAt(0).toUpperCase() + app.status.slice(1)}</span>
            </div>
            <div class="application-body">
                <p><strong>Course:</strong> ${app.course}</p>
                <p><strong>APS Score:</strong> ${app.apsScore}</p>
                <p><strong>Applied:</strong> ${app.date}</p>
            </div>
            <div class="application-footer">
                <button class="btn btn-sm btn-primary">View Details</button>
            </div>
        `;
        
        container.appendChild(card);
    });
}

function loadDocuments() {
    // Mock data - in a real app, this would be an API call
    const documents = [
        {
            name: 'ID Document.pdf',
            type: 'id',
            status: 'verified',
            uploadedDate: '2023-07-10'
        },
        {
            name: 'Matric Certificate.pdf',
            type: 'academic',
            status: 'pending',
            uploadedDate: '2023-07-15'
        },
        {
            name: 'Transcript.pdf',
            type: 'academic',
            status: 'missing',
            uploadedDate: ''
        }
    ];

    const container = document.querySelector('.documents-list');
    if (!container) return;

    container.innerHTML = '';
    
    documents.forEach(doc => {
        const item = document.createElement('li');
        item.innerHTML = `
            <i class="icon-file"></i>
            <span>${doc.name}</span>
            <span class="doc-status ${doc.status}">${doc.status.charAt(0).toUpperCase() + doc.status.slice(1)}</span>
        `;
        
        container.appendChild(item);
    });
}