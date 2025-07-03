using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using All_Application_ZA.Classes;

namespace All_Application_ZA.Pages.Register
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        private bool ValidateForm()
        {
            // Validate required fields
            if (string.IsNullOrEmpty(txtFirstName.Text.Trim()))
            {
                ShowErrorMessage("First name is required");
                return false;
            }

            if (string.IsNullOrEmpty(txtLastName.Text.Trim()))
            {
                ShowErrorMessage("Last name is required");
                return false;
            }

            if (string.IsNullOrEmpty(txtIDNumber.Text.Trim()))
            {
                ShowErrorMessage("ID/Passport number is required");
                return false;
            }

            if (string.IsNullOrEmpty(txtEmail.Text.Trim()))
            {
                ShowErrorMessage("Email is required");
                return false;
            }

            if (string.IsNullOrEmpty(txtPhone.Text.Trim()))
            {
                ShowErrorMessage("Phone number is required");
                return false;
            }

            if (string.IsNullOrEmpty(txtAddress.Text.Trim()))
            {
                ShowErrorMessage("Address is required");
                return false;
            }

            if (ddlProvince.SelectedValue == "")
            {
                ShowErrorMessage("Province is required");
                return false;
            }

            if (string.IsNullOrEmpty(txtUsername.Text.Trim()))
            {
                ShowErrorMessage("Username is required");
                return false;
            }

            if (string.IsNullOrEmpty(txtPassword.Text))
            {
                ShowErrorMessage("Password is required");
                return false;
            }

            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                ShowErrorMessage("Passwords do not match");
                return false;
            }

            if (!chkTerms.Checked)
            {
                ShowErrorMessage("You must agree to the terms and conditions");
                return false;
            }

            return true;
        }

        private void RegisterStudent()
        {
            UserManagement userManager = new UserManagement();

            // Get form values
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string idNumber = txtIDNumber.Text.Trim();
            DateTime dateOfBirth = DateTime.Parse(txtDOB.Text);
            string gender = "";
            string phoneNumber = txtPhone.Text.Trim();
            string address = txtAddress.Text.Trim();
            string city = "";
            string province = ddlProvince.SelectedValue;
            string postalCode = "";
            string currentSchool = "";
            string yearOfStudy = "";
            string bio = "";

            // Check if username is available
            if (userManager.IsUsernameTaken(username))
            {
                ShowErrorMessage("Username is already taken");
                return;
            }

            // Check if email is available
            if (userManager.IsEmailRegistered(email))
            {
                ShowErrorMessage("Email is already registered");
                return;
            }

            // Attempt registration
            UserManagement.UserInfo result = userManager.RegisterStudent(
                username, email, password,
                firstName, lastName,
                idNumber, dateOfBirth, gender,
                phoneNumber, address, city,
                province, postalCode, currentSchool,
                yearOfStudy, bio
            );

            if (result.IsAuthenticated)
            {
                // Registration successful - redirect to login page with success parameter
                Response.Redirect("~/Pages/Login/Login.aspx?registration=success", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                ShowErrorMessage(result.Message);
            }
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{message.Replace("'", "\\'")}');", true);
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                RegisterStudent();
            }
        }
    }
}
