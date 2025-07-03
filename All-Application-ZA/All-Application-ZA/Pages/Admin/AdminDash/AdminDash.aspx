<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDash.aspx.cs" Inherits="All_Application_ZA.Pages.Admin.AdminDash.AdminDash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All-Application-ZA | Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="AdminDash.css" />
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
                        <img src="../../../Assets/Images/za.png" alt="All-Application-ZA Logo" class="logo" />
                        <h1><span class="admin-badge">Admin</span></h1>
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
                                <a class="nav-link active" href="#dashboard">
                                    <i class="fas fa-tachometer-alt"></i>Dashboard
                                </a>
                                <a class="nav-link" href="#applications">
                                    <i class="fas fa-file-alt"></i>Applications
                                </a>
                                <nav class="nav nav-pills flex-column">
                                    <a class="nav-link ms-3 my-1" href="#pending-apps">Pending Review</a>
                                    <a class="nav-link ms-3 my-1" href="#approved-apps">Approved</a>
                                    <a class="nav-link ms-3 my-1" href="#rejected-apps">Rejected</a>
                                </nav>
                                <a class="nav-link" href="#users">
                                    <i class="fas fa-users"></i>Users
                                </a>
                                <nav class="nav nav-pills flex-column">
                                    <a class="nav-link ms-3 my-1" href="#admin-users">Admin Users</a>
                                    <a class="nav-link ms-3 my-1" href="#applicant-users">Applicants</a>
                                </nav>
                                <a class="nav-link" href="#reports">
                                    <i class="fas fa-chart-bar"></i>Reports
                                </a>
                                <a class="nav-link" href="#settings">
                                    <i class="fas fa-cogs"></i>System Settings
                                </a>
                            </nav>
                        </nav>
                    </div>

                    <!-- Main Content Area -->
                    <div class="col-md-9 col-lg-10 main-content">
                        <div class="admin-content-header">
                            <h2>Admin Dashboard</h2>
                            <div class="breadcrumb">
                                <span class="active">Home</span>
                            </div>
                        </div>

                        <div data-bs-spy="scroll" data-bs-target="#admin-nav" data-bs-smooth-scroll="true" class="scrollspy-content" tabindex="0">
                            <!-- Dashboard Overview -->
                            <section id="dashboard" class="content-section">
                                <div class="row stats-row">
                                    <div class="col-md-6 col-lg-3">
                                        <div class="stat-card">
                                            <div class="stat-icon bg-primary">
                                                <i class="fas fa-file-alt"></i>
                                            </div>
                                            <div class="stat-info">
                                                <h3>1,245</h3>
                                                <p>Total Applications</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        <div class="stat-card">
                                            <div class="stat-icon bg-warning">
                                                <i class="fas fa-clock"></i>
                                            </div>
                                            <div class="stat-info">
                                                <h3>328</h3>
                                                <p>Pending Review</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        <div class="stat-card">
                                            <div class="stat-icon bg-success">
                                                <i class="fas fa-check-circle"></i>
                                            </div>
                                            <div class="stat-info">
                                                <h3>782</h3>
                                                <p>Approved</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3">
                                        <div class="stat-card">
                                            <div class="stat-icon bg-danger">
                                                <i class="fas fa-times-circle"></i>
                                            </div>
                                            <div class="stat-info">
                                                <h3>135</h3>
                                                <p>Rejected</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mt-4">
                                    <div class="col-lg-8">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5>Recent Applications</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Name</th>
                                                                <th>Date</th>
                                                                <th>Status</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>APP-1001</td>
                                                                <td>John Doe</td>
                                                                <td>2023-05-15</td>
                                                                <td><span class="badge bg-warning">Pending</span></td>
                                                                <td><a href="#" class="btn btn-sm btn-outline-primary">View</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td>APP-1000</td>
                                                                <td>Jane Smith</td>
                                                                <td>2023-05-14</td>
                                                                <td><span class="badge bg-success">Approved</span></td>
                                                                <td><a href="#" class="btn btn-sm btn-outline-primary">View</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td>APP-999</td>
                                                                <td>Robert Johnson</td>
                                                                <td>2023-05-13</td>
                                                                <td><span class="badge bg-danger">Rejected</span></td>
                                                                <td><a href="#" class="btn btn-sm btn-outline-primary">View</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td>APP-998</td>
                                                                <td>Sarah Williams</td>
                                                                <td>2023-05-12</td>
                                                                <td><span class="badge bg-success">Approved</span></td>
                                                                <td><a href="#" class="btn btn-sm btn-outline-primary">View</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td>APP-997</td>
                                                                <td>Michael Brown</td>
                                                                <td>2023-05-11</td>
                                                                <td><span class="badge bg-warning">Pending</span></td>
                                                                <td><a href="#" class="btn btn-sm btn-outline-primary">View</a></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="card">
                                            <div class="card-header">
                                                <h5>Quick Actions</h5>
                                            </div>
                                            <div class="card-body">
                                                <div class="d-grid gap-2">
                                                    <button class="btn btn-primary">
                                                        <i class="fas fa-plus"></i>Add New Admin
                                                    </button>
                                                    <button class="btn btn-success">
                                                        <i class="fas fa-file-export"></i>Export Reports
                                                    </button>
                                                    <button class="btn btn-info">
                                                        <i class="fas fa-bell"></i>View Notifications
                                                    </button>
                                                    <button class="btn btn-warning">
                                                        <i class="fas fa-cog"></i>System Settings
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <!-- Applications Section -->
                            <section id="applications" class="content-section">
                                <h3>Applications Management</h3>
                                <p>Manage all submitted applications from prospective students.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>

                            <!-- Pending Applications -->
                            <section id="pending-apps" class="content-section">
                                <h4>Pending Applications</h4>
                                <p>Applications awaiting review and approval.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>

                            <!-- Approved Applications -->
                            <section id="approved-apps" class="content-section">
                                <h4>Approved Applications</h4>
                                <p>Applications that have been approved.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>

                            <!-- Rejected Applications -->
                            <section id="rejected-apps" class="content-section">
                                <h4>Rejected Applications</h4>
                                <p>Applications that have been rejected.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>

                            <!-- Users Section -->
                            <section id="users" class="content-section">
                                <h3>User Management</h3>
                                <p>Manage all system users including admins and applicants.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>

                            <!-- Admin Users -->
                            <section id="admin-users" class="content-section">
                                <h4>Admin Users</h4>
                                <p>Manage administrative users who have access to this dashboard.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>

                            <!-- Applicant Users -->
                            <section id="applicant-users" class="content-section">
                                <h4>Applicant Users</h4>
                                <p>Manage users who submit applications through the system.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>

                            <!-- Reports Section -->
                            <section id="reports" class="content-section">
                                <h3>Reports & Analytics</h3>
                                <p>Generate and view system reports and analytics.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>

                            <!-- Settings Section -->
                            <section id="settings" class="content-section">
                                <h3>System Settings</h3>
                                <p>Configure system-wide settings and preferences.</p>
                                <!-- Content would be loaded here dynamically -->
                            </section>
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
    <script src="AdminDash.js"></script>
</body>
</html>
