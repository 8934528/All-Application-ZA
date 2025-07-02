document.addEventListener('DOMContentLoaded', function () {
    initializeForm();
    setupFileUploads();
    setupAPSCalculation();
    setupReviewPage();
    setupMobileMenu();
});

function initializeForm() {
    // Set first step as active
    document.querySelector('.form-step').classList.add('active');

    // Mark first step as active in progress bar
    document.querySelector('.step[data-step="1"]').classList.add('active');

    const steps = document.querySelectorAll('.step');
    steps.forEach(step => {
        step.addEventListener('click', function () {
            const stepNumber = parseInt(this.getAttribute('data-step'));
            if (this.classList.contains('completed') || this.classList.contains('active')) {
                goToStep(stepNumber);
            }
        });
    });
}

function setupMobileMenu() {
    const menuBtn = document.querySelector('.mobile-menu-btn');
    const userNav = document.querySelector('.user-nav');

    menuBtn.addEventListener('click', function () {
        userNav.classList.toggle('active');
    });
}

function setupFileUploads() {
    const fileInputs = document.querySelectorAll('.file-upload');
    fileInputs.forEach(input => {
        input.addEventListener('change', function () {
            const fileName = this.files[0] ? this.files[0].name : 'No file chosen';
            this.nextElementSibling.nextElementSibling.textContent = fileName;
        });
    });
}

function setupAPSCalculation() {
    const gradeSelects = document.querySelectorAll('[id^="ddlGrade"]');
    gradeSelects.forEach(select => {
        select.addEventListener('change', calculateAPSScore);
    });
}

function calculateAPSScore() {
    let totalScore = 0;
    const gradeSelects = document.querySelectorAll('[id^="ddlGrade"]');

    gradeSelects.forEach(select => {
        if (select.value) {
            totalScore += parseInt(select.value);
        }
    });

    document.getElementById('lblAPSScore').textContent = totalScore;
}

function nextStep(current, next) {
    if (validateStep(current)) {
        document.getElementById(`step${current}`).classList.remove('active');
        document.getElementById(`step${next}`).classList.add('active');
        document.getElementById(`step${next}`).classList.add('animate__fadeIn');
        updateProgressSteps(next);
    }
}

function prevStep(current, prev) {
    document.getElementById(`step${current}`).classList.remove('active');
    document.getElementById(`step${prev}`).classList.add('active');
    document.getElementById(`step${prev}`).classList.add('animate__fadeIn');
    updateProgressSteps(prev);
}

function goToStep(stepNumber) {
    document.querySelectorAll('.form-step').forEach(step => {
        step.classList.remove('active');
    });
    document.getElementById(`step${stepNumber}`).classList.add('active');
    document.getElementById(`step${stepNumber}`).classList.add('animate__fadeIn');
    updateProgressSteps(stepNumber);
}

function updateProgressSteps(activeStep) {
    const steps = document.querySelectorAll('.step');
    steps.forEach(step => {
        const stepNumber = parseInt(step.getAttribute('data-step'));
        step.classList.remove('active', 'completed');

        if (stepNumber < activeStep) {
            step.classList.add('completed');
        } else if (stepNumber === activeStep) {
            step.classList.add('active');
        }
    });
}

