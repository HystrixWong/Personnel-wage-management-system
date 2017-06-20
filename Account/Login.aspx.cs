using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using WebSite4;

public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
           
           
        }

        protected void LogIn(object sender, EventArgs e)
        {
           
            string strCnn = ConfigurationManager.ConnectionStrings["StaffManagerString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(strCnn);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cnn;
            //TextBox UserName = (TextBox)LoginUser.FindControl("UserName");//获取LoginUser中的控件
            //TextBox Password = (TextBox)LoginUser.FindControl("Password");
            string userName = UserName.Text.Trim();
            string password = Password.Text.Trim();
            //password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "md5");//md5加密
            cmd.CommandText = "select * from [User] where Id = @UserId and Password = @Password";

            SqlParameter userIdParam = new SqlParameter();
            userIdParam.ParameterName = "@UserId";
            userIdParam.SqlDbType = SqlDbType.Char;
            userIdParam.Size = 10;
            userIdParam.Direction = ParameterDirection.Input;
            userIdParam.Value = userName;
            cmd.Parameters.Add(userIdParam);

            SqlParameter passwordParam = new SqlParameter();
            passwordParam.ParameterName = "@Password";
            passwordParam.SqlDbType = SqlDbType.NChar;
            passwordParam.Size = 20;
            passwordParam.Direction = ParameterDirection.Input;
            passwordParam.Value = password;
            cmd.Parameters.Add(passwordParam);

            SqlDataReader UserReader = null;
            try
            {
                if (cnn.State == ConnectionState.Closed)
                    cnn.Open();
                UserReader = cmd.ExecuteReader();

                if (UserReader.Read())
                {
                        Session["Id"] = userName;
                        Session["Permission"] = UserReader["Permission"].ToString();
                        Response.Redirect("~/Default.aspx");  
                }
                else
                {
                    Session["Id"] =null;
                    Session["Permission"] = null;
                    FailureText.Text = "用户名或密码错误!";
                    ErrorMessage.Visible = true;
                }

            }
            catch (Exception ex)
            {
                Response.Write("用户登录失败，错误原因：" + ex.Message);
            }
            finally
            {
                if (UserReader.IsClosed == false)
                    UserReader.Close();
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
            }
           
            }
        
}