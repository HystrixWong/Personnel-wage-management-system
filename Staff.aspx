<%@ Page Title="员工管理" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Staff.aspx.cs" Inherits="Staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <div class="row">
        <div class="col-md-8">
        <div class="content">
          <div style="text-align:center;margin-top:50px;margin-bottom:30px"><asp:Label ID="Label1" runat="server"></asp:Label></div>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center"  >
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    </div>
    <div style="text-align:center">
         <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="staffinfo" runat="server" >
        <div style="text-align:center;margin-top:50px">
            <div class="form-group">

                <asp:Label ID="Label2" runat="server" Text="员工编号：" CssClass="col-md-5 control-label"></asp:Label>
                <asp:TextBox ID="no" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="员工姓名：" CssClass="col-md-5 control-label"></asp:Label>
                <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                 <asp:Label ID="Label4" runat="server" Text="部门编号：" CssClass="col-md-5 control-label"></asp:Label>
                <asp:TextBox ID="depart" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group"> 
                 <asp:Label ID="Label5" runat="server" Text="职务：" CssClass="col-md-5 control-label"></asp:Label>
                <asp:TextBox ID="duty" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label6" runat="server" Text="性别" CssClass="col-md-5 control-label"></asp:Label>
                <asp:TextBox ID="sex" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" Text="年龄：" CssClass="col-md-5 control-label"></asp:Label>
                <asp:TextBox ID="age" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group"> 
                <asp:Label ID="Label8" runat="server" Text="手机号码：" CssClass="col-md-5 control-label"></asp:Label>
                <asp:TextBox ID="tel" runat="server" CssClass="form-control"></asp:TextBox >
            </div>
            <div class="form-group"> 
                <asp:Label ID="Label9" runat="server" Text="身份证号：" CssClass="col-md-5 control-label"></asp:Label>
                <asp:TextBox ID="identify" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
           <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="添加" CssClass="btn btn-default"/>
            <asp:Button ID="btnModify" runat="server" OnClick="btnModify_Click" Text="修改" CssClass="btn btn-default"/>
            <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="删除" CssClass="btn btn-default"/>
 
        </div>
            
        </asp:View>
    </asp:MultiView>
    </div>
    </div>
        <div class="col-md-4">
            <section id="socialLoginForm">
               
            </section>
        </div>
   
    </div>
</asp:Content>