function validateStep(stepNumber) {
    let isValid = true;
    const currentStep = document.getElementById(`step${stepNumber}`);
    const requiredFields = currentStep.querySelectorAll('[required]');

    // Reset error messages and borders
    currentStep.querySelectorAll('.error-message').forEach(msg => {
        msg.style.display = 'none';
    });
    currentStep.querySelectorAll('.form-control').forEach(field => {
        field.style.borderColor = '#ddd';
    });

    // Validate required fields
    requiredFields.forEach(field => {
        if (!field.value) {
            isValid = false;
            let errorMsg = field.nextElementSibling;

            // If no error message element exists, create one
            if (!errorMsg || !errorMsg.classList.contains('error-message')) {
                errorMsg = document.createElement('div');
                errorMsg.className = 'error-message';
                field.parentNode.insertBefore(errorMsg, field.nextSibling);
            }

            errorMsg.textContent = 'This field is required';
            errorMsg.style.display = 'block';
            field.style.borderColor = '#e74c3c';
        }
    });

    // Special validation for step 2 (email matching)
    if (stepNumber === 2) {
        const email = document.getElementById('txtEmail').value;
        const confirmEmail = document.getElementById('txtConfirmEmail').value;

        if (email !== confirmEmail) {
            isValid = false;
            let errorMsg = document.getElementById('txtConfirmEmail').nextElementSibling;

            if (!errorMsg || !errorMsg.classList.contains('error-message')) {
                errorMsg = document.createElement('div');
                errorMsg.className = 'error-message';
                document.getElementById('txtConfirmEmail').parentNode.insertBefore(errorMsg, document.getElementById('txtConfirmEmail').nextSibling);
            }

            errorMsg.textContent = 'Email addresses do not match';
            errorMsg.style.display = 'block';
            document.getElementById('txtConfirmEmail').style.borderColor = '#e74c3c';
        }
    }

    return isValid;
}

function setupReviewPage() {
    const step6 = document.getElementById('step6');
    if (step6) {
        const observer = new MutationObserver(function (mutations) {
            mutations.forEach(function (mutation) {
                if (mutation.attributeName === 'class' && step6.classList.contains('active')) {
                    populateReviewPage();
                }
            });
        });
        observer.observe(step6, { attributes: true });
    }
}

function populateReviewPage() {
    // Personal Details
    document.getElementById('reviewFullName').textContent =
        `${document.getElementById('txtFirstName').value} ${document.getElementById('txtMiddleName').value} ${document.getElementById('txtSurname').value}`.replace(/\s+/g, ' ').trim();

    document.getElementById('reviewIDNumber').textContent = document.getElementById('txtIDNumber').value;
    document.getElementById('reviewDOB').textContent = document.getElementById('txtDateOfBirth').value;
    document.getElementById('reviewGender').textContent = document.getElementById('ddlGender').value;
    document.getElementById('reviewNationality').textContent = document.getElementById('ddlNationality').value;
    document.getElementById('reviewPopulationGroup').textContent = document.getElementById('ddlPopulationGroup').value;

    // Contact Details
    document.getElementById('reviewEmail').textContent = document.getElementById('txtEmail').value;
    document.getElementById('reviewPhone').textContent = document.getElementById('txtPhone').value;
    document.getElementById('reviewAddress').textContent = document.getElementById('txtResidentialAddress').value;
    document.getElementById('reviewProvince').textContent = document.getElementById('ddlProvince').value;

    // Education Details
    document.getElementById('reviewHighSchool').textContent = document.getElementById('txtHighSchool').value;
    document.getElementById('reviewYearCompleted').textContent = document.getElementById('ddlYearCompleted').value;
    document.getElementById('reviewQualification').textContent = document.getElementById('ddlHighestQualification').value;
    document.getElementById('reviewAPSScore').textContent = document.getElementById('lblAPSScore').textContent;

    // Documents
    const documentsList = document.getElementById('reviewDocuments');
    documentsList.innerHTML = '';

    const fileInputs = document.querySelectorAll('.file-upload');
    fileInputs.forEach(input => {
        if (input.files.length > 0) {
            const li = document.createElement('li');
            li.textContent = `${input.previousElementSibling.textContent}: ${input.files[0].name}`;
            documentsList.appendChild(li);
        }
    });
}

function showSuccessModal(referenceNumber) {
    document.getElementById('applicationRef').textContent = referenceNumber;
    const modal = document.getElementById('successModal');
    modal.style.display = 'flex';
    setTimeout(() => {
        modal.classList.add('show');
    }, 10);
}

function closeModal() {
    const modal = document.getElementById('successModal');
    modal.classList.remove('show');
    setTimeout(() => {
        modal.style.display = 'none';
    }, 300);
}