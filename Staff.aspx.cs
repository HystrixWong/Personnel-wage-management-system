using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //为了安全起见，默认操作视图都不可见
        MultiView1.Visible = false;
        validate();



    }
    //进行访问验证
    private void validate()
    {
        //首先判断当前用户是否有访问的权限
        if (Session["Permission"] != null)
        {
            string pm = Session["Permission"].ToString();
            if (pm == "1")//如果有管理员权限
            {
                //显示CURD操作界面及按钮
                MultiView1.Visible = true;
                //显示GridView数据
                displayAllGridView();
            }
            else if (pm == "2")//如果是普通用户权限
            {
                //显示GridView数据
                displayUserGridView();
            }
            else
            {
                //如果未登录
                Response.Write("<script language=javascript>alert('没有该权限！');window.location.href='/Account/Login.aspx';</script>");
            }
        }
        else
        {
            Response.Write("<script language=javascript>alert('没有该权限！');window.location.href='/Account/Login.aspx';</script>");
        }
    }
    //只对管理员可见
    private void displayAllGridView()
    {
        string strCnn = ConfigurationManager.ConnectionStrings["StaffManagerString"].ConnectionString;
        //创建连接对象
        using (SqlConnection cnn = new SqlConnection(strCnn))
        {
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            SqlDataAdapter daStaff = new SqlDataAdapter("select * from Staff", cnn);
            DataSet dsStaff = new DataSet();
            try
            {
                daStaff.Fill(dsStaff, "Staff");
               // GridView1.Columns[0].HeaderText = "员工编号";
              
                //GridView1.HeaderRow.Cells[1].Text = "员工姓名";
                dsStaff.Tables["Staff"].Columns[0].ColumnName = "员工编号";
                dsStaff.Tables["Staff"].Columns[1].ColumnName = "员工姓名";
                dsStaff.Tables["Staff"].Columns[2].ColumnName = "部门编号";
                dsStaff.Tables["Staff"].Columns[3].ColumnName = "职    务";
                dsStaff.Tables["Staff"].Columns[4].ColumnName = "性    别";
                dsStaff.Tables["Staff"].Columns[5].ColumnName = "年    龄";
                dsStaff.Tables["Staff"].Columns[6].ColumnName = "手机号码";
                dsStaff.Tables["Staff"].Columns[7].ColumnName = "身份证号";
                GridView1.HeaderStyle.HorizontalAlign= HorizontalAlign.Center;
                GridView1.RowStyle.HorizontalAlign=HorizontalAlign.Center;

                GridView1.DataSource = dsStaff.Tables["Staff"];
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
    //只对用户可见
    private void displayUserGridView()
    {
        string strCnn = ConfigurationManager.ConnectionStrings["StaffManagerString"].ConnectionString;
        //创建连接对象
        using (SqlConnection cnn = new SqlConnection(strCnn))
        {
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            if (Session["Id"] == null)
            {
                Response.Write("<script language=javascript>alert('没有该权限！');window.location.href='/Account/Login.aspx';</script>");
            }
            string userName = Session["Id"].ToString();
            SqlDataAdapter daStaff = new SqlDataAdapter("select * from Staff where EmployeeId='" + userName + "'", cnn);
            DataSet dsStaff = new DataSet();
            try
            {
                daStaff.Fill(dsStaff, "Staff");
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
                GridView1.DataSource = dsStaff.Tables["Staff"];
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
    private DataTable FillTable(string sql)
    {
        string strCnn = ConfigurationManager.ConnectionStrings["StaffManagerString"].ConnectionString;
        //创建连接对象
        using (SqlConnection cnn = new SqlConnection(strCnn))
        {
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, cnn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
    private void addData()
    {
        string strCnn = ConfigurationManager.ConnectionStrings["StaffManagerString"].ConnectionString;
        //创建连接对象
        using (SqlConnection cnn = new SqlConnection(strCnn))
        {
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            SqlDataAdapter daStaff = new SqlDataAdapter("select * from Staff", cnn);
            SqlCommandBuilder sbStaff = new SqlCommandBuilder(daStaff);
            DataTable dtStaffInfo = new DataTable();
            daStaff.FillSchema(dtStaffInfo, SchemaType.Mapped);
            //添加新纪录
            DataRow dr = dtStaffInfo.NewRow();
            //给记录赋值
            dr[0] = no.Text.Trim();
            dr[1] = name.Text.Trim();
            dr[2] = depart.Text.Trim();
            dr[3] = duty.Text.Trim();
            dr[4] = sex.Text.Trim();
            dr[5] = age.Text.Trim();
            dr[6] = tel.Text.Trim();
            dr[7] = identify.Text.Trim();
            dtStaffInfo.Rows.Add(dr);
            //提交更新
            daStaff.Update(dtStaffInfo);
            Label1.Text = "添加成功！";
            //重新绑定数据并显示
            GridView1.Visible = true;
            GridView1.DataSource = FillTable("Select * from Staff");
            GridView1.DataBind();
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
            SqlDataAdapter daStaff = new SqlDataAdapter("select * from Staff", cnn);
            SqlCommandBuilder sbStaff = new SqlCommandBuilder(daStaff);
            DataTable dtStaffInfo = new DataTable();
            daStaff.Fill(dtStaffInfo);
            dtStaffInfo.PrimaryKey = new DataColumn[] { dtStaffInfo.Columns["EmployeeId"] };
            DataRow row = dtStaffInfo.Rows.Find(no.Text.Trim());
            //如果存在相应的记录
            if (row != null)
            {
                row.BeginEdit();
                row[1] = name.Text.Trim();
                row[2] = depart.Text.Trim();
                row[3] = duty.Text.Trim();
                row[4] = sex.Text.Trim();
                row[5] = age.Text.Trim();
                row[6] = tel.Text.Trim();
                row[7] = identify.Text.Trim();
                row.EndEdit();
                //提交更新
                try
                {
                    daStaff.Update(dtStaffInfo);
                    Label1.Text = "修改成功！";
                    //重新绑定
                    GridView1.DataSource = FillTable("Select * from Staff");
                    GridView1.DataBind();
                }
                catch(Exception ex)
                {
                    Label1.Text ="所添加的外键并不存在，"+ex.Message;
                }
            }
            else
            {
                Label1.Text="该员工不存在!";
            }
            
        }
    }
    private void deleteData()
    {
        string strCnn = ConfigurationManager.ConnectionStrings["StaffManagerString"].ConnectionString;
        //创建连接对象
        using (SqlConnection cnn = new SqlConnection(strCnn))
        {
            if (cnn.State == ConnectionState.Closed)
                cnn.Open();
            SqlDataAdapter daStaff = new SqlDataAdapter("select * from Staff", cnn);
            daStaff.DeleteCommand = new SqlCommand("delete from Staff where EmployeeId=@no", cnn);
            daStaff.DeleteCommand.Parameters.Add("@no", SqlDbType.Char, 10, "EmployeeId");
           DataTable dtStaffInfo = new DataTable();
            daStaff.Fill(dtStaffInfo);
            dtStaffInfo.PrimaryKey = new DataColumn[] { dtStaffInfo.Columns["EmployeeId"] };
            DataRow row = dtStaffInfo.Rows.Find(no.Text.Trim());
            //如果存在相应的记录
            if (row != null)
            {
                try
                {
                    //删除行记录
                    row.Delete();
                    daStaff.Update(dtStaffInfo);
                    Label1.Text = "删除成功！";
                    //重新绑定
                    GridView1.DataSource = FillTable("Select * from Staff");
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Label1.Text = "无法删除，" + ex.Message;
                }
            }
            else
            {
                Label1.Text = "该员工不存在!";
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        addData();

    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        modifyData();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        deleteData();
    }




}