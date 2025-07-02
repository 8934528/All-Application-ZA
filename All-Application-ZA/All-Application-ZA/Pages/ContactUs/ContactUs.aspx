<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="All_Application_ZA.Pages.ContactUs.ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="ContactUs.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- Add jQuery reference -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="ContactUs.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header (consistent with main page) -->
        <header class="header animate__animated animate__fadeInDown">
            <div class="logo-container">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Assets/Images/logo.png" CssClass="logo" AlternateText="All-Application-ZA Logo" />
                <h1>All-Application-ZA</h1>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Pages/Main/Main.aspx"><i class="fas fa-home"></i>Home</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/Pages/AboutUs/AboutUs.aspx"><i class="fas fa-info-circle"></i>About Us</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkContact" runat="server" NavigateUrl="~/Pages/ContactUs/ContactUs.aspx" CssClass="active"><i class="fas fa-envelope"></i>Contact Us</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/Pages/Register/Register.aspx"><i class="fas fa-user-plus"></i>Register</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Pages/Login/Login.aspx"><i class="fas fa-sign-in-alt"></i>Login</asp:HyperLink></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="hero animate__animated animate__fadeIn">
            <div class="hero-content">
                <h1 class="animate__animated animate__fadeInUp">Get In Touch</h1>
                <p class="animate__animated animate__fadeInUp animate__delay-1s">We'd love to hear from you! Reach out with questions or feedback.</p>
                <div class="scroll-down animate__animated animate__fadeIn animate__delay-2s">
                    <i class="fas fa-chevron-down"></i>
                </div>
            </div>
            <div class="hero-pattern"></div>
        </section>

        <!-- Contact Methods -->
        <section class="contact-methods">
            <div class="contact-card animate__animated animate__fadeInLeft">
                <div class="contact-icon">
                    <i class="fas fa-phone-alt"></i>
                </div>
                <h3>Call Us</h3>
                <p>+27 ## ### ####</p>
                <asp:HyperLink ID="lnkCall" runat="server" NavigateUrl="tel:+27########" CssClass="contact-btn">Call Now</asp:HyperLink>
            </div>

            <div class="contact-card animate__animated animate__fadeInUp">
                <div class="contact-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <h3>Email Us</h3>
                <p>info@allapplicationza.co.za</p>
                <asp:HyperLink ID="lnkEmail" runat="server" NavigateUrl="mailto:info@allapplicationza.co.za" CssClass="contact-btn">Email Now</asp:HyperLink>
            </div>

            <div class="contact-card animate__animated animate__fadeInRight">
                <div class="contact-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <h3>Visit Us</h3>
                <p>East London, Eastern Cape</p>
                <asp:HyperLink ID="lnkMap" runat="server" NavigateUrl="https://maps.google.com" Target="_blank" CssClass="contact-btn">Get Directions</asp:HyperLink>
            </div>
        </section>

        <!-- Contact Form -->
        <section class="contact-form-section">
            <h2 class="section-title animate__animated animate__fadeIn">Send Us a Message</h2>
            <p class="section-subtitle animate__animated animate__fadeIn animate__delay-1s">Fill out the form below and we'll get back to you soon</p>

            <div class="form-container animate__animated animate__fadeInUp">
                <div class="form-group">
                    <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName" Text="Your Name"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required></asp:TextBox>
                    <div class="underline"></div>
                    <span class="validation-error" id="nameError"></span>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email Address"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required></asp:TextBox>
                    <div class="underline"></div>
                    <span class="validation-error" id="emailError"></span>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblSubject" runat="server" AssociatedControlID="txtSubject" Text="Subject"></asp:Label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" required></asp:TextBox>
                    <div class="underline"></div>
                    <span class="validation-error" id="subjectError"></span>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblMessage" runat="server" AssociatedControlID="txtMessage" Text="Your Message"></asp:Label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" required></asp:TextBox>
                    <div class="underline"></div>
                    <span class="validation-error" id="messageError"></span>
                </div>

                <div class="submit-btn-container">
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="submit-btn" OnClientClick="return validateForm();" />
                    <i class="fas fa-paper-plane submit-icon"></i>
                </div>
            </div>

            <div id="successMessage" class="form-success animate__animated" style="display: none;">
                <i class="fas fa-check-circle"></i>
                <h3>Message Sent!</h3>
                <p>We'll get back to you within 24 hours.</p>
            </div>
        </section>

        <!-- FAQ Section -->
        <section class="faq-section">
            <h2 class="section-title animate__animated animate__fadeIn">Frequently Asked Questions</h2>
            <p class="section-subtitle animate__animated animate__fadeIn animate__delay-1s">Quick answers to common questions</p>

            <div class="faq-container">
                <div class="faq-item animate__animated animate__fadeInUp">
                    <div class="faq-question">
                        <h3>How long does it take to get a response?</h3>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>We typically respond to all inquiries within 24 hours during business days (Monday to Friday).</p>
                    </div>
                </div>
                <div class="faq-item animate__animated animate__fadeInUp">
                    <div class="faq-question">
                        <h3>What information should I include in my message?</h3>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>Please include your full name, contact details, and as much detail as possible about your inquiry to help us assist you better.</p>
                    </div>
                </div>
                <div class="faq-item animate__animated animate__fadeInUp">
                    <div class="faq-question">
                        <h3>Do you offer support for international students?</h3>
                        <i class="fas fa-chevron-down"></i>
                    </div>
                    <div class="faq-answer">
                        <p>Yes! We provide guidance for both domestic and international students applying to South African universities.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Map Section -->
        <section class="map-section animate__animated animate__fadeIn">
            <h2 class="section-title">Find Our Office</h2>
            <div class="map-container">
                <asp:Image ID="imgMap" runat="server" ImageUrl="~/Assets/Images/map-placeholder.jpg" CssClass="map-placeholder" AlternateText="Map Location" />
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section">
            <div class="cta-content animate__animated animate__zoomIn">
                <h2>Still have questions?</h2>
                <p>Check out our comprehensive FAQ section or contact us directly</p>
                <div class="cta-buttons">
                    <asp:HyperLink ID="lnkFAQs" runat="server" NavigateUrl="#faq" CssClass="cta-button">View FAQs</asp:HyperLink>
                    <asp:HyperLink ID="lnkContactForm" runat="server" NavigateUrl="#contact-form" CssClass="cta-button alt">Contact Us</asp:HyperLink>
                </div>
            </div>
        </section>

        <!-- Footer (consistent with main page) -->
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
