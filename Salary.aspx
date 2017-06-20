<%@ Page Title="工资管理" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Salary.aspx.cs" Inherits="Salary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="text-align:center">
        <div class="form-group">
            <h4 style="margin-top:50px">要读取所有表的配置，请输入员工编号，只有先读取数据才能进行其他操作</h4>
            <br />
            <p style="margin-top:15px"><asp:Label ID="Label1" runat="server"  ></asp:Label></p>
            <br />
            <p style="margin-top:15px"><asp:Label ID="Label2" runat="server" Text="员工编号：" CssClass="col-md-2 control-label"></asp:Label></p>
            <asp:TextBox ID="EmployeeId" runat="server" CssClass="form-control col-md-6"  ></asp:TextBox>
        <div class="row" style="margin-top:20px">
             <div class="col-md-3"><asp:Button ID="btnRead" runat="server" OnClick="btnRead_Click" Text="读取" CssClass="btn btn-default" /></div>
            <div style="margin-left:30px"><asp:Button ID="btnCal" runat="server" OnClick="btnCal_Click" Text="更新" CssClass="btn btn-default" /></div>
        </div>    
     </div>

    <div >
        <asp:GridView ID="GridViewSalaryConfig" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Duty" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:BoundField DataField="Duty" HeaderText="职务" ReadOnly="True" SortExpression="Duty" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="BasicSalary" HeaderText="基本工资" SortExpression="BasicSalary" />
                <asp:BoundField DataField="OvertimeStandard" HeaderText="加班标准" SortExpression="OvertimeStandard" />
                <asp:BoundField DataField="EvectionStandard" HeaderText="出差标准" SortExpression="EvectionStandard" />
                <asp:BoundField DataField="AbsenceStandard" HeaderText="旷工标准" SortExpression="AbsenceStandard" />
                <asp:BoundField DataField="LateStandard" HeaderText="迟到标准" SortExpression="LateStandard" />
                <asp:BoundField DataField="BonusStandard" HeaderText="基本奖金" SortExpression="BonusStandard" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
     </div>

    <div style="margin-top:50px;">
        <asp:GridView ID="GridViewAttendence" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CheckId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None"  Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CheckId" HeaderText="考勤编号" ReadOnly="True" SortExpression="CheckId" />
                <asp:BoundField DataField="EmployeeId" HeaderText="员工编号" SortExpression="EmployeeId" />
                <asp:BoundField DataField="DepartmentId" HeaderText="部门编号" SortExpression="DepartmentId" />
                <asp:BoundField DataField="EmployeeName" HeaderText="员工姓名" SortExpression="EmployeeName" />
                <asp:BoundField DataField="OvertimeDays" HeaderText="加班天数" SortExpression="OvertimeDays" />
                <asp:BoundField DataField="EvectionDays" HeaderText="出差天数" SortExpression="EvectionDays" />
                <asp:BoundField DataField="AbsenceDays" HeaderText="旷工天数" SortExpression="AbsenceDays" />
                <asp:BoundField DataField="LateDays" HeaderText="迟到天数" SortExpression="LateDays" />
                <asp:BoundField DataField="CheckData" HeaderText="考勤日期" SortExpression="CheckData" />
            </Columns>
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
    <div style="margin-top:50px;width:60%">
        <asp:GridView ID="GridViewSalary" runat="server" AutoGenerateColumns="False" DataKeyNames="Salary" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Salary" HeaderText="工资编号" ReadOnly="True" SortExpression="Salary" />
                <asp:BoundField DataField="Basic" HeaderText="基本工资" SortExpression="Basic" />
                <asp:BoundField DataField="Overtime" HeaderText="加班工资" SortExpression="Overtime" />
                <asp:BoundField DataField="Evection" HeaderText="出差补贴" SortExpression="Evection" />
                <asp:BoundField DataField="Absence" HeaderText="旷工处罚" SortExpression="Absence" />
                <asp:BoundField DataField="Late" HeaderText="迟到处罚" SortExpression="Late" />
                <asp:BoundField DataField="Bonus" HeaderText="奖金" SortExpression="Bonus" />
                <asp:BoundField DataField="Total" HeaderText="总计" SortExpression="Total" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>
    </div>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:StaffManagerString %>" DeleteCommand="DELETE FROM [Attendence] WHERE [CheckId] = @original_CheckId AND [EmployeeId] = @original_EmployeeId AND [DepartmentId] = @original_DepartmentId AND [EmployeeName] = @original_EmployeeName AND (([OvertimeDays] = @original_OvertimeDays) OR ([OvertimeDays] IS NULL AND @original_OvertimeDays IS NULL)) AND (([EvectionDays] = @original_EvectionDays) OR ([EvectionDays] IS NULL AND @original_EvectionDays IS NULL)) AND (([AbsenceDays] = @original_AbsenceDays) OR ([AbsenceDays] IS NULL AND @original_AbsenceDays IS NULL)) AND (([LateDays] = @original_LateDays) OR ([LateDays] IS NULL AND @original_LateDays IS NULL)) AND (([CheckData] = @original_CheckData) OR ([CheckData] IS NULL AND @original_CheckData IS NULL))" InsertCommand="INSERT INTO [Attendence] ([CheckId], [EmployeeId], [DepartmentId], [EmployeeName], [OvertimeDays], [EvectionDays], [AbsenceDays], [LateDays], [CheckData]) VALUES (@CheckId, @EmployeeId, @DepartmentId, @EmployeeName, @OvertimeDays, @EvectionDays, @AbsenceDays, @LateDays, @CheckData)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Attendence] WHERE ([EmployeeId] = @EmployeeId)" UpdateCommand="UPDATE [Attendence] SET [EmployeeId] = @EmployeeId, [DepartmentId] = @DepartmentId, [EmployeeName] = @EmployeeName, [OvertimeDays] = @OvertimeDays, [EvectionDays] = @EvectionDays, [AbsenceDays] = @AbsenceDays, [LateDays] = @LateDays, [CheckData] = @CheckData WHERE [CheckId] = @original_CheckId AND [EmployeeId] = @original_EmployeeId AND [DepartmentId] = @original_DepartmentId AND [EmployeeName] = @original_EmployeeName AND (([OvertimeDays] = @original_OvertimeDays) OR ([OvertimeDays] IS NULL AND @original_OvertimeDays IS NULL)) AND (([EvectionDays] = @original_EvectionDays) OR ([EvectionDays] IS NULL AND @original_EvectionDays IS NULL)) AND (([AbsenceDays] = @original_AbsenceDays) OR ([AbsenceDays] IS NULL AND @original_AbsenceDays IS NULL)) AND (([LateDays] = @original_LateDays) OR ([LateDays] IS NULL AND @original_LateDays IS NULL)) AND (([CheckData] = @original_CheckData) OR ([CheckData] IS NULL AND @original_CheckData IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CheckId" Type="String" />
            <asp:Parameter Name="original_EmployeeId" Type="String" />
            <asp:Parameter Name="original_DepartmentId" Type="String" />
            <asp:Parameter Name="original_EmployeeName" Type="String" />
            <asp:Parameter Name="original_OvertimeDays" Type="Int32" />
            <asp:Parameter Name="original_EvectionDays" Type="Int32" />
            <asp:Parameter Name="original_AbsenceDays" Type="Int32" />
            <asp:Parameter Name="original_LateDays" Type="Int32" />
            <asp:Parameter Name="original_CheckData" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CheckId" Type="String" />
            <asp:Parameter Name="EmployeeId" Type="String" />
            <asp:Parameter Name="DepartmentId" Type="String" />
            <asp:Parameter Name="EmployeeName" Type="String" />
            <asp:Parameter Name="OvertimeDays" Type="Int32" />
            <asp:Parameter Name="EvectionDays" Type="Int32" />
            <asp:Parameter Name="AbsenceDays" Type="Int32" />
            <asp:Parameter Name="LateDays" Type="Int32" />
            <asp:Parameter Name="CheckData" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="EmployeeId" Name="EmployeeId" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeId" Type="String" />
            <asp:Parameter Name="DepartmentId" Type="String" />
            <asp:Parameter Name="EmployeeName" Type="String" />
            <asp:Parameter Name="OvertimeDays" Type="Int32" />
            <asp:Parameter Name="EvectionDays" Type="Int32" />
            <asp:Parameter Name="AbsenceDays" Type="Int32" />
            <asp:Parameter Name="LateDays" Type="Int32" />
            <asp:Parameter Name="CheckData" Type="DateTime" />
            <asp:Parameter Name="original_CheckId" Type="String" />
            <asp:Parameter Name="original_EmployeeId" Type="String" />
            <asp:Parameter Name="original_DepartmentId" Type="String" />
            <asp:Parameter Name="original_EmployeeName" Type="String" />
            <asp:Parameter Name="original_OvertimeDays" Type="Int32" />
            <asp:Parameter Name="original_EvectionDays" Type="Int32" />
            <asp:Parameter Name="original_AbsenceDays" Type="Int32" />
            <asp:Parameter Name="original_LateDays" Type="Int32" />
            <asp:Parameter Name="original_CheckData" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:StaffManagerString %>" DeleteCommand="DELETE FROM [SalaryConfig] WHERE [Duty] = @original_Duty AND [BasicSalary] = @original_BasicSalary AND (([OvertimeStandard] = @original_OvertimeStandard) OR ([OvertimeStandard] IS NULL AND @original_OvertimeStandard IS NULL)) AND (([EvectionStandard] = @original_EvectionStandard) OR ([EvectionStandard] IS NULL AND @original_EvectionStandard IS NULL)) AND (([AbsenceStandard] = @original_AbsenceStandard) OR ([AbsenceStandard] IS NULL AND @original_AbsenceStandard IS NULL)) AND (([LateStandard] = @original_LateStandard) OR ([LateStandard] IS NULL AND @original_LateStandard IS NULL)) AND (([BonusStandard] = @original_BonusStandard) OR ([BonusStandard] IS NULL AND @original_BonusStandard IS NULL))" InsertCommand="INSERT INTO [SalaryConfig] ([Duty], [BasicSalary], [OvertimeStandard], [EvectionStandard], [AbsenceStandard], [LateStandard], [BonusStandard]) VALUES (@Duty, @BasicSalary, @OvertimeStandard, @EvectionStandard, @AbsenceStandard, @LateStandard, @BonusStandard)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SalaryConfig]" UpdateCommand="UPDATE [SalaryConfig] SET [BasicSalary] = @BasicSalary, [OvertimeStandard] = @OvertimeStandard, [EvectionStandard] = @EvectionStandard, [AbsenceStandard] = @AbsenceStandard, [LateStandard] = @LateStandard, [BonusStandard] = @BonusStandard WHERE [Duty] = @original_Duty AND [BasicSalary] = @original_BasicSalary AND (([OvertimeStandard] = @original_OvertimeStandard) OR ([OvertimeStandard] IS NULL AND @original_OvertimeStandard IS NULL)) AND (([EvectionStandard] = @original_EvectionStandard) OR ([EvectionStandard] IS NULL AND @original_EvectionStandard IS NULL)) AND (([AbsenceStandard] = @original_AbsenceStandard) OR ([AbsenceStandard] IS NULL AND @original_AbsenceStandard IS NULL)) AND (([LateStandard] = @original_LateStandard) OR ([LateStandard] IS NULL AND @original_LateStandard IS NULL)) AND (([BonusStandard] = @original_BonusStandard) OR ([BonusStandard] IS NULL AND @original_BonusStandard IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Duty" Type="String" />
            <asp:Parameter Name="original_BasicSalary" Type="Int32" />
            <asp:Parameter Name="original_OvertimeStandard" Type="Int32" />
            <asp:Parameter Name="original_EvectionStandard" Type="Int32" />
            <asp:Parameter Name="original_AbsenceStandard" Type="Int32" />
            <asp:Parameter Name="original_LateStandard" Type="Int32" />
            <asp:Parameter Name="original_BonusStandard" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Duty" Type="String" />
            <asp:Parameter Name="BasicSalary" Type="Int32" />
            <asp:Parameter Name="OvertimeStandard" Type="Int32" />
            <asp:Parameter Name="EvectionStandard" Type="Int32" />
            <asp:Parameter Name="AbsenceStandard" Type="Int32" />
            <asp:Parameter Name="LateStandard" Type="Int32" />
            <asp:Parameter Name="BonusStandard" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BasicSalary" Type="Int32" />
            <asp:Parameter Name="OvertimeStandard" Type="Int32" />
            <asp:Parameter Name="EvectionStandard" Type="Int32" />
            <asp:Parameter Name="AbsenceStandard" Type="Int32" />
            <asp:Parameter Name="LateStandard" Type="Int32" />
            <asp:Parameter Name="BonusStandard" Type="Int32" />
            <asp:Parameter Name="original_Duty" Type="String" />
            <asp:Parameter Name="original_BasicSalary" Type="Int32" />
            <asp:Parameter Name="original_OvertimeStandard" Type="Int32" />
            <asp:Parameter Name="original_EvectionStandard" Type="Int32" />
            <asp:Parameter Name="original_AbsenceStandard" Type="Int32" />
            <asp:Parameter Name="original_LateStandard" Type="Int32" />
            <asp:Parameter Name="original_BonusStandard" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:StaffManagerString %>" SelectCommand="SELECT [Salary], [Basic], [Overtime], [Evection], [Absence], [Late], [Bonus], [Total] FROM [Salary] WHERE ([EmployeeId] = @EmployeeId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="EmployeeId" Name="EmployeeId" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

