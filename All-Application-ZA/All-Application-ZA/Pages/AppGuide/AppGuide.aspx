<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppGuide.aspx.cs" Inherits="All_Application_ZA.Pages.AppGuide.AppGuide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Guide | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="AppGuide.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="AppGuide.js"></script>
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
                    <li><asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/Pages/Register/Register.aspx"><i class="fas fa-user-plus"></i>Register</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Pages/Login/Login.aspx"><i class="fas fa-sign-in-alt"></i>Login</asp:HyperLink></li>
                    <li><asp:HyperLink ID="lnkAppGuide" runat="server" NavigateUrl="~/Pages/AppGuide/AppGuide.aspx" CssClass="active"><i class="fas fa-book-open"></i>Application Guide</asp:HyperLink></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Hero Section -->
        <section class="hero animate__animated animate__fadeIn">
            <div class="hero-content">
                <h1 class="animate__animated animate__fadeInUp">University Application Guide</h1>
                <p class="animate__animated animate__fadeInUp animate__delay-1s">Your comprehensive resource for South African university applications</p>
                <div class="scroll-down animate__animated animate__fadeIn animate__delay-2s">
                    <i class="fas fa-chevron-down"></i>
                </div>
            </div>
            <div class="hero-pattern"></div>
        </section>

        <!-- Guide Navigation -->
        <section class="guide-nav-section">
            <div class="container animate__animated animate__fadeIn">
                <h2 class="section-title">Quick Navigation</h2>
                <div class="guide-nav-container">
                    <asp:Repeater ID="rptGuideNav" runat="server">
                        <ItemTemplate>
                            <a href="#<%# Eval("Anchor") %>" class="guide-nav-card animate__animated animate__fadeInUp">
                                <div class="guide-nav-icon">
                                    <i class="fas <%# Eval("Icon") %>"></i>
                                </div>
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Description") %></p>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Application Timeline -->
        <section id="timeline" class="timeline-section">
            <div class="container animate__animated animate__fadeIn">
                <h2 class="section-title">Application Timeline</h2>
                <p class="section-subtitle">Key dates and deadlines for university applications</p>
                
                <div class="timeline-container">
                    <asp:Repeater ID="rptTimeline" runat="server">
                        <ItemTemplate>
                            <div class="timeline-item animate__animated animate__fadeInLeft">
                                <div class="timeline-date"><%# Eval("Date") %></div>
                                <div class="timeline-content">
                                    <h3><%# Eval("Title") %></h3>
                                    <p><%# Eval("Description") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Requirements Section -->
        <section id="requirements" class="requirements-section">
            <div class="container animate__animated animate__fadeIn">
                <h2 class="section-title">Application Requirements</h2>
                <p class="section-subtitle">What you'll need to apply to South African universities</p>
                
                <div class="requirements-container">
                    <div class="requirements-card animate__animated animate__fadeIn">
                        <div class="requirements-header">
                            <i class="fas fa-file-alt"></i>
                            <h3>Document Checklist</h3>
                        </div>
                        <ul class="requirements-list">
                            <asp:Repeater ID="rptDocuments" runat="server">
                                <ItemTemplate>
                                    <li><i class="fas fa-check-circle"></i> <%# Eval("Item") %></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    
                    <div class="requirements-card animate__animated animate__fadeIn">
                        <div class="requirements-header">
                            <i class="fas fa-graduation-cap"></i>
                            <h3>Academic Requirements</h3>
                        </div>
                        <div class="requirements-content">
                            <asp:Literal ID="ltAcademicRequirements" runat="server"></asp:Literal>
                        </div>
                    </div>
                    
                    <div class="requirements-card animate__animated animate__fadeIn">
                        <div class="requirements-header">
                            <i class="fas fa-money-bill-wave"></i>
                            <h3>Financial Considerations</h3>
                        </div>
                        <div class="requirements-content">
                            <asp:Literal ID="ltFinancialInfo" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- University Comparison -->
        <section id="comparison" class="comparison-section">
            <div class="container animate__animated animate__fadeIn">
                <h2 class="section-title">University Comparison</h2>
                <p class="section-subtitle">Compare South Africa's top universities</p>
                
                <div class="comparison-filters">
                    <asp:DropDownList ID="ddlProvince" runat="server" CssClass="filter-dropdown" AutoPostBack="true">
                        <asp:ListItem Value="all" Text="All Provinces" Selected="True"></asp:ListItem>
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
                    
                    <asp:DropDownList ID="ddlProgramType" runat="server" CssClass="filter-dropdown" AutoPostBack="true">
                        <asp:ListItem Value="all" Text="All Program Types" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="undergrad" Text="Undergraduate"></asp:ListItem>
                        <asp:ListItem Value="postgrad" Text="Postgraduate"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <div class="comparison-table-container">
                    <asp:GridView ID="gvUniversities" runat="server" CssClass="comparison-table" AutoGenerateColumns="false" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Rank" HeaderText="Rank" />
                            <asp:TemplateField HeaderText="University">
                                <ItemTemplate>
                                    <div class="university-info">
                                        <asp:Image ID="imgLogo" runat="server" ImageUrl='<%# Eval("LogoUrl") %>' CssClass="university-logo" />
                                        <span><%# Eval("Name") %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                            <asp:BoundField DataField="ApplicationFee" HeaderText="App Fee" />
                            <asp:BoundField DataField="ClosingDate" HeaderText="Closing Date" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:HyperLink ID="lnkApply" runat="server" NavigateUrl='<%# Eval("ApplyUrl") %>' CssClass="apply-btn">Apply Now</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </section>

        <!-- FAQ Section -->
        <section id="faq" class="faq-section">
            <div class="container animate__animated animate__fadeIn">
                <h2 class="section-title">Frequently Asked Questions</h2>
                <p class="section-subtitle">Common questions about university applications</p>
                
                <div class="faq-container">
                    <asp:Repeater ID="rptFAQ" runat="server">
                        <ItemTemplate>
                            <div class="faq-item animate__animated animate__fadeInUp">
                                <div class="faq-question">
                                    <h3><%# Eval("Question") %></h3>
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                                <div class="faq-answer">
                                    <p><%# Eval("Answer") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Resources Section -->
        <section id="resources" class="resources-section">
            <div class="container animate__animated animate__fadeIn">
                <h2 class="section-title">Additional Resources</h2>
                <p class="section-subtitle">Helpful links and downloads for your application</p>
                
                <div class="resources-container">
                    <asp:Repeater ID="rptResources" runat="server">
                        <ItemTemplate>
                            <div class="resource-card animate__animated animate__fadeIn">
                                <div class="resource-icon">
                                    <i class="fas <%# Eval("Icon") %>"></i>
                                </div>
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Description") %></p>
                                <asp:HyperLink ID="lnkResource" runat="server" NavigateUrl='<%# Eval("Url") %>' CssClass="resource-link">
                                    <%# Eval("LinkText") %> <i class="fas fa-arrow-right"></i>
                                </asp:HyperLink>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section">
            <div class="container">
                <div class="cta-content animate__animated animate__zoomIn">
                    <h2>Ready to start your application?</h2>
                    <p>Create an account to begin your university application journey</p>
                    <div class="cta-buttons">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Register/Register.aspx" CssClass="cta-button">Register Now</asp:HyperLink>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Pages/ContactUs/ContactUs.aspx" CssClass="cta-button alt">Get Help</asp:HyperLink>
                    </div>
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
