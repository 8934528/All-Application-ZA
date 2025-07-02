using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace All_Application_ZA.Pages.Admin.Settings
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load settings from database or configuration
                LoadSettings();
            }
        }

        private void LoadSettings()
        {
            // TODO: Load actual settings from your data source
            txtSystemName.Text = "All-Application-ZA";
            ddlTimezone.SelectedValue = "Africa/Johannesburg (SAST)";
            ddlDateFormat.SelectedValue = "YYYY-MM-DD";
            cbMaintenanceMode.Checked = false;

            // Notifications
            cbNewApplications.Checked = true;
            cbApprovals.Checked = true;
            cbSystemAlerts.Checked = true;
            cbInAppNewApps.Checked = true;
            cbInAppUpdates.Checked = true;

            // Security
            txtSessionTimeout.Text = "30";
            cbRequire2FA.Checked = false;
            cbPasswordComplexity.Checked = true;
            txtFailedAttempts.Text = "5";

            // Advanced
            txtApiKey.Text = "sk_test_51Hx...W3p";
            ddlLogLevel.SelectedValue = "Warning";
            cbEnableDebug.Checked = false;
            ddlBackupFrequency.SelectedValue = "Weekly";
        }

        protected void btnSaveGeneral_Click(object sender, EventArgs e)
        {
            // TODO: Save general settings to database
            ShowToast("General settings saved successfully!");
        }

        protected void btnSaveNotifications_Click(object sender, EventArgs e)
        {
            // TODO: Save notification settings to database
            ShowToast("Notification settings saved successfully!");
        }

        protected void btnSaveSecurity_Click(object sender, EventArgs e)
        {
            // TODO: Save security settings to database
            ShowToast("Security settings saved successfully!");
        }

        protected void btnSaveAdvanced_Click(object sender, EventArgs e)
        {
            // TODO: Save advanced settings to database
            ShowToast("Advanced settings saved successfully!");
        }

        protected void btnRegenerateApiKey_Click(object sender, EventArgs e)
        {
            // Generate a new API key
            string newApiKey = "sk_test_" + Guid.NewGuid().ToString("N").Substring(0, 24);
            txtApiKey.Text = newApiKey;

            // TODO: Save the new API key to database

            ShowToast("API key regenerated successfully!");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            // TODO: Perform logout operations
            Response.Redirect("~/Pages/Login/Login.aspx");
        }

        private void ShowToast(string message)
        {
            litToastMessage.Text = message;
            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "showToast('" + message + "');", true);
        }
    }
}