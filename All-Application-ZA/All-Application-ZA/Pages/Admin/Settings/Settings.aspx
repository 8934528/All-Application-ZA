<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="All_Application_ZA.Pages.Admin.Settings.Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Settings | All-Application-ZA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Settings.css" />
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
                        <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Assets/Images/za.png" CssClass="logo" AlternateText="All-Application-ZA Logo" />
                        <h1><span class="admin-badge">Admin</span></h1>
                    </div>
                    <div class="admin-controls">
                        <div class="dropdown">
                            <asp:LinkButton ID="btnAdminMenu" runat="server" CssClass="btn btn-admin dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fas fa-user-shield"></i>
                                <asp:Label ID="lblAdminName" runat="server" Text="Admin User"></asp:Label>
                            </asp:LinkButton>
                            <ul class="dropdown-menu">
                                <li>
                                    <asp:HyperLink ID="lnkProfile" runat="server" NavigateUrl="~/Pages/Admin/Profile/Profile.aspx" CssClass="dropdown-item"><i class="fas fa-user-cog"></i> Profile</asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="lnkSettings" runat="server" NavigateUrl="~/Pages/Admin/Settings/Settings.aspx" CssClass="dropdown-item"><i class="fas fa-cog"></i> Settings</asp:HyperLink></li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkLogout" runat="server" CssClass="dropdown-item" OnClick="lnkLogout_Click"><i class="fas fa-sign-out-alt"></i> Logout</asp:LinkButton></li>
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
                                <asp:HyperLink ID="lnkDashboard" runat="server" NavigateUrl="~/Pages/Admin/AdminDash/AdminDash.aspx" CssClass="nav-link"><i class="fas fa-tachometer-alt"></i> Dashboard</asp:HyperLink>
                                <asp:HyperLink ID="lnkApplications" runat="server" NavigateUrl="#" CssClass="nav-link"><i class="fas fa-file-alt"></i> Applications</asp:HyperLink>
                                <asp:HyperLink ID="lnkUsers" runat="server" NavigateUrl="#" CssClass="nav-link"><i class="fas fa-users"></i> Users</asp:HyperLink>
                                <asp:HyperLink ID="lnkReports" runat="server" NavigateUrl="#" CssClass="nav-link"><i class="fas fa-chart-bar"></i> Reports</asp:HyperLink>
                                <asp:HyperLink ID="lnkProfileNav" runat="server" NavigateUrl="~/Pages/Admin/Profile/Profile.aspx" CssClass="nav-link"><i class="fas fa-user-cog"></i> Profile</asp:HyperLink>
                                <asp:HyperLink ID="lnkSettingsNav" runat="server" NavigateUrl="~/Pages/Admin/Settings/Settings.aspx" CssClass="nav-link active"><i class="fas fa-cogs"></i> Settings</asp:HyperLink>
                            </nav>
                        </nav>
                    </div>

                    <!-- Main Content Area -->
                    <div class="col-md-9 col-lg-10 main-content">
                        <div class="admin-content-header">
                            <h2><i class="fas fa-cogs"></i>System Settings</h2>
                            <div class="breadcrumb">
                                <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Pages/Admin/AdminDash/AdminDash.aspx">Home</asp:HyperLink>
                                / <span class="active">Settings</span>
                            </div>
                        </div>

                        <div class="settings-container">
                            <div class="card">
                                <div class="card-header">
                                    <ul class="nav nav-tabs card-header-tabs" id="settingsTabs" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" id="general-tab" data-bs-toggle="tab" data-bs-target="#general" type="button" role="tab">General</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="notifications-tab" data-bs-toggle="tab" data-bs-target="#notifications" type="button" role="tab">Notifications</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="security-tab" data-bs-toggle="tab" data-bs-target="#security" type="button" role="tab">Security</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" id="advanced-tab" data-bs-toggle="tab" data-bs-target="#advanced" type="button" role="tab">Advanced</button>
                                        </li>
                                    </ul>
                                </div>

                                <div class="card-body">
                                    <div class="tab-content" id="settingsTabContent">
                                        <!-- General Settings Tab -->
                                        <div class="tab-pane fade show active" id="general" role="tabpanel">
                                            <asp:Panel ID="pnlGeneral" runat="server" DefaultButton="btnSaveGeneral">
                                                <div class="mb-3">
                                                    <asp:Label ID="lblSystemName" runat="server" CssClass="form-label" AssociatedControlID="txtSystemName">System Name</asp:Label>
                                                    <asp:TextBox ID="txtSystemName" runat="server" CssClass="form-control" Text="All-Application-ZA"></asp:TextBox>
                                                </div>
                                                <div class="mb-3">
                                                    <asp:Label ID="lblTimezone" runat="server" CssClass="form-label" AssociatedControlID="ddlTimezone">Timezone</asp:Label>
                                                    <asp:DropDownList ID="ddlTimezone" runat="server" CssClass="form-select">
                                                        <asp:ListItem Selected="True">Africa/Johannesburg (SAST)</asp:ListItem>
                                                        <asp:ListItem>UTC</asp:ListItem>
                                                        <asp:ListItem>Other timezones...</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="mb-3">
                                                    <asp:Label ID="lblDateFormat" runat="server" CssClass="form-label" AssociatedControlID="ddlDateFormat">Date Format</asp:Label>
                                                    <asp:DropDownList ID="ddlDateFormat" runat="server" CssClass="form-select">
                                                        <asp:ListItem Selected="True">YYYY-MM-DD</asp:ListItem>
                                                        <asp:ListItem>DD/MM/YYYY</asp:ListItem>
                                                        <asp:ListItem>MM/DD/YYYY</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbMaintenanceMode" runat="server" CssClass="form-check-input" />
                                                    <asp:Label ID="lblMaintenanceMode" runat="server" CssClass="form-check-label" AssociatedControlID="cbMaintenanceMode">Maintenance Mode</asp:Label>
                                                </div>
                                                <asp:Button ID="btnSaveGeneral" runat="server" Text="Save General Settings" CssClass="btn btn-primary" OnClick="btnSaveGeneral_Click" />
                                            </asp:Panel>
                                        </div>

                                        <!-- Notifications Settings Tab -->
                                        <div class="tab-pane fade" id="notifications" role="tabpanel">
                                            <asp:Panel ID="pnlNotifications" runat="server" DefaultButton="btnSaveNotifications">
                                                <h5 class="mb-3">Email Notifications</h5>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbNewApplications" runat="server" CssClass="form-check-input" Checked="true" />
                                                    <asp:Label ID="lblNewApplications" runat="server" CssClass="form-check-label" AssociatedControlID="cbNewApplications">New applications submitted</asp:Label>
                                                </div>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbApprovals" runat="server" CssClass="form-check-input" Checked="true" />
                                                    <asp:Label ID="lblApprovals" runat="server" CssClass="form-check-label" AssociatedControlID="cbApprovals">Applications needing approval</asp:Label>
                                                </div>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbSystemAlerts" runat="server" CssClass="form-check-input" Checked="true" />
                                                    <asp:Label ID="lblSystemAlerts" runat="server" CssClass="form-check-label" AssociatedControlID="cbSystemAlerts">System alerts and warnings</asp:Label>
                                                </div>

                                                <h5 class="mb-3 mt-4">In-App Notifications</h5>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbInAppNewApps" runat="server" CssClass="form-check-input" Checked="true" />
                                                    <asp:Label ID="lblInAppNewApps" runat="server" CssClass="form-check-label" AssociatedControlID="cbInAppNewApps">New applications</asp:Label>
                                                </div>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbInAppUpdates" runat="server" CssClass="form-check-input" Checked="true" />
                                                    <asp:Label ID="lblInAppUpdates" runat="server" CssClass="form-check-label" AssociatedControlID="cbInAppUpdates">Application status updates</asp:Label>
                                                </div>
                                                <asp:Button ID="btnSaveNotifications" runat="server" Text="Save Notification Settings" CssClass="btn btn-primary" OnClick="btnSaveNotifications_Click" />
                                            </asp:Panel>
                                        </div>

                                        <!-- Security Settings Tab -->
                                        <div class="tab-pane fade" id="security" role="tabpanel">
                                            <asp:Panel ID="pnlSecurity" runat="server" DefaultButton="btnSaveSecurity">
                                                <div class="mb-3">
                                                    <asp:Label ID="lblSessionTimeout" runat="server" CssClass="form-label" AssociatedControlID="txtSessionTimeout">Session Timeout (minutes)</asp:Label>
                                                    <asp:TextBox ID="txtSessionTimeout" runat="server" CssClass="form-control" TextMode="Number" Text="30" min="5" max="1440"></asp:TextBox>
                                                </div>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbRequire2FA" runat="server" CssClass="form-check-input" />
                                                    <asp:Label ID="lblRequire2FA" runat="server" CssClass="form-check-label" AssociatedControlID="cbRequire2FA">Require Two-Factor Authentication</asp:Label>
                                                </div>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbPasswordComplexity" runat="server" CssClass="form-check-input" Checked="true" />
                                                    <asp:Label ID="lblPasswordComplexity" runat="server" CssClass="form-check-label" AssociatedControlID="cbPasswordComplexity">Enforce Password Complexity</asp:Label>
                                                </div>
                                                <div class="mb-3">
                                                    <asp:Label ID="lblFailedAttempts" runat="server" CssClass="form-label" AssociatedControlID="txtFailedAttempts">Failed Login Attempts Before Lockout</asp:Label>
                                                    <asp:TextBox ID="txtFailedAttempts" runat="server" CssClass="form-control" TextMode="Number" Text="5" min="1" max="10"></asp:TextBox>
                                                </div>
                                                <asp:Button ID="btnSaveSecurity" runat="server" Text="Save Security Settings" CssClass="btn btn-primary" OnClick="btnSaveSecurity_Click" />
                                            </asp:Panel>
                                        </div>

                                        <!-- Advanced Settings Tab -->
                                        <div class="tab-pane fade" id="advanced" role="tabpanel">
                                            <div class="alert alert-warning">
                                                <i class="fas fa-exclamation-triangle"></i>Warning: These settings affect system functionality. Change with caution.
                                            </div>
                                            <asp:Panel ID="pnlAdvanced" runat="server" DefaultButton="btnSaveAdvanced">
                                                <div class="mb-3">
                                                    <asp:Label ID="lblApiKey" runat="server" CssClass="form-label" AssociatedControlID="txtApiKey">API Key</asp:Label>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="txtApiKey" runat="server" CssClass="form-control" ReadOnly="true" Text="sk_test_51Hx...W3p"></asp:TextBox>
                                                        <asp:Button ID="btnCopyApiKey" runat="server" CssClass="btn btn-outline-secondary" Text="<i class='fas fa-copy'></i> Copy" OnClientClick="copyApiKey(); return false;" />
                                                        <asp:Button ID="btnRegenerateApiKey" runat="server" CssClass="btn btn-outline-danger" Text="<i class='fas fa-sync-alt'></i> Regenerate" OnClick="btnRegenerateApiKey_Click" />
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <asp:Label ID="lblLogLevel" runat="server" CssClass="form-label" AssociatedControlID="ddlLogLevel">Logging Level</asp:Label>
                                                    <asp:DropDownList ID="ddlLogLevel" runat="server" CssClass="form-select">
                                                        <asp:ListItem>Error</asp:ListItem>
                                                        <asp:ListItem Selected="True">Warning</asp:ListItem>
                                                        <asp:ListItem>Info</asp:ListItem>
                                                        <asp:ListItem>Debug</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="mb-3 form-check">
                                                    <asp:CheckBox ID="cbEnableDebug" runat="server" CssClass="form-check-input" />
                                                    <asp:Label ID="lblEnableDebug" runat="server" CssClass="form-check-label" AssociatedControlID="cbEnableDebug">Enable Debug Mode</asp:Label>
                                                </div>
                                                <div class="mb-3">
                                                    <asp:Label ID="lblBackupFrequency" runat="server" CssClass="form-label" AssociatedControlID="ddlBackupFrequency">Database Backup Frequency</asp:Label>
                                                    <asp:DropDownList ID="ddlBackupFrequency" runat="server" CssClass="form-select">
                                                        <asp:ListItem>Daily</asp:ListItem>
                                                        <asp:ListItem Selected="True">Weekly</asp:ListItem>
                                                        <asp:ListItem>Monthly</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <asp:Button ID="btnSaveAdvanced" runat="server" Text="Save Advanced Settings" CssClass="btn btn-primary" OnClick="btnSaveAdvanced_Click" />
                                            </asp:Panel>
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
                        <p>&copy; 2023 All-Application-ZA. All rights reserved.</p>
                    </div>
                    <div class="col-md-6 text-end">
                        <p>Version 1.0.0</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Toast Notification -->
        <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
            <div id="toastNotification" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <i class="fas fa-check-circle text-success me-2"></i>
                    <strong class="me-auto">Success</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <asp:Literal ID="litToastMessage" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Settings.js"></script>
</body>
</html>
