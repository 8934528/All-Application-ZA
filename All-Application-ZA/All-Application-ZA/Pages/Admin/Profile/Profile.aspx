<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="All_Application_ZA.Pages.Admin.Profile.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All-Application-ZA | Admin Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Profile.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Admin Header -->
        <header class="admin-header">
            <div class="container-fluid">
                <div class="d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <img src="../../../Assets/Images/Adminlogo.png" alt="All-Application-ZA Logo" class="logo" />
                        <h1>All-Application-ZA <span class="admin-badge">Admin</span></h1>
                    </div>
                    <div class="admin-controls">
                        <div class="dropdown">
                            <button class="btn btn-admin dropdown-toggle" type="button" id="adminMenu" data-bs-toggle="dropdown">
                                <i class="fas fa-user-shield"></i>Admin User
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../Profile/Profile.aspx"><i class="fas fa-user-cog"></i>Profile</a></li>
                                <li><a class="dropdown-item" href="../Settings/Settings.aspx"><i class="fas fa-cog"></i>Settings</a></li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item" href="../../../Pages/Login/Login.aspx"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="admin-main">
            <div class="container-fluid">
                <div class="row">
                    <!-- Side Navigation -->
                    <div class="col-md-3 col-lg-2 sidebar">
                        <nav id="admin-nav" class="h-100 flex-column align-items-stretch pe-4">
                            <nav class="nav nav-pills flex-column">
                                <a class="nav-link" href="../AdminDash/AdminDash.aspx">
                                    <i class="fas fa-tachometer-alt"></i>Dashboard
                                </a>
                                <a class="nav-link" href="#">
                                    <i class="fas fa-file-alt"></i>Applications
                                </a>
                                <a class="nav-link" href="#">
                                    <i class="fas fa-users"></i>Users
                                </a>
                                <a class="nav-link" href="#">
                                    <i class="fas fa-chart-bar"></i>Reports
                                </a>
                                <a class="nav-link active" href="../Profile/Profile.aspx">
                                    <i class="fas fa-user-cog"></i>Profile
                                </a>
                                <a class="nav-link" href="../Settings/Settings.aspx">
                                    <i class="fas fa-cogs"></i>System Settings
                                </a>
                            </nav>
                        </nav>
                    </div>

                    <!-- Main Content Area -->
                    <div class="col-md-9 col-lg-10 main-content">
                        <div class="admin-content-header">
                            <h2><i class="fas fa-user-cog"></i> Admin Profile</h2>
                            <div class="breadcrumb">
                                <a href="../AdminDash/AdminDash.aspx">Home</a> / <span class="active">Profile</span>
                            </div>
                        </div>

                        <div class="profile-container">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card profile-card">
                                        <div class="card-body text-center">
                                            <div class="profile-picture">
                                                <img src="../../../Assets/Images/default-avatar.jpg" alt="Profile Picture" class="img-fluid rounded-circle" id="profileImage" />
                                                <button class="btn btn-sm btn-change-picture" id="changePictureBtn">
                                                    <i class="fas fa-camera"></i> Change
                                                </button>
                                                <input type="file" id="profilePictureInput" accept="image/*" style="display: none;" />
                                            </div>
                                            <h3 class="profile-name" id="profileName">Admin User</h3>
                                            <p class="profile-role">System Administrator</p>
                                            <p class="profile-email" id="profileEmail">admin@allapplicationza.co.za</p>
                                            <hr />
                                            <div class="profile-stats">
                                                <div class="stat-item">
                                                    <h5>1,245</h5>
                                                    <p>Applications</p>
                                                </div>
                                                <div class="stat-item">
                                                    <h5>3</h5>
                                                    <p>Years</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4>Profile Information</h4>
                                        </div>
                                        <div class="card-body">
                                            <form id="profileForm">
                                                <div class="row mb-3">
                                                    <div class="col-md-6">
                                                        <label for="firstName" class="form-label">First Name</label>
                                                        <input type="text" class="form-control" id="firstName" value="Admin" required />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="lastName" class="form-label">Last Name</label>
                                                        <input type="text" class="form-control" id="lastName" value="User" required />
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="email" class="form-label">Email Address</label>
                                                    <input type="email" class="form-control" id="email" value="admin@allapplicationza.co.za" required />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="phone" class="form-label">Phone Number</label>
                                                    <input type="tel" class="form-control" id="phone" value="+27 12 345 6789" required />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="bio" class="form-label">Bio</label>
                                                    <textarea class="form-control" id="bio" rows="3">System administrator with full access to all application management features.</textarea>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Update Profile</button>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="card mt-4">
                                        <div class="card-header">
                                            <h4>Change Password</h4>
                                        </div>
                                        <div class="card-body">
                                            <form id="passwordForm">
                                                <div class="mb-3">
                                                    <label for="currentPassword" class="form-label">Current Password</label>
                                                    <input type="password" class="form-control" id="currentPassword" required />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="newPassword" class="form-label">New Password</label>
                                                    <input type="password" class="form-control" id="newPassword" required minlength="8" />
                                                    <div class="form-text">Password must be at least 8 characters long</div>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                                    <input type="password" class="form-control" id="confirmPassword" required />
                                                </div>
                                                <button type="submit" class="btn btn-primary">Change Password</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="admin-footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <p>&copy; 2025 All-Application-ZA. All rights reserved.</p>
                    </div>
                    <div class="col-md-6 text-end">
                        <p>Version 1.0.0</p>
                    </div>
                </div>
            </div>
        </footer>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Profile.js"></script>
</body>
</html>
