<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyApplications.aspx.cs" Inherits="All_Application_ZA.Pages.Applicant.Applications.MyApplications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Applications | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="MyApplications.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <script src="MyApplications.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- User Header Section -->
        <header class="user-header">
            <div class="logo-container">
                <img src="../../../Assets/Images/za.png" alt="All-Application-ZA Logo" class="logo" />
            </div>
            <nav class="user-nav">
                <ul>
                    <li><a href="../Dashboard/UserDash.aspx"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="MyApplications.aspx" class="active"><i class="fas fa-file-alt"></i> My Applications</a></li>
                    <li><a href="../Profile/UserProfile.aspx"><i class="fas fa-user-circle"></i> User Profile</a></li>
                    <li><a href="../Notifications/Notifications.aspx"><i class="fas fa-bell"></i> Notifications</a></li>
                    <li><a href="../../../Pages/Login/Login.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Main Content Section -->
        <main class="applications-container animate__animated animate__fadeIn">
            <div class="applications-header">
                <h2><i class="fas fa-file-alt"></i> My University Applications</h2>
                <div class="filter-options">
                    <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="status-filter">
                        <asp:ListItem Value="All">All Applications</asp:ListItem>
                        <asp:ListItem Value="Submitted">Submitted</asp:ListItem>
                        <asp:ListItem Value="Processing">Processing</asp:ListItem>
                        <asp:ListItem Value="Accepted">Accepted</asp:ListItem>
                        <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                        <asp:ListItem Value="Waitlisted">Waitlisted</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnRefresh" runat="server" CssClass="refresh-btn" Text="Refresh" />
                </div>
            </div>

            <div class="applications-list" id="applicationsList">
                <!-- Application Card 1 -->
                <div class="application-card submitted">
                    <div class="card-header">
                        <div class="university-info">
                            <img src="../../../Assets/Images/uct.jpeg" alt="UCT Logo" class="university-logo" />
                            <div>
                                <h3>University of Cape Town</h3>
                                <p>Bachelor of Science in Computer Science</p>
                            </div>
                        </div>
                        <span class="status-badge submitted">Submitted</span>
                    </div>
                    <div class="card-body">
                        <div class="application-details">
                            <div class="detail-item">
                                <i class="fas fa-calendar-alt"></i>
                                <span>Submitted: 15 Jan 2025</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-clock"></i>
                                <span>Last updated: 20 Jan 2025</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-info-circle"></i>
                                <span>Application ID: APP-2025-00123</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnViewDetails1" runat="server" CssClass="view-btn" Text="View Details" />
                        <a href="https://www.uct.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i> University Website</a>
                    </div>
                </div>

                <!-- Application Card 2 -->
                <div class="application-card processing">
                    <div class="card-header">
                        <div class="university-info">
                            <img src="../../../Assets/Images/up.png" alt="UP Logo" class="university-logo" />
                            <div>
                                <h3>University of Pretoria</h3>
                                <p>Bachelor of Engineering (Computer Engineering)</p>
                            </div>
                        </div>
                        <span class="status-badge processing">Processing</span>
                    </div>
                    <div class="card-body">
                        <div class="application-details">
                            <div class="detail-item">
                                <i class="fas fa-calendar-alt"></i>
                                <span>Submitted: 10 Jan 2025</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-clock"></i>
                                <span>Last updated: 18 Jan 2025</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-info-circle"></i>
                                <span>Application ID: APP-2025-00098</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnViewDetails2" runat="server" CssClass="view-btn" Text="View Details" />
                        <a href="https://www.up.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i> University Website</a>
                    </div>
                </div>

                <!-- Application Card 3 -->
                <div class="application-card accepted">
                    <div class="card-header">
                        <div class="university-info">
                            <img src="../../../Assets/Images/wits.png" alt="Wits Logo" class="university-logo" />
                            <div>
                                <h3>University of the Witwatersrand</h3>
                                <p>Bachelor of Science in Data Science</p>
                            </div>
                        </div>
                        <span class="status-badge accepted">Accepted</span>
                    </div>
                    <div class="card-body">
                        <div class="application-details">
                            <div class="detail-item">
                                <i class="fas fa-calendar-alt"></i>
                                <span>Submitted: 5 Jan 2025</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-clock"></i>
                                <span>Last updated: 12 Jan 2025</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-info-circle"></i>
                                <span>Application ID: APP-2025-00045</span>
                            </div>
                            <div class="detail-item highlight">
                                <i class="fas fa-check-circle"></i>
                                <span>Acceptance deadline: 15 Feb 2025</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnAcceptOffer" runat="server" CssClass="accept-btn" Text="Accept Offer" />
                        <asp:Button ID="btnDeclineOffer" runat="server" CssClass="decline-btn" Text="Decline Offer" />
                        <a href="https://www.wits.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i> University Website</a>
                    </div>
                </div>

                <!-- Application Card 4 -->
                <div class="application-card waitlisted">
                    <div class="card-header">
                        <div class="university-info">
                            <img src="../../../Assets/Images/ukzn.png" alt="UKZN Logo" class="university-logo" />
                            <div>
                                <h3>University of KwaZulu-Natal</h3>
                                <p>Bachelor of Medical Science</p>
                            </div>
                        </div>
                        <span class="status-badge waitlisted">Waitlisted</span>
                    </div>
                    <div class="card-body">
                        <div class="application-details">
                            <div class="detail-item">
                                <i class="fas fa-calendar-alt"></i>
                                <span>Submitted: 8 Jan 2025</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-clock"></i>
                                <span>Last updated: 15 Jan 2025</span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-info-circle"></i>
                                <span>Application ID: APP-2025-00076</span>
                            </div>
                            <div class="detail-item highlight">
                                <i class="fas fa-hourglass-half"></i>
                                <span>Waitlist position: 12</span>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnViewDetails4" runat="server" CssClass="view-btn" Text="View Details" />
                        <a href="https://www.ukzn.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i> University Website</a>
                    </div>
                </div>
            </div>

            <div class="no-applications" id="noApplications" style="display: none;">
                <i class="fas fa-file-alt"></i>
                <h3>No Applications Found</h3>
                <p>You haven't submitted any applications yet.</p>
                <asp:Button ID="btnBrowseUniversities" runat="server" CssClass="browse-btn" Text="Browse Universities" />
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
                        <li><a href="MyApplications.aspx"><i class="fas fa-arrow-right"></i>My Applications</a></li>
                        <li><a href="../Profile/UserProfile.aspx"><i class="fas fa-arrow-right"></i>Profile</a></li>
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
