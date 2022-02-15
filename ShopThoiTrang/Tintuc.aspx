<%@ Page Title="" Language="C#" MasterPageFile="~/ShopThoiTrang.Master" AutoEventWireup="true" CodeBehind="Tintuc.aspx.cs" Inherits="ShopThoiTrang.Tintuc" %>

<%@ Register Src="~/MenuLeft.ascx" TagPrefix="uc1" TagName="MenuLeft" %>
<%@ Register Src="~/backtopWeb.ascx" TagPrefix="uc1" TagName="backtopWeb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="content">
        <uc1:backtopWeb runat="server" ID="backtopWeb" />
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <uc1:MenuLeft runat="server" ID="MenuLeft" />
                </div>
                <div class="col-md-9">
                    <div style="width: 100%;">
                        <div style="margin-top: 30px;">
                            <h2 class="tieudegiua">
                                <span class="title-content">TIN TỨC</span>
                            </h2>
                        </div>
                        <asp:Repeater ID="rptcontent" runat="server">
                            <ItemTemplate>
                                <div class="box-new" style="margin-top: 40px; height: 140px;">
                                    <div class="col-md-3" style="border: 1px solid #BBB;">
                                        <a href="ChiTietTinTuc.aspx?Id=<%# Eval("Id")%>">

                                            <img src="<%# Eval("urlHinhAnh")%>" style="height: 100%; width: 100%;" />
                                        </a>

                                    </div>
                                    <div class="col-md-9">
                                        <a href="ChiTietTinTuc.aspx?Id=<%# Eval("Id")%>">
                                            <h3 style="font-weight: bold;"><%# Eval("tieuDe") %></h3>

                                        </a>
                                        <p style="text-align: justify; padding-top: 27px; font-size: 13px; line-height: initial;">
                                            <%# Eval("tomtat") %>
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div style="display: block;text-align: center;margin-top:20px;">
                            <asp:Repeater ID="repeaterPaging" runat="server"
                                OnItemCommand="repeaterPaging_ItemCommand">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnPage" 
                                        CommandName="Page" CommandArgument="<%# Container.DataItem %>" style="height:10px;width:10px;    border: 1px solid rgb(213, 213, 213);    color: #000; padding: 5px 5px;"
                                        runat="server"  Font-Bold="True"> <%# Container.DataItem %>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>
</asp:Content>
