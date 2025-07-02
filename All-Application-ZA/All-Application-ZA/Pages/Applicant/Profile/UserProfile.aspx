<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="All_Application_ZA.Pages.Applicant.Profile.UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="UserProfile.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <script src="UserProfile.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- User Header Section -->
        <header class="user-header">
            <div class="logo-container">
                <img src="../../../Assets/Images/logo.png" alt="All-Application-ZA Logo" class="logo" />
                <h1>All-Application-ZA</h1>
            </div>
            <nav class="user-nav">
                <ul>
                    <li><a href="../Dashboard/UserDash.aspx"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="../Applications/MyApplications.aspx"><i class="fas fa-file-alt"></i> My Applications</a></li>
                    <li><a href="UserProfile.aspx" class="active"><i class="fas fa-user-circle"></i> User Name</a></li>
                    <li><a href="../Notifications/Notifications.aspx"><i class="fas fa-bell"></i> Notifications</a></li>
                    <li><a href="../../../Pages/Login/Login.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Main Content Section -->
        <main class="profile-container animate__animated animate__fadeIn">
            <div class="profile-header">
                <div class="profile-picture">
                    <img src="../../../Assets/Images/default-profile.png" alt="Profile Picture" id="profileImg" />
                    <div class="upload-overlay">
                        <i class="fas fa-camera"></i>
                        <span>Change Photo</span>
                        <asp:FileUpload ID="fileUploadProfile" runat="server" CssClass="file-upload" accept="image/*" />
                    </div>
                </div>
                <div class="profile-info">
                    <h2 id="userFullName">Mihlali Mabovula</h2>
                    <p><i class="fas fa-envelope"></i> <span id="userEmail">mihlalimabovula597@gmail.com</span></p>
                    <p><i class="fas fa-phone"></i> <span id="userPhone">+27 76 893 4538</span></p>
                    <p><i class="fas fa-map-marker-alt"></i> <span id="userAddress">## ##### St, East London, South Africa</span></p>
                </div>
            </div>

            <div class="profile-content">
                <div class="profile-section">
                    <h3><i class="fas fa-user-edit"></i> Personal Information</h3>
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="txtFirstName">First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter first name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtLastName">Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Enter last name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtIDNumber">ID Number</label>
                            <asp:TextBox ID="txtIDNumber" runat="server" CssClass="form-control" placeholder="Enter ID number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtDateOfBirth">Date of Birth</label>
                            <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="ddlGender">Gender</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Select Gender</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                                <asp:ListItem Value="PreferNotToSay">Prefer not to say</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="profile-section">
                    <h3><i class="fas fa-address-book"></i> Contact Information</h3>
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="txtEmail">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter email address"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPhone">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" placeholder="Enter phone number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtAddress">Street Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter street address"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCity">City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter city"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="ddlProvince">Province</label>
                            <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control">
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
                            <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control" placeholder="Enter postal code"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="profile-section">
                    <h3><i class="fas fa-graduation-cap"></i> Education Information</h3>
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="txtHighSchool">High School</label>
                            <asp:TextBox ID="txtHighSchool" runat="server" CssClass="form-control" placeholder="Enter high school name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtYearCompleted">Year Completed</label>
                            <asp:TextBox ID="txtYearCompleted" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter year"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtSubjects">Subjects</label>
                            <asp:TextBox ID="txtSubjects" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="List your subjects"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="profile-actions">
                    <asp:Button ID="btnSaveChanges" runat="server" CssClass="save-btn" Text="Save Changes" />
                    <asp:Button ID="btnChangePassword" runat="server" CssClass="password-btn" Text="Change Password" />
                    <asp:Button ID="btnDeleteAccount" runat="server" CssClass="delete-btn" Text="Delete Account" />
                </div>
            </div>
        </main>

        <!-- User Footer Section -->
        <footer class="user-footer">
            <div class="footer-content">
                <div class="footer-section about">
                    <h3>About All-Application-ZA</h3>
                    <p>Your one-stop platform for managing university applications in South Africa. We help students navigate the application process with ease.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="footer-section links">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="../Dashboard/UserDash.aspx"><i class="fas fa-arrow-right"></i>Dashboard</a></li>
                        <li><a href="../Applications/MyApplications.aspx"><i class="fas fa-arrow-right"></i>My Applications</a></li>
                        <li><a href="../UserProfile.aspx"><i class="fas fa-arrow-right"></i>Profile</a></li>
                        <li><a href="../Notifications/Notifications.aspx"><i class="fas fa-arrow-right"></i>Notifications</a></li>
                    </ul>
                </div>
                <div class="footer-section contact">
                    <h3>Need Help?</h3>
                    <p><i class="fas fa-question-circle"></i>Check our FAQ section</p>
                    <p><i class="fas fa-envelope"></i>support@allapplicationza.co.za</p>
                    <p><i class="fas fa-phone"></i>+27 ## ### ####</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 All-Application-ZA. All Rights Reserved.</p>
            </div>
        </footer>
    </form>
</body>
</html>
