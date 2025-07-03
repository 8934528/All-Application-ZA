using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace All_Application_ZA.Classes
{
    public class SessionManager
    {
        private readonly string connectionString;

        public SessionManager()
        {
            connectionString = ConfigurationManager.ConnectionStrings["NewChapterAppDB"].ConnectionString;
        }

        public class UserSessionData
        {
            public int UserId { get; set; }
            public string Username { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public int RoleId { get; set; }
            public string RoleName { get; set; }
            public string Email { get; set; }
            public string PhoneNumber { get; set; }
            public string Address { get; set; }
            public string City { get; set; }
            public string Province { get; set; }
            public string PostalCode { get; set; }
            public string IDNumber { get; set; }
            public DateTime DateOfBirth { get; set; }
            public string Gender { get; set; }
            public string CurrentSchool { get; set; }
            public string YearOfStudy { get; set; }
            public string Bio { get; set; }
            public DateTime LastLogin { get; set; }
        }

        public void InitializeUserSession(int userId)
        {
            UserSessionData userData = GetCompleteUserData(userId);

            if (userData != null)
            {
                HttpContext.Current.Session["UserData"] = userData;
                HttpContext.Current.Session["UserId"] = userData.UserId;
                HttpContext.Current.Session["Username"] = userData.Username;
                HttpContext.Current.Session["FirstName"] = userData.FirstName;
                HttpContext.Current.Session["LastName"] = userData.LastName;
                HttpContext.Current.Session["RoleId"] = userData.RoleId;
                HttpContext.Current.Session["RoleName"] = userData.RoleName;
                HttpContext.Current.Session["Email"] = userData.Email;
            }
        }

        public UserSessionData GetCurrentUser()
        {
            if (HttpContext.Current.Session["UserData"] is UserSessionData userData)
            {
                return userData;
            }

            if (HttpContext.Current.Session["UserId"] is int userId)
            {
                return GetCompleteUserData(userId);
            }

            return null;
        }

        public void ClearUserSession()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
        }

        private UserSessionData GetCompleteUserData(int userId)
        {
            UserSessionData userData = new UserSessionData();

            string query = @"
                SELECT 
                    u.UserID, u.Username, u.Email, u.FirstName, u.LastName, 
                    u.RoleID, r.RoleName, u.LastLogin,
                    s.IDNumber, s.DateOfBirth, s.Gender, s.PhoneNumber, 
                    s.Address, s.City, s.Province, s.PostalCode, 
                    s.CurrentSchool, s.YearOfStudy, s.Bio
                FROM tbUsers u
                JOIN tbRole r ON u.RoleID = r.RoleID
                LEFT JOIN tbStudents s ON u.UserID = s.UserID
                WHERE u.UserID = @UserID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userId);
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            userData.UserId = (int)reader["UserID"];
                            userData.Username = reader["Username"].ToString();
                            userData.FirstName = reader["FirstName"].ToString();
                            userData.LastName = reader["LastName"].ToString();
                            userData.RoleId = (int)reader["RoleID"];
                            userData.RoleName = reader["RoleName"].ToString();
                            userData.Email = reader["Email"].ToString();
                            userData.LastLogin = Convert.ToDateTime(reader["LastLogin"]);

                            // Student-specific data
                            if (reader["IDNumber"] != DBNull.Value)
                            {
                                userData.IDNumber = reader["IDNumber"].ToString();
                                userData.DateOfBirth = Convert.ToDateTime(reader["DateOfBirth"]);
                                userData.Gender = reader["Gender"].ToString();
                                userData.PhoneNumber = reader["PhoneNumber"].ToString();
                                userData.Address = reader["Address"].ToString();
                                userData.City = reader["City"].ToString();
                                userData.Province = reader["Province"].ToString();
                                userData.PostalCode = reader["PostalCode"].ToString();
                                userData.CurrentSchool = reader["CurrentSchool"].ToString();
                                userData.YearOfStudy = reader["YearOfStudy"].ToString();
                                userData.Bio = reader["Bio"].ToString();
                            }
                        }
                    }
                }
            }

            return userData;
        }

        public bool IsUserLoggedIn()
        {
            return HttpContext.Current.Session["UserId"] != null;
        }

        public void RedirectIfNotLoggedIn(string redirectUrl = "~/Pages/Login/Login.aspx")
        {
            if (!IsUserLoggedIn())
            {
                HttpContext.Current.Response.Redirect(redirectUrl);
            }
        }
    }
}
