<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="All_Application_ZA.Pages.Register.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Register.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="Register.js"></script>
</head>

<body>
    <form id="form1" runat="server">
        <!-- Header (consistent with other pages) -->
        <header class="header animate__animated animate__fadeInDown">
            <div class="logo-container">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Assets/Images/za.png" CssClass="logo" AlternateText="All-Application-ZA Logo" />
            </div>
            <nav class="main-nav">
                <ul>
                    <li><asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Pages/Main/Main.aspx"><i class="fas fa-home"></i>Home</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/Pages/AboutUs/AboutUs.aspx"><i class="fas fa-info-circle"></i>About Us</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkContact" runat="server" NavigateUrl="~/Pages/ContactUs/ContactUs.aspx"><i class="fas fa-envelope"></i>Contact Us</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/Pages/Register/Register.aspx" CssClass="active"><i class="fas fa-user-plus"></i>Register</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Pages/Login/Login.aspx"><i class="fas fa-sign-in-alt"></i>Login</asp:HyperLink></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Registration Form -->
        <section class="register-form-section">
            <div class="form-container animate__animated animate__fadeInUp">
                <h2 class="section-title">Student Registration</h2>
                <p class="section-subtitle">Fill in your details to get started</p>

                <div class="form-columns">
                    <!-- Personal Information Column -->
                    <div class="form-column">
                        <h3><i class="fas fa-user-circle"></i> Personal Information</h3>
                        
                        <div class="form-group">
                            <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName" Text="First Name"></asp:Label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="firstNameError"></span>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName" Text="Last Name"></asp:Label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="lastNameError"></span>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblIDNumber" runat="server" AssociatedControlID="txtIDNumber" Text="ID/Passport Number"></asp:Label>
                            <asp:TextBox ID="txtIDNumber" runat="server" CssClass="form-control" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="idNumberError"></span>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblDOB" runat="server" AssociatedControlID="txtDOB" Text="Date of Birth"></asp:Label>
                            <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="dobError"></span>
                        </div>
                    </div>

                    <!-- Contact Information Column -->
                    <div class="form-column">
                        <h3><i class="fas fa-address-book"></i> Contact Information</h3>
                        
                        <div class="form-group">
                            <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email Address"></asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="emailError"></span>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" Text="Phone Number"></asp:Label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="phoneError"></span>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblAddress" runat="server" AssociatedControlID="txtAddress" Text="Physical Address"></asp:Label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="addressError"></span>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblProvince" runat="server" AssociatedControlID="ddlProvince" Text="Province"></asp:Label>
                            <asp:DropDownList ID="ddlProvince" runat="server" CssClass="form-control" required>
                                <asp:ListItem Value="" Text="Select Province" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="EC" Text="Eastern Cape"></asp:ListItem>
                                <asp:ListItem Value="FS" Text="Free State"></asp:ListItem>
                                <asp:ListItem Value="GP" Text="Gauteng"></asp:ListItem>
                                <asp:ListItem Value="KZN" Text="KwaZulu-Natal"></asp:ListItem>
                                <asp:ListItem Value="LP" Text="Limpopo"></asp:ListItem>
                                <asp:ListItem Value="MP" Text="Mpumalanga"></asp:ListItem>
                                <asp:ListItem Value="NC" Text="Northern Cape"></asp:ListItem>
                                <asp:ListItem Value="NW" Text="North West"></asp:ListItem>
                                <asp:ListItem Value="WC" Text="Western Cape"></asp:ListItem>
                            </asp:DropDownList>
                            <div class="underline"></div>
                            <span class="validation-error" id="provinceError"></span>
                        </div>
                    </div>

                    <!-- Account Information Column -->
                    <div class="form-column">
                        <h3><i class="fas fa-lock"></i> Account Information</h3>
                        
                        <div class="form-group">
                            <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" Text="Username"></asp:Label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="usernameError"></span>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password"></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="passwordError"></span>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword" Text="Confirm Password"></asp:Label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" required></asp:TextBox>
                            <div class="underline"></div>
                            <span class="validation-error" id="confirmPasswordError"></span>
                        </div>

                        <div class="form-group checkbox-group">
                            <asp:CheckBox ID="chkTerms" runat="server" CssClass="form-checkbox" />
                            <asp:Label ID="lblTerms" runat="server" AssociatedControlID="chkTerms" Text="I agree to the Terms and Conditions"></asp:Label>
                            <span class="validation-error" id="termsError"></span>
                        </div>
                    </div>
                </div>

                <div class="submit-btn-container">
                    <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="submit-btn" OnClientClick="return validateRegisterForm();" />
                    <i class="fas fa-user-plus submit-icon"></i>
                </div>
            </div>

            <div id="successMessage" class="form-success animate__animated" style="display: none;">
                <i class="fas fa-check-circle"></i>
                <h3>Registration Successful!</h3>
                <p>Your account has been created. You can now login.</p>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Login/Login.aspx" CssClass="success-link">Proceed to Login</asp:HyperLink>
            </div>
        </section>

        <!-- Benefits Section -->
        <section class="benefits-section">
            <h2 class="section-title animate__animated animate__fadeIn">Why Register With Us?</h2>
            <p class="section-subtitle animate__animated animate__fadeIn animate__delay-1s">Discover the benefits of being a member</p>

            <div class="benefits-container">
                <div class="benefit-card animate__animated animate__fadeInLeft">
                    <div class="benefit-icon">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h3>University Matching</h3>
                    <p>Get personalized recommendations based on your academic profile and preferences.</p>
                </div>

                <div class="benefit-card animate__animated animate__fadeInUp">
                    <div class="benefit-icon">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <h3>Application Tracking</h3>
                    <p>Track all your university applications in one place with deadline reminders.</p>
                </div>

                <div class="benefit-card animate__animated animate__fadeInRight">
                    <div class="benefit-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3>Admission Statistics</h3>
                    <p>Access historical admission data to make informed application decisions.</p>
                </div>
            </div>
        </section>

        <!-- Footer (consistent with other pages) -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-section about">
                    <h3>About Us</h3>
                    <p>All-Application-ZA helps students navigate university applications in South Africa.</p>
                    <div class="social-icons">
                        <asp:HyperLink ID="lnkFacebook" runat="server" NavigateUrl="#"><i class="fab fa-facebook"></i></asp:HyperLink>
                        <asp:HyperLink ID="lnkTwitter" runat="server" NavigateUrl="#"><i class="fab fa-twitter"></i></asp:HyperLink>
                        <asp:HyperLink ID="lnkInstagram" runat="server" NavigateUrl="#"><i class="fab fa-instagram"></i></asp:HyperLink>
                    </div>
                </div>
                <div class="footer-section links">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><asp:HyperLink ID="lnkFooterHome" runat="server" NavigateUrl="~/Pages/Main/Main.aspx"><i class="fas fa-arrow-right"></i>Home</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterAbout" runat="server" NavigateUrl="~/Pages/AboutUs/AboutUs.aspx"><i class="fas fa-arrow-right"></i>About Us</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterContact" runat="server" NavigateUrl="~/Pages/ContactUs/ContactUs.aspx"><i class="fas fa-arrow-right"></i>Contact Us</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterGuide" runat="server" NavigateUrl="~/Pages/AppGuide/AppGuide.aspx"><i class="fas fa-arrow-right"></i>Application Guide</asp:HyperLink></li>
                    </ul>
                </div>
                <div class="footer-section contact">
                    <h3>Contact Us</h3>
                    <p><i class="fas fa-map-marker-alt"></i>East London, Eastern Cape</p>
                    <p><i class="fas fa-phone"></i>+27 ## ### ####</p>
                    <p><i class="fas fa-envelope"></i>info@allapplicationza.co.za</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; <%= DateTime.Now.Year %> All-Application-ZA. All Rights Reserved.</p>
            </div>
        </footer>
    </form>
</body>
</html>
