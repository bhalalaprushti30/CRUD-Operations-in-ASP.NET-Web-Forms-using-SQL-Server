<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EX9.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD Operations with Populate and Validation</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .form-container {
            width: 50%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container input {
            margin: 0 10px;
            padding: 10px 20px;
        }
        .grid-container {
            margin-top: 20px;
        }
        tr:hover {
            background-color: #e0e0e0;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function populateFields(id, name, address, age, contact) {
            document.getElementById("<%= TextBox1.ClientID %>").value = id;
            document.getElementById("<%= TextBox2.ClientID %>").value = name;
            document.getElementById("<%= TextBox3.ClientID %>").value = address;
            document.getElementById("<%= TextBox4.ClientID %>").value = age;
            document.getElementById("<%= TextBox5.ClientID %>").value = contact;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <table>
                <tr>
                    <td>ID</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="ID is required!" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="Name is required!" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Age</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                            ControlToValidate="TextBox4" MinimumValue="1" MaximumValue="100" 
                            Type="Integer" ErrorMessage="Age must be between 1 and 100!" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegexValidator" runat="server" 
                            ControlToValidate="TextBox5" ValidationExpression="^\d{10}$" 
                            ErrorMessage="Invalid contact format! Enter 10 digits." ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Insert" />
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" />
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Delete" />
                    </td>
                </tr>
            </table>

            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    OnRowDataBound="GridView1_RowDataBound" HeaderStyle-BackColor="#000084" HeaderStyle-ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Age" HeaderText="Age" />
                        <asp:BoundField DataField="Contact" HeaderText="Contact" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
