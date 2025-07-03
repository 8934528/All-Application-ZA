<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationForm.aspx.cs" Inherits="All_Application_ZA.Pages.Applicant.AplicationForm.ApplicationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All-Application-ZA | Application Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="ApplicationForm.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- User Header with Navigation -->
        <header class="user-header animate__animated animate__fadeInDown">
            <div class="logo-container">
                <img src="../../../Assets/Images/za.png" alt="All-Application-ZA Logo" class="logo" />
            </div>
            <nav class="user-nav">
                <ul>
                    <li><a href="../Dashboard/UserDash.aspx"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="../ApplicationForm/ApplicationForm.aspx" class="active"><i class="fas fa-pen-alt"></i>Application Process</a></li>
                    <li><a href="../../../Pages/Login/Login.aspx"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Application Progress Section -->
        <div class="application-progress">
            <h2>University Application Form</h2>
            <div class="progress-steps">
                <div class="step active" data-step="1">
                    <span class="step-number">1</span>
                    <span class="step-label">Personal</span>
                </div>
                <div class="step" data-step="2">
                    <span class="step-number">2</span>
                    <span class="step-label">Contact</span>
                </div>
                <div class="step" data-step="3">
                    <span class="step-number">3</span>
                    <span class="step-label">Education</span>
                </div>
                <div class="step" data-step="4">
                    <span class="step-number">4</span>
                    <span class="step-label">Results</span>
                </div>
                <div class="step" data-step="5">
                    <span class="step-number">5</span>
                    <span class="step-label">Documents</span>
                </div>
                <div class="step" data-step="6">
                    <span class="step-number">6</span>
                    <span class="step-label">Review</span>
                </div>
            </div>
        </div>

        <!-- Main Application Form -->
        <main class="application-container">
            <!-- Step 1: Personal Details -->
            <section class="form-step active" id="step1">
                <h3><i class="fas fa-user-circle"></i>Personal Details</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="txtFirstName">First Name *</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtMiddleName">Middle Name</label>
                        <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtSurname">Surname *</label>
                        <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtIDNumber">ID Number *</label>
                        <asp:TextBox ID="txtIDNumber" runat="server" CssClass="form-control" required="true" pattern="[0-9]{13}" title="13 digit South African ID number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlGender">Gender *</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                            <asp:ListItem Value="PreferNotToSay">Prefer not to say</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtDateOfBirth">Date of Birth *</label>
                        <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlNationality">Nationality *</label>
                        <asp:DropDownList ID="ddlNationality" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Nationality</asp:ListItem>
                            <asp:ListItem Value="South African">South African</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlPopulationGroup">Population Group *</label>
                        <asp:DropDownList ID="ddlPopulationGroup" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Population Group</asp:ListItem>
                            <asp:ListItem Value="African">African</asp:ListItem>
                            <asp:ListItem Value="Coloured">Coloured</asp:ListItem>
                            <asp:ListItem Value="Indian">Indian/Asian</asp:ListItem>
                            <asp:ListItem Value="White">White</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-navigation">
                    <button type="button" class="btn-next" onclick="nextStep(1, 2)">Next <i class="fas fa-arrow-right"></i></button>
                </div>
            </section>

            <!-- Step 2: Contact Details -->
            <section class="form-step" id="step2">
                <h3><i class="fas fa-address-book"></i>Contact Details</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="txtEmail">Email Address *</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtConfirmEmail">Confirm Email *</label>
                        <asp:TextBox ID="txtConfirmEmail" runat="server" CssClass="form-control" TextMode="Email" required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPhone">Phone Number *</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" required="true" pattern="[0-9]{10}" title="10 digit South African phone number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtAltPhone">Alternative Phone</label>
                        <asp:TextBox ID="txtAltPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtResidentialAddress">Residential Address *</label>
                        <asp:TextBox ID="txtResidentialAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPostalAddress">Postal Address</label>
                        <asp:TextBox ID="txtPostalAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlProvince">Province *</label>
                        <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Province</asp:ListItem>
                            <asp:ListItem Value="EC">Eastern Cape</asp:ListItem>
                            <asp:ListItem Value="FS">Free State</asp:ListItem>
                            <asp:ListItem Value="GP">Gauteng</asp:ListItem>
                            <asp:ListItem Value="KZN">KwaZulu-Natal</asp:ListItem>
                            <asp:ListItem Value="LP">Limpopo</asp:ListItem>
                            <asp:ListItem Value="MP">Mpumalanga</asp:ListItem>
                            <asp:ListItem Value="NC">Northern Cape</asp:ListItem>
                            <asp:ListItem Value="NW">North West</asp:ListItem>
                            <asp:ListItem Value="WC">Western Cape</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtPostalCode">Postal Code</label>
                        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-navigation">
                    <button type="button" class="btn-prev" onclick="prevStep(2, 1)"><i class="fas fa-arrow-left"></i>Previous</button>
                    <button type="button" class="btn-next" onclick="nextStep(2, 3)">Next <i class="fas fa-arrow-right"></i></button>
                </div>
            </section>

            <!-- Step 3: Education & Experience -->
            <section class="form-step" id="step3">
                <h3><i class="fas fa-graduation-cap"></i>Education & Experience</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="txtHighSchool">High School Name *</label>
                        <asp:TextBox ID="txtHighSchool" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlYearCompleted">Year Completed/Completing *</label>
                        <asp:DropDownList ID="ddlYearCompleted" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Year</asp:ListItem>
                            <asp:ListItem Value="2023">2023</asp:ListItem>
                            <asp:ListItem Value="2024">2024</asp:ListItem>
                            <asp:ListItem Value="2025">2025</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlHighestQualification">Highest Qualification *</label>
                        <asp:DropDownList ID="ddlHighestQualification" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Qualification</asp:ListItem>
                            <asp:ListItem Value="Grade 12">Grade 12 (Matric)</asp:ListItem>
                            <asp:ListItem Value="Diploma">Diploma</asp:ListItem>
                            <asp:ListItem Value="Degree">Degree</asp:ListItem>
                            <asp:ListItem Value="Honours">Honours</asp:ListItem>
                            <asp:ListItem Value="Masters">Masters</asp:ListItem>
                            <asp:ListItem Value="PhD">PhD</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtInstitution">Institution (if tertiary)</label>
                        <asp:TextBox ID="txtInstitution" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtQualifications">Qualifications Obtained (if tertiary)</label>
                        <asp:TextBox ID="txtQualifications" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtWorkExperience">Work Experience (if any)</label>
                        <asp:TextBox ID="txtWorkExperience" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtExtracurricular">Extracurricular Activities</label>
                        <asp:TextBox ID="txtExtracurricular" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                </div>
                <div class="form-navigation">
                    <button type="button" class="btn-prev" onclick="prevStep(3, 2)"><i class="fas fa-arrow-left"></i>Previous</button>
                    <button type="button" class="btn-next" onclick="nextStep(3, 4)">Next <i class="fas fa-arrow-right"></i></button>
                </div>
            </section>

            <!-- Step 4: School Results & APS Calculation -->
            <section class="form-step" id="step4">
                <h3><i class="fas fa-chart-bar"></i>School Results & APS Calculation</h3>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="ddlSubject1">Subject 1 *</label>
                        <asp:DropDownList ID="ddlSubject1" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Subject</asp:ListItem>
                            <asp:ListItem Value="English">English Home Language</asp:ListItem>
                            <asp:ListItem Value="Afrikaans">Afrikaans Home Language</asp:ListItem>
                            <asp:ListItem Value="Zulu">IsiZulu Home Language</asp:ListItem>
                            <asp:ListItem Value="Mathematics">Mathematics</asp:ListItem>
                            <asp:ListItem Value="MathsLit">Mathematical Literacy</asp:ListItem>
                            <asp:ListItem Value="LifeSciences">Life Sciences</asp:ListItem>
                            <asp:ListItem Value="PhysicalSciences">Physical Sciences</asp:ListItem>
                            <asp:ListItem Value="Accounting">Accounting</asp:ListItem>
                            <asp:ListItem Value="Business">Business Studies</asp:ListItem>
                            <asp:ListItem Value="Economics">Economics</asp:ListItem>
                            <asp:ListItem Value="Geography">Geography</asp:ListItem>
                            <asp:ListItem Value="History">History</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlGrade1">Grade *</label>
                        <asp:DropDownList ID="ddlGrade1" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Grade</asp:ListItem>
                            <asp:ListItem Value="7">A (80-100%)</asp:ListItem>
                            <asp:ListItem Value="6">B (70-79%)</asp:ListItem>
                            <asp:ListItem Value="5">C (60-69%)</asp:ListItem>
                            <asp:ListItem Value="4">D (50-59%)</asp:ListItem>
                            <asp:ListItem Value="3">E (40-49%)</asp:ListItem>
                            <asp:ListItem Value="2">F (30-39%)</asp:ListItem>
                            <asp:ListItem Value="1">G (0-29%)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Subject 2 -->
                    <div class="form-group">
                        <label for="ddlSubject2">Subject 2 *</label>
                        <asp:DropDownList ID="ddlSubject2" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Subject</asp:ListItem>
                            <asp:ListItem Value="English">English Home Language</asp:ListItem>
                            <asp:ListItem Value="Afrikaans">Afrikaans Home Language</asp:ListItem>
                            <asp:ListItem Value="Zulu">IsiZulu Home Language</asp:ListItem>
                            <asp:ListItem Value="Mathematics">Mathematics</asp:ListItem>
                            <asp:ListItem Value="MathsLit">Mathematical Literacy</asp:ListItem>
                            <asp:ListItem Value="LifeSciences">Life Sciences</asp:ListItem>
                            <asp:ListItem Value="PhysicalSciences">Physical Sciences</asp:ListItem>
                            <asp:ListItem Value="Accounting">Accounting</asp:ListItem>
                            <asp:ListItem Value="Business">Business Studies</asp:ListItem>
                            <asp:ListItem Value="Economics">Economics</asp:ListItem>
                            <asp:ListItem Value="Geography">Geography</asp:ListItem>
                            <asp:ListItem Value="History">History</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlGrade2">Grade *</label>
                        <asp:DropDownList ID="ddlGrade2" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Grade</asp:ListItem>
                            <asp:ListItem Value="7">A (80-100%)</asp:ListItem>
                            <asp:ListItem Value="6">B (70-79%)</asp:ListItem>
                            <asp:ListItem Value="5">C (60-69%)</asp:ListItem>
                            <asp:ListItem Value="4">D (50-59%)</asp:ListItem>
                            <asp:ListItem Value="3">E (40-49%)</asp:ListItem>
                            <asp:ListItem Value="2">F (30-39%)</asp:ListItem>
                            <asp:ListItem Value="1">G (0-29%)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Subject 3 -->
                    <div class="form-group">
                        <label for="ddlSubject3">Subject 3 *</label>
                        <asp:DropDownList ID="ddlSubject3" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Subject</asp:ListItem>
                            <asp:ListItem Value="English">English Home Language</asp:ListItem>
                            <asp:ListItem Value="Afrikaans">Afrikaans Home Language</asp:ListItem>
                            <asp:ListItem Value="Zulu">IsiZulu Home Language</asp:ListItem>
                            <asp:ListItem Value="Mathematics">Mathematics</asp:ListItem>
                            <asp:ListItem Value="MathsLit">Mathematical Literacy</asp:ListItem>
                            <asp:ListItem Value="LifeSciences">Life Sciences</asp:ListItem>
                            <asp:ListItem Value="PhysicalSciences">Physical Sciences</asp:ListItem>
                            <asp:ListItem Value="Accounting">Accounting</asp:ListItem>
                            <asp:ListItem Value="Business">Business Studies</asp:ListItem>
                            <asp:ListItem Value="Economics">Economics</asp:ListItem>
                            <asp:ListItem Value="Geography">Geography</asp:ListItem>
                            <asp:ListItem Value="History">History</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlGrade3">Grade *</label>
                        <asp:DropDownList ID="ddlGrade3" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Grade</asp:ListItem>
                            <asp:ListItem Value="7">A (80-100%)</asp:ListItem>
                            <asp:ListItem Value="6">B (70-79%)</asp:ListItem>
                            <asp:ListItem Value="5">C (60-69%)</asp:ListItem>
                            <asp:ListItem Value="4">D (50-59%)</asp:ListItem>
                            <asp:ListItem Value="3">E (40-49%)</asp:ListItem>
                            <asp:ListItem Value="2">F (30-39%)</asp:ListItem>
                            <asp:ListItem Value="1">G (0-29%)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Subject 4 -->
                    <div class="form-group">
                        <label for="ddlSubject4">Subject 4 *</label>
                        <asp:DropDownList ID="ddlSubject4" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Subject</asp:ListItem>
                            <asp:ListItem Value="English">English Home Language</asp:ListItem>
                            <asp:ListItem Value="Afrikaans">Afrikaans Home Language</asp:ListItem>
                            <asp:ListItem Value="Zulu">IsiZulu Home Language</asp:ListItem>
                            <asp:ListItem Value="Mathematics">Mathematics</asp:ListItem>
                            <asp:ListItem Value="MathsLit">Mathematical Literacy</asp:ListItem>
                            <asp:ListItem Value="LifeSciences">Life Sciences</asp:ListItem>
                            <asp:ListItem Value="PhysicalSciences">Physical Sciences</asp:ListItem>
                            <asp:ListItem Value="Accounting">Accounting</asp:ListItem>
                            <asp:ListItem Value="Business">Business Studies</asp:ListItem>
                            <asp:ListItem Value="Economics">Economics</asp:ListItem>
                            <asp:ListItem Value="Geography">Geography</asp:ListItem>
                            <asp:ListItem Value="History">History</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlGrade4">Grade *</label>
                        <asp:DropDownList ID="ddlGrade4" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Grade</asp:ListItem>
                            <asp:ListItem Value="7">A (80-100%)</asp:ListItem>
                            <asp:ListItem Value="6">B (70-79%)</asp:ListItem>
                            <asp:ListItem Value="5">C (60-69%)</asp:ListItem>
                            <asp:ListItem Value="4">D (50-59%)</asp:ListItem>
                            <asp:ListItem Value="3">E (40-49%)</asp:ListItem>
                            <asp:ListItem Value="2">F (30-39%)</asp:ListItem>
                            <asp:ListItem Value="1">G (0-29%)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Subject 5 -->
                    <div class="form-group">
                        <label for="ddlSubject5">Subject 5 *</label>
                        <asp:DropDownList ID="ddlSubject5" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Subject</asp:ListItem>
                            <asp:ListItem Value="English">English Home Language</asp:ListItem>
                            <asp:ListItem Value="Afrikaans">Afrikaans Home Language</asp:ListItem>
                            <asp:ListItem Value="Zulu">IsiZulu Home Language</asp:ListItem>
                            <asp:ListItem Value="Mathematics">Mathematics</asp:ListItem>
                            <asp:ListItem Value="MathsLit">Mathematical Literacy</asp:ListItem>
                            <asp:ListItem Value="LifeSciences">Life Sciences</asp:ListItem>
                            <asp:ListItem Value="PhysicalSciences">Physical Sciences</asp:ListItem>
                            <asp:ListItem Value="Accounting">Accounting</asp:ListItem>
                            <asp:ListItem Value="Business">Business Studies</asp:ListItem>
                            <asp:ListItem Value="Economics">Economics</asp:ListItem>
                            <asp:ListItem Value="Geography">Geography</asp:ListItem>
                            <asp:ListItem Value="History">History</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlGrade5">Grade *</label>
                        <asp:DropDownList ID="ddlGrade5" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Grade</asp:ListItem>
                            <asp:ListItem Value="7">A (80-100%)</asp:ListItem>
                            <asp:ListItem Value="6">B (70-79%)</asp:ListItem>
                            <asp:ListItem Value="5">C (60-69%)</asp:ListItem>
                            <asp:ListItem Value="4">D (50-59%)</asp:ListItem>
                            <asp:ListItem Value="3">E (40-49%)</asp:ListItem>
                            <asp:ListItem Value="2">F (30-39%)</asp:ListItem>
                            <asp:ListItem Value="1">G (0-29%)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Subject 6 -->
                    <div class="form-group">
                        <label for="ddlSubject6">Subject 6 *</label>
                        <asp:DropDownList ID="ddlSubject6" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Subject</asp:ListItem>
                            <asp:ListItem Value="English">English Home Language</asp:ListItem>
                            <asp:ListItem Value="Afrikaans">Afrikaans Home Language</asp:ListItem>
                            <asp:ListItem Value="Zulu">IsiZulu Home Language</asp:ListItem>
                            <asp:ListItem Value="Mathematics">Mathematics</asp:ListItem>
                            <asp:ListItem Value="MathsLit">Mathematical Literacy</asp:ListItem>
                            <asp:ListItem Value="LifeSciences">Life Sciences</asp:ListItem>
                            <asp:ListItem Value="PhysicalSciences">Physical Sciences</asp:ListItem>
                            <asp:ListItem Value="Accounting">Accounting</asp:ListItem>
                            <asp:ListItem Value="Business">Business Studies</asp:ListItem>
                            <asp:ListItem Value="Economics">Economics</asp:ListItem>
                            <asp:ListItem Value="Geography">Geography</asp:ListItem>
                            <asp:ListItem Value="History">History</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="ddlGrade6">Grade *</label>
                        <asp:DropDownList ID="ddlGrade6" runat="server" CssClass="form-control" required="true">
                            <asp:ListItem Value="">Select Grade</asp:ListItem>
                            <asp:ListItem Value="7">A (80-100%)</asp:ListItem>
                            <asp:ListItem Value="6">B (70-79%)</asp:ListItem>
                            <asp:ListItem Value="5">C (60-69%)</asp:ListItem>
                            <asp:ListItem Value="4">D (50-59%)</asp:ListItem>
                            <asp:ListItem Value="3">E (40-49%)</asp:ListItem>
                            <asp:ListItem Value="2">F (30-39%)</asp:ListItem>
                            <asp:ListItem Value="1">G (0-29%)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <%--<div class="form-group full-width">
                        <label>APS Score</label>
                        <div class="aps-score-display">
                            <span id="lblAPSScore">0</span>
                            <span class="aps-info" onclick="showAPSInfo()"><i class="fas fa-info-circle"></i>What's this?</span>
                        </div>
                        <div class="aps-info-popup" id="apsInfoPopup">
                            <p>The Admission Point Score (APS) is a system used by South African universities to assess applicants' academic performance. It converts your matric results into a score out of 42 (for 6 subjects).</p>
                            <p>A (80-100%) = 7 points, B (70-79%) = 6 points, C (60-69%) = 5 points, D (50-59%) = 4 points, E (40-49%) = 3 points, F (30-39%) = 2 points, G (0-29%) = 1 point</p>
                        </div>
                    </div>--%>

                    <div class="form-group full-width">
                        <label>APS Score</label>
                        <figure class="aps-score-display text-center">
                            <blockquote class="blockquote">
                                <p id="lblAPSScore">0</p>
                            </blockquote>
                            <figcaption class="blockquote-footer">
                                <span class="aps-info" onclick="showAPSInfo()">
                                    <i class="fas fa-info-circle"></i>What's this?
                                </span>
                            </figcaption>
                        </figure>
                        <div class="aps-info-popup card mt-2" id="apsInfoPopup" style="display: none;">
                            <div class="card-body">
                                <p>The Admission Point Score (APS) is a system used by South African universities to assess applicants' academic performance. It converts your matric results into a score out of 42 (for 6 subjects).</p>
                                <p>A (80-100%) = 7 points, B (70-79%) = 6 points, C (60-69%) = 5 points, D (50-59%) = 4 points, E (40-49%) = 3 points, F (30-39%) = 2 points, G (0-29%) = 1 point</p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="form-navigation">
                    <button type="button" class="btn-prev" onclick="prevStep(4, 3)"><i class="fas fa-arrow-left"></i>Previous</button>
                    <button type="button" class="btn-next" onclick="nextStep(4, 5)">Next <i class="fas fa-arrow-right"></i></button>
                </div>
            </section>

            <!-- Step 5: Document Upload -->
            <section class="form-step" id="step5">
                <h3><i class="fas fa-file-upload"></i>Document Upload</h3>
                <div class="form-grid">
                    <div class="form-group document-upload">
                        <label for="fileID">Certified ID Copy *</label>
                        <div class="upload-container">
                            <asp:FileUpload ID="fileID" runat="server" CssClass="file-upload" required="true" />
                            <label for="fileID" class="upload-btn"><i class="fas fa-cloud-upload-alt"></i>Choose File</label>
                            <span class="file-name">No file chosen</span>
                        </div>
                    </div>
                    <div class="form-group document-upload">
                        <label for="fileGrade11">Grade 11 Final Results *</label>
                        <div class="upload-container">
                            <asp:FileUpload ID="fileGrade11" runat="server" CssClass="file-upload" required="true" />
                            <label for="fileGrade11" class="upload-btn"><i class="fas fa-cloud-upload-alt"></i>Choose File</label>
                            <span class="file-name">No file chosen</span>
                        </div>
                    </div>
                    <div class="form-group document-upload">
                        <label for="fileGrade12Mid">Grade 12 Mid-term Results *</label>
                        <div class="upload-container">
                            <asp:FileUpload ID="fileGrade12Mid" runat="server" CssClass="file-upload" required="true" />
                            <label for="fileGrade12Mid" class="upload-btn"><i class="fas fa-cloud-upload-alt"></i>Choose File</label>
                            <span class="file-name">No file chosen</span>
                        </div>
                    </div>
                    <div class="form-group document-upload">
                        <label for="fileGrade12Trial">Grade 12 Trial Results</label>
                        <div class="upload-container">
                            <asp:FileUpload ID="fileGrade12Trial" runat="server" CssClass="file-upload" />
                            <label for="fileGrade12Trial" class="upload-btn"><i class="fas fa-cloud-upload-alt"></i>Choose File</label>
                            <span class="file-name">No file chosen</span>
                        </div>
                    </div>
                    <div class="form-group document-upload">
                        <label for="fileNSC">NSC Certificate (if completed)</label>
                        <div class="upload-container">
                            <asp:FileUpload ID="fileNSC" runat="server" CssClass="file-upload" />
                            <label for="fileNSC" class="upload-btn"><i class="fas fa-cloud-upload-alt"></i>Choose File</label>
                            <span class="file-name">No file chosen</span>
                        </div>
                    </div>
                    <div class="form-group document-upload">
                        <label for="fileTertiary">Tertiary Qualifications (if any)</label>
                        <div class="upload-container">
                            <asp:FileUpload ID="fileTertiary" runat="server" CssClass="file-upload" />
                            <label for="fileTertiary" class="upload-btn"><i class="fas fa-cloud-upload-alt"></i>Choose File</label>
                            <span class="file-name">No file chosen</span>
                        </div>
                    </div>
                    <div class="form-group document-upload">
                        <label for="fileParentID">Parent/Guardian Certified ID</label>
                        <div class="upload-container">
                            <asp:FileUpload ID="fileParentID" runat="server" CssClass="file-upload" />
                            <label for="fileParentID" class="upload-btn"><i class="fas fa-cloud-upload-alt"></i>Choose File</label>
                            <span class="file-name">No file chosen</span>
                        </div>
                    </div>
                    <div class="form-group document-upload">
                        <label for="fileMotivation">Motivational Letter</label>
                        <div class="upload-container">
                            <asp:FileUpload ID="fileMotivation" runat="server" CssClass="file-upload" />
                            <label for="fileMotivation" class="upload-btn"><i class="fas fa-cloud-upload-alt"></i>Choose File</label>
                            <span class="file-name">No file chosen</span>
                        </div>
                    </div>
                </div>
                <div class="form-navigation">
                    <button type="button" class="btn-prev" onclick="prevStep(5, 4)"><i class="fas fa-arrow-left"></i>Previous</button>
                    <button type="button" class="btn-next" onclick="nextStep(5, 6)">Next <i class="fas fa-arrow-right"></i></button>
                </div>
            </section>

            <!-- Step 6: Review & Submit -->
            <section class="form-step" id="step6">
                <h3><i class="fas fa-check-circle"></i>Review Your Application</h3>
                <div class="review-section">
                    <h4>Personal Details</h4>
                    <div class="review-grid">
                        <div>
                            <p><strong>Full Name:</strong> <span id="reviewFullName"></span></p>
                            <p><strong>ID Number:</strong> <span id="reviewIDNumber"></span></p>
                            <p><strong>Date of Birth:</strong> <span id="reviewDOB"></span></p>
                        </div>
                        <div>
                            <p><strong>Gender:</strong> <span id="reviewGender"></span></p>
                            <p><strong>Nationality:</strong> <span id="reviewNationality"></span></p>
                            <p><strong>Population Group:</strong> <span id="reviewPopulationGroup"></span></p>
                        </div>
                    </div>
                </div>

                <div class="review-section">
                    <h4>Contact Details</h4>
                    <div class="review-grid">
                        <div>
                            <p><strong>Email:</strong> <span id="reviewEmail"></span></p>
                            <p><strong>Phone:</strong> <span id="reviewPhone"></span></p>
                        </div>
                        <div>
                            <p><strong>Address:</strong> <span id="reviewAddress"></span></p>
                            <p><strong>Province:</strong> <span id="reviewProvince"></span></p>
                        </div>
                    </div>
                </div>

                <div class="review-section">
                    <h4>Education Details</h4>
                    <div class="review-grid">
                        <div>
                            <p><strong>High School:</strong> <span id="reviewHighSchool"></span></p>
                            <p><strong>Year Completed:</strong> <span id="reviewYearCompleted"></span></p>
                        </div>
                        <div>
                            <p><strong>Highest Qualification:</strong> <span id="reviewQualification"></span></p>
                            <p><strong>APS Score:</strong> <span id="reviewAPSScore"></span></p>
                        </div>
                    </div>
                </div>

                <div class="review-section">
                    <h4>Documents Uploaded</h4>
                    <ul class="document-list" id="reviewDocuments">
                        <!-- Will be populated by JavaScript -->
                    </ul>
                </div>

                <div class="form-group terms-checkbox">
                    <asp:CheckBox ID="chkTerms" runat="server" required="true" />
                    <label for="chkTerms">I declare that all information provided is accurate and complete. I understand that providing false information may lead to my application being rejected.</label>
                </div>

                <div class="form-navigation">
                    <button type="button" class="btn-prev" onclick="prevStep(6, 5)"><i class="fas fa-arrow-left"></i>Previous</button>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn-submit" Text="Submit Application" OnClick="btnSubmit_Click" />
                </div>
            </section>
        </main>

        <!-- Success Modal -->
        <div class="modal-overlay" id="successModal" style="display: none;">
            <div class="modal-container animate__animated animate__zoomIn">
                <div class="modal-icon success">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h2>Application Submitted Successfully!</h2>
                <p>Your university application has been successfully submitted.</p>
                <p>Reference: <strong>APP-<span id="applicationRef"></span></strong></p>
                <div class="modal-buttons">
                    <a href="../Dashboard/UserDash.aspx" class="btn-modal">Dashboard</a>
                    <a href="../Applications/MyApplications.aspx" class="btn-modal">My Applications</a>
                </div>
            </div>
        </div>
    </form>

    <script src="ApplicationForm.js"></script>
</body>
</html>
