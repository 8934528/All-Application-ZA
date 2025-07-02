<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="All_Application_ZA.Pages.AboutUs.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="AboutUs.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <script src="AboutUs.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header (consistent with main page) -->
        <header class="header animate__animated animate__fadeInDown">
            <div class="logo-container">
                <img src="../../Assets/Images/logo.png" alt="All-Application-ZA Logo" class="logo" />
                <h1>All-Application-ZA</h1>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="../Main/Main.aspx"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="../AboutUs/AboutUs.aspx" class="active"><i class="fas fa-info-circle"></i>About Us</a></li>
                    <li><a href="../ContactUs/ContactUs.aspx"><i class="fas fa-envelope"></i>Contact Us</a></li>
                    <li><a href="../Register/Register.aspx"><i class="fas fa-user-plus"></i>Register</a></li>
                    <li><a href="../Login/Login.aspx"><i class="fas fa-sign-in-alt"></i>Login</a></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="hero animate__animated animate__fadeIn">
            <div class="hero-content">
                <h1 class="animate__animated animate__fadeInUp">Our Story</h1>
                <p class="animate__animated animate__fadeInUp animate__delay-1s">Helping South African students navigate university applications since 2024</p>
                <div class="scroll-down animate__animated animate__fadeIn animate__delay-2s">
                    <i class="fas fa-chevron-down"></i>
                </div>
            </div>
            <div class="hero-pattern"></div>
        </section>

        <!-- Mission Section -->
        <section class="mission-section">
            <div class="mission-card animate__animated animate__fadeInLeft">
                <div class="mission-icon">
                    <i class="fas fa-bullseye"></i>
                </div>
                <h2>Our Mission</h2>
                <p>To simplify the university application process and provide accurate, up-to-date information to students across South Africa.</p>
            </div>
            <div class="mission-card animate__animated animate__fadeInUp">
                <div class="mission-icon">
                    <i class="fas fa-eye"></i>
                </div>
                <h2>Our Vision</h2>
                <p>A future where every student has equal access to higher education opportunities regardless of their background.</p>
            </div>
            <div class="mission-card animate__animated animate__fadeInRight">
                <div class="mission-icon">
                    <i class="fas fa-heart"></i>
                </div>
                <h2>Our Values</h2>
                <p>Integrity, Accessibility, Innovation, and Student Success drive everything we do.</p>
            </div>
        </section>

        <!-- Team Section -->
        <section class="team-section">
            <h2 class="section-title animate__animated animate__fadeIn">Meet The Team</h2>
            <p class="section-subtitle animate__animated animate__fadeIn animate__delay-1s">The passionate people behind All-Application-ZA</p>
            
            <div class="team-grid">
                <!-- Team Member 1 -->
                <div class="team-card animate__animated animate__fadeInUp">
                    <div class="team-img">
                        <img src="../../Assets/Images/team1.jpg" alt="Team Member" />
                        <div class="social-links">
                            <%--<a href="#"><i class="fab fa-twitter"></i></a>--%>
                            <a href="#"><i class="fab fa-linkedin"></i></a>
                            <a href="#"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                    <h3>###</h3>
                    <p class="position">Founder & CEO</p>
                    <p class="bio">Former university admissions officer with 10+ years experience</p>
                </div>
                
                <!-- Team Member 2 -->
                <div class="team-card animate__animated animate__fadeInUp animate__delay-1s">
                    <div class="team-img">
                        <img src="../../Assets/Images/profile.jpg" alt="Team Member" />
                        <div class="social-links">
                            <%--<a href="#"><i class="fab fa-twitter"></i></a>--%>
                            <a href="#"><i class="fab fa-linkedin"></i></a>
                            <a href="#"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                    <h3>Mihlali Mabovula</h3>
                    <p class="position">Co-Founder | Tech Lead</p>
                    <p class="bio">Makes sure everything runs smoothly behind the scenes</p>
                </div>
                
                <!-- Team Member 3 -->
                <div class="team-card animate__animated animate__fadeInUp animate__delay-2s">
                    <div class="team-img">
                        <img src="../../Assets/Images/team3.jpg" alt="Team Member" />
                        <div class="social-links">
                            <%--<a href="#"><i class="fab fa-twitter"></i></a>--%>
                            <a href="#"><i class="fab fa-linkedin"></i></a>
                            <a href="#"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                    <h3>###</h3>
                    <p class="position">Student Advisor</p>
                    <p class="bio">Helps students navigate the application process</p>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <section class="stats-section">
            <div class="stat-item animate__animated animate__fadeIn">
                <div class="stat-number" id="students-helped">0</div>
                <div class="stat-label">Students Helped</div>
            </div>
            <div class="stat-item animate__animated animate__fadeIn animate__delay-1s">
                <div class="stat-number" id="universities">0</div>
                <div class="stat-label">Universities</div>
            </div>
            <div class="stat-item animate__animated animate__fadeIn animate__delay-2s">
                <div class="stat-number" id="success-rate">0</div>
                <div class="stat-label">Success Rate</div>
            </div>
        </section>

        <!-- Testimonials -->
        <section class="testimonials-section">
            <h2 class="section-title">What Students Say</h2>
            <div class="testimonials-container">
                <div class="testimonial-card animate__animated animate__fadeInLeft">
                    <div class="quote-icon">
                        <i class="fas fa-quote-left"></i>
                    </div>
                    <p class="testimonial-text">All-Application-ZA made applying to university so much easier! I got into my dream school thanks to their guidance.</p>
                    <div class="student-info">
                        <img src="../../Assets/Images/student1.jpg" alt="Student" />
                        <div>
                            <h4>###</h4>
                            <p>University of Cape Town, 20##</p>
                        </div>
                    </div>
                </div>
                
                <div class="testimonial-card animate__animated animate__fadeInUp">
                    <div class="quote-icon">
                        <i class="fas fa-quote-left"></i>
                    </div>
                    <p class="testimonial-text">The application status updates saved me so much stress. I knew exactly when to submit my documents.</p>
                    <div class="student-info">
                        <img src="../../Assets/Images/student2.jpg" alt="Student" />
                        <div>
                            <h4>###</h4>
                            <p>University of Johannesburg, 20##</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section" id="contact">
            <div class="cta-content animate__animated animate__zoomIn">
                <h2>Ready to start your university journey?</h2>
                <p>Join thousands of students who've successfully applied through our platform</p>
                <a href="../Main/Main.aspx" class="cta-button">Explore Universities</a>
            </div>
        </section>

        <!-- Footer (consistent with main page) -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-section about">
                    <h3>About Us</h3>
                    <p>All-Application-ZA helps students navigate university applications in South Africa.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="footer-section links">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="../Main/Main.aspx"><i class="fas fa-arrow-right"></i>Home</a></li>
                        <li><a href="../AboutUs/AboutUs.aspx"><i class="fas fa-arrow-right"></i>About Us</a></li>
                        <li><a href="../AppGuide/AppGuide.aspx"><i class="fas fa-arrow-right"></i>Application Guide</a></li>
                        <li><a href="../ContactUs/ContactUs.aspx"><i class="fas fa-arrow-right"></i>Contact Us</a></li>
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
                <p>&copy; 2025 All-Application-ZA. All Rights Reserved.</p>
            </div>
        </footer>
    </form>
</body>
</html>
