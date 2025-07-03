<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="All_Application_ZA.Pages.Applicant.Notifications.Notifications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Notifications | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Notifications.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
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
                    <li><a href="../Applications/MyApplications.aspx"><i class="fas fa-file-alt"></i> My Applications</a></li>
                    <li><a href="../Profile/UserProfile.aspx"><i class="fas fa-user-circle"></i> User Profile</a></li>
                    <li><a href="Notifications.aspx" class="active"><i class="fas fa-bell"></i> Notifications</a></li>
                    <li><a href="../../../Pages/Login/Login.aspx"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Main Content Section -->
        <main class="notifications-container">
            <div class="notifications-header">
                <h2><i class="fas fa-bell"></i> Notifications</h2>
                <div class="notification-actions">
                    <button id="btnMarkAllRead" class="mark-read-btn">Mark All as Read</button>
                    <select id="ddlFilter" class="notification-filter">
                        <option value="All">All Notifications</option>
                        <option value="Unread">Unread Only</option>
                        <option value="Application">Application Updates</option>
                        <option value="System">System Messages</option>
                        <option value="Deadline">Deadline Reminders</option>
                    </select>
                </div>
            </div>

            <div class="notifications-list" id="notificationsList">
                <!-- Notification Item 1 -->
                <div class="notification-item unread application">
                    <div class="notification-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="notification-content">
                        <h3>Application Accepted <span class="notification-time">2 hours ago</span></h3>
                        <p>Your application to University of Cape Town for Bachelor of Science in Computer Science has been accepted!</p>
                        <div class="notification-actions">
                            <button class="view-btn">View Application</button>
                            <button class="dismiss-btn">Dismiss</button>
                        </div>
                    </div>
                </div>

                <!-- Notification Item 2 -->
                <div class="notification-item unread deadline">
                    <div class="notification-icon">
                        <i class="fas fa-exclamation-circle"></i>
                    </div>
                    <div class="notification-content">
                        <h3>Deadline Approaching <span class="notification-time">1 day ago</span></h3>
                        <p>Reminder: You have 3 days left to accept your offer from University of the Witwatersrand.</p>
                        <div class="notification-actions">
                            <button class="view-btn">View Offer</button>
                            <button class="dismiss-btn">Dismiss</button>
                        </div>
                    </div>
                </div>

                <!-- Notification Item 3 -->
                <div class="notification-item read application">
                    <div class="notification-icon">
                        <i class="fas fa-info-circle"></i>
                    </div>
                    <div class="notification-content">
                        <h3>Application Updated <span class="notification-time">3 days ago</span></h3>
                        <p>Your application to University of Pretoria is now being processed by the faculty.</p>
                        <div class="notification-actions">
                            <button class="view-btn">View Application</button>
                            <button class="dismiss-btn">Dismiss</button>
                        </div>
                    </div>
                </div>

                <!-- Notification Item 4 -->
                <div class="notification-item read system">
                    <div class="notification-icon">
                        <i class="fas fa-cog"></i>
                    </div>
                    <div class="notification-content">
                        <h3>System Maintenance <span class="notification-time">1 week ago</span></h3>
                        <p>We'll be performing scheduled maintenance on Saturday, 25 Jan 2025 from 2:00 AM to 4:00 AM.</p>
                        <div class="notification-actions">
                            <button class="dismiss-btn">Dismiss</button>
                        </div>
                    </div>
                </div>

                <!-- Notification Item 5 -->
                <div class="notification-item read application">
                    <div class="notification-icon">
                        <i class="fas fa-file-alt"></i>
                    </div>
                    <div class="notification-content">
                        <h3>Document Received <span class="notification-time">2 weeks ago</span></h3>
                        <p>University of Johannesburg has acknowledged receipt of your transcript.</p>
                        <div class="notification-actions">
                            <button class="view-btn">View Application</button>
                            <button class="dismiss-btn">Dismiss</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="no-notifications" id="noNotifications" style="display: none;">
                <i class="fas fa-bell-slash"></i>
                <h3>No Notifications</h3>
                <p>You don't have any notifications at this time.</p>
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
                        <li><a href="../Profile/UserProfile.aspx"><i class="fas fa-arrow-right"></i>Profile</a></li>
                        <li><a href="Notifications.aspx"><i class="fas fa-arrow-right"></i>Notifications</a></li>
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
    <script src="Notifications.js"></script>
</body>
</html>
