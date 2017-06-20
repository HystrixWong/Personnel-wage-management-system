using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Salary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //启动权限管理
        validate();
      

    }
    //判断用户是否有操作权限
    private void validate()
    {
        //首先判断当前用户是否有访问的权限
        if (Session["Permission"] == null || Session["Permission"].ToString()!="1")
        {
            Response.Write("<script language=javascript>alert('没有该权限！');window.location.href='/Account/Login.aspx';</script>");
        }

    }

   

    private void display()
    {
        //string strCnn = ConfigurationManager.ConnectionStrings["StaffManagerString"].ConnectionString;
        //string s = SqlDataSource3;
        SqlDataSource sql = SqlDataSource3;
        //创建连接对象
        using (SqlConnection cnn = new SqlConnection(sql.ToString()))
        {
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            string userName = EmployeeId.Text.Trim();
            SqlDataAdapter daSalary = new SqlDataAdapter("SELECT [Salary], [Basic], [Overtime], [Evection], [Absence], [Late], [Bonus], [Total] FROM [Salary] WHERE EmployeeId='" + userName + "'", cnn);
            DataSet dsSalary = new DataSet();
            try
            {

                daSalary.Fill(dsSalary, "Salary");
                /*
                dsStaff.Tables["Staff"].Columns[0].ColumnName = "员工编号";
                dsStaff.Tables["Staff"].Columns[1].ColumnName = "员工姓名";
                dsStaff.Tables["Staff"].Columns[2].ColumnName = "部门编号";
                dsStaff.Tables["Staff"].Columns[3].ColumnName = "职    务";
                dsStaff.Tables["Staff"].Columns[4].ColumnName = "性    别";
                dsStaff.Tables["Staff"].Columns[5].ColumnName = "年    龄";
                dsStaff.Tables["Staff"].Columns[6].ColumnName = "手机号码";
                dsStaff.Tables["Staff"].Columns[7].ColumnName = "身份证号";
                GridView1.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
                GridView1.RowStyle.HorizontalAlign = HorizontalAlign.Center;
                */
                GridViewSalary.DataSource = dsSalary.Tables["Salary"];
                GridViewSalary.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }


    private void modifyData()
    {
        string strCnn = ConfigurationManager.ConnectionStrings["StaffManagerString"].ConnectionString;
        
        //创建连接对象
        using (SqlConnection cnn = new SqlConnection(strCnn))
        {
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            string name = EmployeeId.Text.Trim();
            string sql = "Select * from Salary";
            SqlDataAdapter daSalary = new SqlDataAdapter(sql, cnn);
            SqlCommandBuilder sbSalary = new SqlCommandBuilder(daSalary);
            DataTable dtSalaryInfo = new DataTable();

            daSalary.Fill(dtSalaryInfo);
            dtSalaryInfo.PrimaryKey = new DataColumn[] { dtSalaryInfo.Columns["EmployeeId"] };
            DataRow row = dtSalaryInfo.Rows.Find(EmployeeId.Text.Trim());
            //如果存在相应的记录
            if (row != null)
            {
                
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                cmd.CommandText = "select * from Attendence,SalaryConfig where Attendence.EmployeeId= '" + name + "' ";
                SqlDataReader reader = null;
                
                try
                {
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        int bs = Convert.ToInt32(reader["BasicSalary"].ToString());
                        int os = Convert.ToInt32(reader["OvertimeStandard"].ToString());
                        int od = Convert.ToInt32(reader["OvertimeDays"].ToString());
                        int es = Convert.ToInt32(reader["EvectionStandard"].ToString());
                        int ed = Convert.ToInt32(reader["EvectionDays"].ToString());
                        int ass = Convert.ToInt32(reader["AbsenceStandard"].ToString());
                        int ad = Convert.ToInt32(reader["AbsenceDays"].ToString());
                        int ls = Convert.ToInt32(reader["LateStandard"].ToString());
                        int ld = Convert.ToInt32(reader["LateDays"].ToString());
                        int bss = Convert.ToInt32(reader["BonusStandard"].ToString());
                        //计算
                        row.BeginEdit();
                        row[3] = bs;
                        row[4] = os * od;
                        row[5] = es * ed;
                        row[6] = ass * ad;
                        row[7] = ls * ld;
                        row[8] = bss;
                        row[9] = bs + os * od + es * ed + ass * ad + ls * ld + bss;
                        row.EndEdit();
                        //提交更新
                        try
                        {
                            if (reader.IsClosed == false)
                            {
                                reader.Close();
                             }
                            daSalary.Update(dtSalaryInfo);
                            Label1.Text = "修改成功！";
                            Response.Write("<script language=javascript>alert('修改成功,请重新输入用户编号查看哦！');window.location.href='/Salary.aspx';</script>");
                            //GridViewSalary.DataSource = FillTable("select * from Salary");
                            //GridViewSalary.DataBind();
                        }
                        catch (Exception ex)
                        {
                            Label1.Text = "修改失败，" + ex.Message;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Label1.Text = "计算不成功" + ex.Message;
                }
            }
            else
            {
                Label1.Text = "该员工不存在!";
            }
        }
    }
 

    protected void btnRead_Click(object sender, EventArgs e)
    {
        if (EmployeeId.Text == "")
        {
            Response.Write("<script language=javascript>alert('你还没输入员工编号呢！');window.location.href='/Salary.aspx';</script>");
        }

    }
    protected void btnCal_Click(object sender, EventArgs e)
    {
        modifyData();

    }

}