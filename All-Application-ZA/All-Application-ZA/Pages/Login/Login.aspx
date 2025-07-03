<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="All_Application_ZA.Pages.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <!-- Flaticon -->
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.0.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="Login.css" />
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Custom JS -->
    <script src="Login.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header class="header animate__animated animate__fadeInDown">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="logo-container d-flex align-items-center">
                            <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Assets/Images/za.png" CssClass="logo me-3" AlternateText="All-Application-ZA Logo" />
                            <h1 class="mb-0">All-Application-ZA</h1>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <nav class="main-nav">
                            <ul class="d-flex justify-content-end list-unstyled mb-0">
                                <li class="mx-3">
                                    <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Pages/Main/Main.aspx" CssClass="text-white text-decoration-none"><i class="fas fa-home me-2"></i>Home</asp:HyperLink>
                                </li>
                                <li class="mx-3">
                                    <asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/Pages/AboutUs/AboutUs.aspx" CssClass="text-white text-decoration-none"><i class="fas fa-info-circle me-2"></i>About Us</asp:HyperLink>
                                </li>
                                <li class="mx-3">
                                    <asp:HyperLink ID="lnkContact" runat="server" NavigateUrl="~/Pages/ContactUs/ContactUs.aspx" CssClass="text-white text-decoration-none"><i class="fas fa-envelope me-2"></i>Contact Us</asp:HyperLink>
                                </li>
                                <li class="mx-3">
                                    <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/Pages/Register/Register.aspx" CssClass="text-white text-decoration-none"><i class="fas fa-user-plus me-2"></i>Register</asp:HyperLink>
                                </li>
                                <li class="mx-3">
                                    <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Pages/Login/Login.aspx" CssClass="active text-decoration-none"><i class="fas fa-sign-in-alt me-2"></i>Login</asp:HyperLink>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="mobile-menu-btn d-md-none">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Main Content -->
        <main class="container-fluid py-2">
            <div class="row align-items-center">
                <!-- Login Form Column -->
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="login-form-container p-4 p-md-5">
                        <div class="login-form animate__animated animate__fadeInLeft">
                            <h2 class="section-title mb-4">Sign In</h2>
                            <p class="section-subtitle mb-4">Enter your credentials to continue</p>

                            <div class="form-group mb-4 position-relative">
                                <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" CssClass="form-label">Username or Email</asp:Label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fi fi-rr-user"></i></span>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                                </div>
                                <div class="underline"></div>
                                <span class="validation-error" id="usernameError"></span>
                            </div>

                            <div class="form-group mb-4 position-relative">
                                <asp:Label ID="lblPassword" runat="server" AssociatedControlControlID="txtPassword" CssClass="form-label">Password</asp:Label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fi fi-rr-lock"></i></span>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" required="true"></asp:TextBox>
                                </div>
                                <div class="underline"></div>
                                <span class="validation-error" id="passwordError"></span>
                            </div>

                            <div class="form-options d-flex justify-content-between align-items-center mb-4">
                                <div class="remember-me form-check">
                                    <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-check-input" />
                                    <asp:Label ID="lblRemember" runat="server" AssociatedControlID="chkRemember" CssClass="form-check-label">Remember me</asp:Label>
                                </div>
                                <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="#" CssClass="forgot-password">Forgot password?</asp:HyperLink>
                            </div>

                            <div class="submit-btn-container mb-4">
                                <asp:Button ID="btnLogin1" runat="server" Text="Sign In" CssClass="submit-btn w-100" OnClick="btnLogin1_Click" />
                                <i class="fas fa-sign-in-alt submit-icon"></i>
                            </div>

                            <div class="register-prompt text-center mt-4">
                                <p class="mb-0">Don't have an account?
                                    <asp:HyperLink ID="lnkRegisterNow" runat="server" NavigateUrl="~/Pages/Register/Register.aspx" CssClass="register-link">Register now</asp:HyperLink>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Features Column -->
                <div class="col-lg-6">
                    <div class="features-container p-4 p-md-5 animate__animated animate__fadeInRight">
                        <h2 class="section-title mb-4">Why Sign In?</h2>
                        <p class="section-subtitle mb-5">Access these great features</p>

                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="feature-card h-100 p-4">
                                    <div class="feature-icon mb-4">
                                        <i class="fas fa-tasks"></i>
                                    </div>
                                    <h3 class="h5 mb-3">Application Tracker</h3>
                                    <p class="mb-0">Monitor all your university applications in one place with real-time updates.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="feature-card h-100 p-4">
                                    <div class="feature-icon mb-4">
                                        <i class="fas fa-bell"></i>
                                    </div>
                                    <h3 class="h5 mb-3">Deadline Alerts</h3>
                                    <p class="mb-0">Get notifications for important application deadlines and requirements.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="feature-card h-100 p-4">
                                    <div class="feature-icon mb-4">
                                        <i class="fas fa-chart-pie"></i>
                                    </div>
                                    <h3 class="h5 mb-3">Personalized Stats</h3>
                                    <p class="mb-0">View customized statistics based on your academic profile and preferences.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="feature-card h-100 p-4">
                                    <div class="feature-icon mb-4">
                                        <i class="fas fa-book"></i>
                                    </div>
                                    <h3 class="h5 mb-3">Resources</h3>
                                    <p class="mb-0">Access exclusive application guides and university resources.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer mt-5">
            <div class="container-fluid">
                <div class="row py-4">
                    <div class="col-md-4 mb-4 mb-md-0">
                        <div class="footer-section about">
                            <h3 class="h5 mb-3">About Us</h3>
                            <p class="mb-4">All-Application-ZA helps students navigate university applications in South Africa.</p>
                            <div class="social-icons">
                                <asp:HyperLink ID="lnkFacebook" runat="server" NavigateUrl="#" CssClass="text-white me-3"><i class="fab fa-facebook-f"></i></asp:HyperLink>
                                <asp:HyperLink ID="lnkTwitter" runat="server" NavigateUrl="#" CssClass="text-white me-3"><i class="fab fa-twitter"></i></asp:HyperLink>
                                <asp:HyperLink ID="lnkInstagram" runat="server" NavigateUrl="#" CssClass="text-white"><i class="fab fa-instagram"></i></asp:HyperLink>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4 mb-md-0">
                        <div class="footer-section links">
                            <h3 class="h5 mb-3">Quick Links</h3>
                            <ul class="list-unstyled">
                                <li class="mb-2">
                                    <asp:HyperLink ID="lnkFooterHome" runat="server" NavigateUrl="~/Pages/Main/Main.aspx" CssClass="text-white text-decoration-none"><i class="fas fa-arrow-right me-2"></i>Home</asp:HyperLink>
                                </li>
                                <li class="mb-2">
                                    <asp:HyperLink ID="lnkFooterAbout" runat="server" NavigateUrl="~/Pages/AboutUs/AboutUs.aspx" CssClass="text-white text-decoration-none"><i class="fas fa-arrow-right me-2"></i>About Us</asp:HyperLink>
                                </li>
                                <li class="mb-2">
                                    <asp:HyperLink ID="lnkFooterContact" runat="server" NavigateUrl="~/Pages/ContactUs/ContactUs.aspx" CssClass="text-white text-decoration-none"><i class="fas fa-arrow-right me-2"></i>Contact Us</asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="lnkFooterGuide" runat="server" NavigateUrl="~/Pages/AppGuide/AppGuide.aspx" CssClass="text-white text-decoration-none"><i class="fas fa-arrow-right me-2"></i>Application Guide</asp:HyperLink>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="footer-section contact">
                            <h3 class="h5 mb-3">Contact Us</h3>
                            <p class="mb-3"><i class="fas fa-map-marker-alt me-2"></i>East London, Eastern Cape</p>
                            <p class="mb-3"><i class="fas fa-phone me-2"></i>+27 ## ### ####</p>
                            <p class="mb-0"><i class="fas fa-envelope me-2"></i>info@allapplicationza.co.za</p>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom text-center py-3">
                    <p class="mb-0">&copy; <%= DateTime.Now.Year %> All-Application-ZA. All Rights Reserved.</p>
                </div>
            </div>
        </footer>
    </form>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
