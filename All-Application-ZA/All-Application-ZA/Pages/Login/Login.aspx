<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="All_Application_ZA.Pages.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="Login.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header (consistent with other pages) -->
        <header class="header animate__animated animate__fadeInDown">
            <div class="logo-container">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Assets/Images/za.png" CssClass="logo" AlternateText="All-Application-ZA Logo" />
                <h1>All-Application-ZA</h1>
            </div>
            <nav class="main-nav">
                <ul>
                    <li>
                        <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Pages/Main/Main.aspx"><i class="fas fa-home"></i>Home</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/Pages/AboutUs/AboutUs.aspx"><i class="fas fa-info-circle"></i>About Us</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="lnkContact" runat="server" NavigateUrl="~/Pages/ContactUs/ContactUs.aspx"><i class="fas fa-envelope"></i>Contact Us</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/Pages/Register/Register.aspx"><i class="fas fa-user-plus"></i>Register</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Pages/Login/Login.aspx" CssClass="active"><i class="fas fa-sign-in-alt"></i>Login</asp:HyperLink></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Login Form Section -->
        <section class="login-form-section">
            <div class="form-container animate__animated animate__fadeInUp">
                <div class="login-form">
                    <h2 class="section-title">Sign In</h2>
                    <p class="section-subtitle">Enter your credentials to continue</p>

                    <div class="form-group">
                        <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" Text="Username or Email"></asp:Label>
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

                    <div class="form-options">
                        <div class="remember-me">
                            <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-checkbox" />
                            <asp:Label ID="lblRemember" runat="server" AssociatedControlID="chkRemember" Text="Remember me"></asp:Label>
                        </div>
                        <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="#" CssClass="forgot-password">Forgot password?</asp:HyperLink>
                    </div>

                    <div class="submit-btn-container">
                        <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="submit-btn" OnClientClick="return validateLoginForm();" />
                        <i class="fas fa-sign-in-alt submit-icon"></i>
                    </div>

                    <div class="divider">
                        <span>or</span>
                    </div>

                    <div class="social-login">
                        <asp:LinkButton ID="btnGoogle" runat="server" CssClass="social-btn google" OnClientClick="return false;">
        <i class="fab fa-google"></i> Sign in with Google
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnFacebook" runat="server" CssClass="social-btn facebook" OnClientClick="return false;">
        <i class="fab fa-facebook-f"></i> Sign in with Facebook
                        </asp:LinkButton>
                    </div>
                </div>

                <div class="register-prompt">
                    <p>Don't have an account?
                        <asp:HyperLink ID="lnkRegisterNow" runat="server" NavigateUrl="~/Pages/Register/Register.aspx" CssClass="register-link">Register now</asp:HyperLink></p>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section">
            <h2 class="section-title animate__animated animate__fadeIn">Why Sign In?</h2>
            <p class="section-subtitle animate__animated animate__fadeIn animate__delay-1s">Access these great features</p>

            <div class="features-container">
                <div class="feature-card animate__animated animate__fadeInLeft">
                    <div class="feature-icon">
                        <i class="fas fa-tasks"></i>
                    </div>
                    <h3>Application Tracker</h3>
                    <p>Monitor all your university applications in one place with real-time updates.</p>
                </div>

                <div class="feature-card animate__animated animate__fadeInUp">
                    <div class="feature-icon">
                        <i class="fas fa-bell"></i>
                    </div>
                    <h3>Deadline Alerts</h3>
                    <p>Get notifications for important application deadlines and requirements.</p>
                </div>

                <div class="feature-card animate__animated animate__fadeInRight">
                    <div class="feature-icon">
                        <i class="fas fa-chart-pie"></i>
                    </div>
                    <h3>Personalized Stats</h3>
                    <p>View customized statistics based on your academic profile and preferences.</p>
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
                        <li>
                            <asp:HyperLink ID="lnkFooterHome" runat="server" NavigateUrl="~/Pages/Main/Main.aspx"><i class="fas fa-arrow-right"></i>Home</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="lnkFooterAbout" runat="server" NavigateUrl="~/Pages/AboutUs/AboutUs.aspx"><i class="fas fa-arrow-right"></i>About Us</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="lnkFooterContact" runat="server" NavigateUrl="~/Pages/ContactUs/ContactUs.aspx"><i class="fas fa-arrow-right"></i>Contact Us</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="lnkFooterGuide" runat="server" NavigateUrl="~/Pages/AppGuide/AppGuide.aspx"><i class="fas fa-arrow-right"></i>Application Guide</asp:HyperLink></li>
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
