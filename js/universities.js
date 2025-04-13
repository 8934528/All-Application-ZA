// universities.js - University browsing and application functionality
document.addEventListener('DOMContentLoaded', function() {
    // Load universities data
    fetch('../data/universities.json')
        .then(response => response.json())
        .then(data => {
            if (window.location.pathname.includes('view.html')) {
                displayAllUniversities(data);
            } else if (window.location.pathname.includes('index.html')) {
                displayFeaturedUniversities(data.slice(0, 3));
            }
        })
        .catch(error => console.error('Error loading universities:', error));

    // University modal functionality
    const modal = document.getElementById('university-modal');
    if (modal) {
        const closeBtn = document.querySelector('.close-modal');
        
        closeBtn.addEventListener('click', function() {
            modal.classList.add('hidden');
        });
        
        modal.addEventListener('click', function(e) {
            if (e.target === modal) {
                modal.classList.add('hidden');
            }
        });
    }

    // Application form steps
    const formSteps = document.querySelectorAll('.form-step');
    if (formSteps.length > 0) {
        const nextButtons = document.querySelectorAll('.next-step');
        const prevButtons = document.querySelectorAll('.prev-step');
        
        nextButtons.forEach(button => {
            button.addEventListener('click', function() {
                const currentStep = document.querySelector('.form-step.active');
                const nextStep = currentStep.nextElementSibling;
                
                if (validateStep(currentStep)) {
                    currentStep.classList.remove('active');
                    nextStep.classList.add('active');
                    updateProgressBar(nextStep.dataset.step);
                }
            });
        });
        
        prevButtons.forEach(button => {
            button.addEventListener('click', function() {
                const currentStep = document.querySelector('.form-step.active');
                const prevStep = currentStep.previousElementSibling;
                
                currentStep.classList.remove('active');
                prevStep.classList.add('active');
                updateProgressBar(prevStep.dataset.step);
            });
        });
        
        // Handle file uploads
        const fileInputs = document.querySelectorAll('input[type="file"]');
        fileInputs.forEach(input => {
            input.addEventListener('change', function() {
                const statusElement = this.nextElementSibling.nextElementSibling;
                if (this.files.length > 0) {
                    statusElement.textContent = 'Uploaded';
                    statusElement.classList.add('uploaded');
                } else {
                    statusElement.textContent = 'Not uploaded';
                    statusElement.classList.remove('uploaded');
                }
            });
        });
    }
});

function displayAllUniversities(universities) {
    const container = document.getElementById('universities-container');
    if (!container) return;
    
    container.innerHTML = '';
    
    universities.forEach(university => {
        const card = document.createElement('div');
        card.className = 'university-card';
        card.innerHTML = `
            <div class="university-card-header">
                <h3>${university.name}</h3>
                <span class="university-card-status ${university.applicationsOpen ? 'status-open' : 'status-closed'}">
                    ${university.applicationsOpen ? 'Applications Open' : 'Applications Closed'}
                </span>
            </div>
            <div class="university-card-body">
                <p><strong>Location:</strong> ${university.location}</p>
                <p><strong>Application Deadline:</strong> ${university.deadline}</p>
                <p>${university.description}</p>
            </div>
            <div class="university-card-footer">
                <button class="btn btn-blue view-details" data-id="${university.id}">View Details</button>
                ${university.applicationsOpen ? '<a href="apply.html" class="btn btn-yellow">Apply Now</a>' : ''}
            </div>
        `;
        
        container.appendChild(card);
    });
}

function displayFeaturedUniversities(universities) {
    const container = document.getElementById('featured-universities');
    if (!container) return;
    
    container.innerHTML = '';
    
    universities.forEach(university => {
        const card = document.createElement('div');
        card.className = 'university-card';
        card.innerHTML = `
            <div class="university-card-header">
                <h3>${university.name}</h3>
                <span class="university-card-status ${university.applicationsOpen ? 'status-open' : 'status-closed'}">
                    ${university.applicationsOpen ? 'Applications Open' : 'Applications Closed'}
                </span>
            </div>
            <div class="university-card-body">
                <p><strong>Location:</strong> ${university.location}</p>
                <p><strong>Application Deadline:</strong> ${university.deadline}</p>
            </div>
            <div class="university-card-footer">
                <button class="btn btn-blue view-details" data-id="${university.id}">View Details</button>
            </div>
        `;
        
        container.appendChild(card);
    });
}

function validateStep(step) {
    // Simple validation - in a real app, this would be more comprehensive
    const requiredInputs = step.querySelectorAll('[required]');
    let isValid = true;
    
    requiredInputs.forEach(input => {
        if (!input.value) {
            input.style.borderColor = 'var(--error)';
            isValid = false;
        } else {
            input.style.borderColor = '';
        }
    });
    
    if (!isValid) {
        alert('Please fill in all required fields');
    }
    
    return isValid;
}

