using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using All_Application_ZA.Classes;

namespace All_Application_ZA.Pages.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check for successful registration redirect
            if (Request.QueryString["registration"] == "success")
            {
                // Show success message if needed
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccess",
                    "showToast('success', 'Registration successful! You can now login.');", true);
            }
        }
             
        private bool ValidateForm()
        {
            bool isValid = true;

            // Validate username/email
            if (string.IsNullOrEmpty(txtUsername.Text.Trim()))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "usernameError",
                    "document.getElementById('usernameError').textContent = 'Username or email is required';", true);
                isValid = false;
            }

            // Validate password
            if (string.IsNullOrEmpty(txtPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "passwordError",
                    "document.getElementById('passwordError').textContent = 'Password is required';", true);
                isValid = false;
            }

            return isValid;
        }

        private void AuthenticateUser()
        {
            string usernameOrEmail = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            UserManagement userManager = new UserManagement();
            UserManagement.UserInfo userInfo = userManager.AuthenticateUser(usernameOrEmail, password);

            if (userInfo.IsAuthenticated)
            {
                // Store user information in session
                Session["UserId"] = userInfo.UserId;
                Session["Username"] = userInfo.Username;
                Session["FirstName"] = userInfo.FirstName;
                Session["LastName"] = userInfo.LastName;
                Session["RoleId"] = userInfo.RoleId;
                Session["RoleName"] = userInfo.RoleName;

                // Redirect based on user role
                switch (userInfo.RoleName.ToLower())
                {
                    case "student":
                        Response.Redirect("~/Pages/Applicant/Dashboard/UserDash.aspx", false);
                        break;
                    case "admin":
                        Response.Redirect("~/Pages/Admin/AdminDash/AdminDash.aspx", false);
                        break;
                    default:
                        ShowErrorMessage("Your account type doesn't have an assigned dashboard");
                        break;
                }
            }
            else
            {
                ShowErrorMessage(userInfo.Message ?? "Invalid login attempt");
            }
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showError",
                $"showToast('error', '{message.Replace("'", "\\'")}');", true);
        }

        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                AuthenticateUser();
            }
        }
    }
}
