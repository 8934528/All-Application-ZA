using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace All_Application_ZA.Classes
{
    public class UserManagement
    {
        private readonly string connectionString;

        public UserManagement()
        {
            connectionString = ConfigurationManager.ConnectionStrings["NewChapterAppDB"].ConnectionString;
        }

        public class UserInfo
        {
            public bool IsAuthenticated { get; set; }
            public string Message { get; set; }
            public int UserId { get; set; }
            public string Username { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public int RoleId { get; set; }
            public string RoleName { get; set; }
        }

        // Register a new student
        public UserInfo RegisterStudent(string username, string email, string password,
                                      string firstName, string lastName,
                                      string idNumber, DateTime dateOfBirth, string gender,
                                      string phoneNumber, string address, string city,
                                      string province, string postalCode, string currentSchool,
                                      string yearOfStudy, string bio)
        {
            UserInfo result = new UserInfo();

            if (IsUsernameTaken(username))
            {
                result.IsAuthenticated = false;
                result.Message = "Username is already taken";
                return result;
            }

            if (IsEmailRegistered(email))
            {
                result.IsAuthenticated = false;
                result.Message = "Email is already registered";
                return result;
            }

            string passwordHash = HashPassword(password);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Insert into tbUsers table
                    string userQuery = @"INSERT INTO tbUsers (Username, Email, PasswordHash, FirstName, LastName, RoleID)
                                         OUTPUT INSERTED.UserID
                                         VALUES (@Username, @Email, @PasswordHash, @FirstName, @LastName, 1)";

                    int userId;
                    using (SqlCommand command = new SqlCommand(userQuery, connection, transaction))
                    {
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@PasswordHash", passwordHash);
                        command.Parameters.AddWithValue("@FirstName", firstName);
                        command.Parameters.AddWithValue("@LastName", lastName);

                        userId = (int)command.ExecuteScalar();
                    }

                    // Insert into tbStudents table
                    string studentQuery = @"INSERT INTO tbStudents 
                                           (UserID, IDNumber, DateOfBirth, Gender, PhoneNumber, 
                                            Address, City, Province, PostalCode, 
                                            CurrentSchool, YearOfStudy, Bio)
                                           VALUES 
                                           (@UserID, @IDNumber, @DateOfBirth, @Gender, @PhoneNumber, 
                                            @Address, @City, @Province, @PostalCode, 
                                            @CurrentSchool, @YearOfStudy, @Bio)";

                    using (SqlCommand command = new SqlCommand(studentQuery, connection, transaction))
                    {
                        command.Parameters.AddWithValue("@UserID", userId);
                        command.Parameters.AddWithValue("@IDNumber", idNumber);
                        command.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                        command.Parameters.AddWithValue("@Gender", gender);
                        command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                        command.Parameters.AddWithValue("@Address", address);
                        command.Parameters.AddWithValue("@City", city);
                        command.Parameters.AddWithValue("@Province", province);
                        command.Parameters.AddWithValue("@PostalCode", postalCode);
                        command.Parameters.AddWithValue("@CurrentSchool", currentSchool);
                        command.Parameters.AddWithValue("@YearOfStudy", yearOfStudy);
                        command.Parameters.AddWithValue("@Bio", bio);

                        command.ExecuteNonQuery();
                    }

                    transaction.Commit();

                    result.IsAuthenticated = true;
                    result.Message = "Registration successful";
                    result.UserId = userId;
                    result.Username = username;
                    result.FirstName = firstName;
                    result.LastName = lastName;
                    result.RoleId = 1;
                    result.RoleName = "Student";

                    return result;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    result.IsAuthenticated = false;
                    result.Message = "Registration failed: " + ex.Message;
                    return result;
                }
            }
        }

        // Authenticate user (both student and admin)
        public UserInfo AuthenticateUser(string usernameOrEmail, string password)
        {
            UserInfo result = new UserInfo();
            string passwordHash = HashPassword(password);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"SELECT u.UserID, u.Username, u.FirstName, u.LastName, 
                                        u.RoleID, r.RoleName
                                 FROM tbUsers u
                                 JOIN tbRole r ON u.RoleID = r.RoleID
                                 WHERE (u.Username = @UsernameOrEmail OR u.Email = @UsernameOrEmail) 
                                   AND u.PasswordHash = @PasswordHash 
                                   AND u.IsActive = 1";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail);
                    command.Parameters.AddWithValue("@PasswordHash", passwordHash);
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            result.IsAuthenticated = true;
                            result.Message = "Login successful";
                            result.UserId = (int)reader["UserID"];
                            result.Username = reader["Username"].ToString();
                            result.FirstName = reader["FirstName"].ToString();
                            result.LastName = reader["LastName"].ToString();
                            result.RoleId = (int)reader["RoleID"];
                            result.RoleName = reader["RoleName"].ToString();

                            // Update last login time
                            UpdateLastLogin(result.UserId);
                        }
                        else
                        {
                            result.IsAuthenticated = false;
                            result.Message = "Invalid username/email or password";
                        }
                    }
                }
            }

            return result;
        }

        // Check if username is already taken
        public bool IsUsernameTaken(string username)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM tbUsers WHERE Username = @Username";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        // Check if email is already registered
        public bool IsEmailRegistered(string email)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM tbUsers WHERE Email = @Email";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        // Update last login time
        private void UpdateLastLogin(int userId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE tbUsers SET LastLogin = GETDATE() WHERE UserID = @UserID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        // Hash password using SHA256
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();

                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }
    }
}