function updateProgressBar(stepNumber) {
    const steps = document.querySelectorAll('.progress-step');
    steps.forEach((step, index) => {
        if (index < stepNumber - 1) {
            step.classList.add('completed');
            step.classList.remove('active');
        } else if (index === stepNumber - 1) {
            step.classList.add('active');
            step.classList.remove('completed');
        } else {
            step.classList.remove('active', 'completed');
        }
    });
}

// Add to universities.js
function setupAPSCalculator() {
    const calculateBtn = document.getElementById('calculate-aps');
    if (!calculateBtn) return;

    calculateBtn.addEventListener('click', function() {
        const apsModal = document.getElementById('aps-modal');
        const apsCalculatorContainer = document.getElementById('aps-calculator');
        
        // Create APS calculator form
        apsCalculatorContainer.innerHTML = `
            <form id="aps-form">
                <div class="form-group">
                    <label>Select your subjects and grades:</label>
                    <div id="subject-fields">
                        <!-- Subject inputs will be added here -->
                    </div>
                    <button type="button" id="add-subject" class="btn btn-secondary btn-sm">Add Subject</button>
                </div>
                <button type="submit" class="btn btn-primary">Calculate APS</button>
            </form>
            <div id="aps-result" class="hidden">
                <h3>Your APS Score: <span id="aps-total">0</span></h3>
                <div id="aps-breakdown"></div>
            </div>
        `;
        
        // Add initial subject fields
        addSubjectField();
        
        // Handle adding more subjects
        document.getElementById('add-subject').addEventListener('click', addSubjectField);
        
        // Handle APS calculation
        document.getElementById('aps-form').addEventListener('submit', function(e) {
            e.preventDefault();
            calculateAPS();
        });
        
        // Show modal
        apsModal.classList.remove('hidden');
    });
}

function addSubjectField() {
    const subjectFields = document.getElementById('subject-fields');
    const index = subjectFields.children.length;
    
    const subjectField = document.createElement('div');
    subjectField.className = 'subject-field flex-between';
    subjectField.innerHTML = `
        <select class="subject-select" required>
            <option value="">Select Subject</option>
            <option value="Mathematics">Mathematics</option>
            <option value="Physical Science">Physical Science</option>
            <option value="Life Sciences">Life Sciences</option>
            <option value="Accounting">Accounting</option>
            <option value="Geography">Geography</option>
            <option value="History">History</option>
            <option value="English">English</option>
            <option value="Afrikaans">Afrikaans</option>
            <option value="IsiZulu">IsiZulu</option>
            <option value="Life Orientation">Life Orientation</option>
        </select>
        <select class="grade-select" required>
            <option value="">Select Grade</option>
            <option value="A">A (80-100%)</option>
            <option value="B">B (70-79%)</option>
            <option value="C">C (60-69%)</option>
            <option value="D">D (50-59%)</option>
            <option value="E">E (40-49%)</option>
            <option value="F">F (30-39%)</option>
            <option value="G">G (0-29%)</option>
        </select>
        <button type="button" class="btn btn-danger btn-sm remove-subject">&times;</button>
    `;
    
    subjectFields.appendChild(subjectField);
    
    // Handle subject removal
    subjectField.querySelector('.remove-subject').addEventListener('click', function() {
        subjectFields.removeChild(subjectField);
    });
}

function calculateAPS() {
    const calculator = new APSCalculator();
    const subjectFields = document.querySelectorAll('.subject-field');
    
    const results = Array.from(subjectFields).map(field => {
        return {
            subject: field.querySelector('.subject-select').value,
            grade: field.querySelector('.grade-select').value
        };
    }).filter(result => result.subject && result.grade);
    
    if (results.length === 0) {
        alert('Please add at least one subject');
        return;
    }
    
    const apsResult = calculator.calculateAPS(results);
    
    // Display results
    document.getElementById('aps-total').textContent = apsResult.totalAPS;
    
    const breakdown = document.getElementById('aps-breakdown');
    breakdown.innerHTML = `
        <h4>Subject Breakdown:</h4>
        <ul>
            ${apsResult.subjectBreakdown.map(sub => `
                <li>${sub.subject} (${sub.level}): ${sub.grade} = ${sub.points} points</li>
            `).join('')}
        </ul>
    `;
    
    // Update APS score in application form
    document.getElementById('aps-score').value = apsResult.totalAPS;
    
    // Show results
    document.getElementById('aps-result').classList.remove('hidden');
}

// Call this function in the DOMContentLoaded event
setupAPSCalculator();