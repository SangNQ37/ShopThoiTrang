<%@ Page Title="" Language="C#" MasterPageFile="~/ShopThoiTrang.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="ShopThoiTrang.DangNhap" %>

<%@ Register Src="~/MenuLeft.ascx" TagPrefix="uc1" TagName="MenuLeft" %>
<%@ Register Src="~/backtopWeb.ascx" TagPrefix="uc1" TagName="backtopWeb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="content" style="min-height:500px;">
        <uc1:backtopWeb runat="server" ID="backtopWeb" />
        <div class="container">
            <div class="col-md-3">
                <uc1:MenuLeft runat="server" ID="MenuLeft" />
            </div>
            <div class="col-md-9">
                <h2 class="tieudegiua" style="margin-top:35px;">
                    <span class="title-content">ĐĂNG NHẬP</span>
                </h2>
                <div class="clearfix"></div>
                <div class="LoginByFb" style=" margin-top:10px;">
                    
                <%--  <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" size="large" >
       
                            ĐĂNG NHẬP BẰNG FACEBOOK
                    
                    </fb:login-button>--%>
                   
                 </div>
                <div class="dangnhap">
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <b >Username</b>
                                </td>
                                <td>
                                    <%--<input name="username" type="text" class="login" id="username" />--%>
                                    <asp:TextBox ID="txtusername" class="login" runat="server" type="text"></asp:TextBox>
                                    <asp:Label ID="lblcheck" runat="server" Text="" style="color:red;" ></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <b >Password</b>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtpassword" class="login" type="password" runat="server"></asp:TextBox>
                                    <%--<input name="username" type="password" class="login" id="password" />--%>
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                    <div style="margin:30px 100px;">
                        <asp:Button ID="btndangnhap"  class="btn btn-success" runat="server" Text="Đăng nhập" OnClick="btndangnhap_Click" />
                         <%--<button type="button" class="btn btn-success">Đăng nhập</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
