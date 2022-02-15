<%@ Page Title="" Language="C#" MasterPageFile="~/ShopThoiTrang.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="ShopThoiTrang.SanPham" %>

<%@ Register Src="~/MenuLeft.ascx" TagPrefix="uc1" TagName="MenuLeft" %>
<%@ Register Src="~/backtopWeb.ascx" TagPrefix="uc1" TagName="backtopWeb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <%--  <script src="js/j-query.js"></script>--%>
    <div class="content">

        <uc1:backtopWeb runat="server" ID="backtopWeb" />
        <div class="container">
            <div class="col-md-3">
                <uc1:MenuLeft runat="server" ID="MenuLeft" />
            </div>
            <div class="col-md-9">
                <h2 class="tieudegiua" style="margin-top: 40px;">
                    <%--<span class="title-content">SẢN PHẨM</span>--%>
                    <asp:Label ID="lblsanpham" runat="server" Text="SẢN PHẨM" class="title-content"></asp:Label>
                </h2>
                <div style="margin:10px 70px;">
                    <asp:DataList ID="dtlsanpham" runat="server" RepeatColumns="2" OnItemCommand="dtlaokhoac_ItemCommand">
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <div class="item" style="margin: 10px;">
                                    <a href="#">
                                        <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />
                                        <div class="giamgia">
                                            <h3 style="font-size: 11px;">Giảm</h3>
                                            <h3 style="font-size: 16px;">10%</h3>
                                        </div>
                                    </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>
                                    <%--<a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>--%>
                                </h3>
                                    <p>
                                        <strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong>
                                        <span><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></span>
                                       <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server"  CommandArgument='<%# Eval("id") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                      
                </div>
            

                 
            </div>
        </div>
        <%--   <div class="container">
            <div class="col-xs-4">
                <div class="item">
                    <a href="#">
                        <img src="images/timthumb3.png" alt="SHOP THOI TRANG">
                        <div class="giamgia">
                            <h3 style="font-size: 11px;">Giảm</h3>
                            <h3 style="font-size: 16px;">10%</h3>
                        </div>
                    </a>
                    <h3 class="item_text">
                        <a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>
                    </h3>
                    <p>
                        <strong>297,000</strong>
                        <span>330,000</span>
                        <a href="#" class="discount"></a>
                    </p>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="item">
                    <a href="#">
                        <img src="images/timthumb3.png" alt="SHOP THOI TRANG">
                        <div class="giamgia">
                            <h3 style="font-size: 11px;">Giảm</h3>
                            <h3 style="font-size: 16px;">10%</h3>
                        </div>
                    </a>
                    <h3 class="item_text">
                        <a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>
                    </h3>
                    <p>
                        <strong>297,000</strong>
                        <span>330,000</span>
                        <a href="#" class="discount"></a>
                    </p>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="item">
                    <a href="#">
                        <img src="images/timthumb3.png" alt="SHOP THOI TRANG">
                        <div class="giamgia">
                            <h3 style="font-size: 11px;">Giảm</h3>
                            <h3 style="font-size: 16px;">10%</h3>
                        </div>
                    </a>
                    <h3 class="item_text">
                        <a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>
                    </h3>
                    <p>
                        <strong>297,000</strong>
                        <span>330,000</span>
                        <a href="#" class="discount"></a>
                    </p>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="item">
                    <a href="#">
                        <img src="images/timthumb3.png" alt="SHOP THOI TRANG">
                        <div class="giamgia">
                            <h3 style="font-size: 11px;">Giảm</h3>
                            <h3 style="font-size: 16px;">10%</h3>
                        </div>
                    </a>
                    <h3 class="item_text">
                        <a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>
                    </h3>
                    <p>
                        <strong>297,000</strong>
                        <span>330,000</span>
                        <a href="#" class="discount"></a>
                    </p>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="item">
                    <a href="#">
                        <img src="images/timthumb3.png" alt="SHOP THOI TRANG">
                        <div class="giamgia">
                            <h3 style="font-size: 11px;">Giảm</h3>
                            <h3 style="font-size: 16px;">10%</h3>
                        </div>
                    </a>
                    <h3 class="item_text">
                        <a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>
                    </h3>
                    <p>
                        <strong>297,000</strong>
                        <span>330,000</span>
                        <a href="#" class="discount"></a>
                    </p>
                </div>


            </div>
            <div class="col-xs-4">
                <div class="item">
                    <a href="#">
                        <img src="images/timthumb3.png" alt="SHOP THOI TRANG">
                        <div class="giamgia">
                            <h3 style="font-size: 11px;">Giảm</h3>
                            <h3 style="font-size: 16px;">10%</h3>
                        </div>
                    </a>
                    <h3 class="item_text">
                        <a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>
                    </h3>
                    <p>
                        <strong>297,000</strong>
                        <span>330,000</span>
                        <a href="#" class="discount"></a>
                    </p>
                </div>


            </div>
            <div class="col-xs-4">
                <div class="item">
                    <a href="#">
                        <img src="images/timthumb3.png" alt="SHOP THOI TRANG">
                        <div class="giamgia">
                            <h3 style="font-size: 11px;">Giảm</h3>
                            <h3 style="font-size: 16px;">10%</h3>
                        </div>
                    </a>
                    <h3 class="item_text">
                        <a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>
                    </h3>
                    <p>
                        <strong>297,000</strong>
                        <span>330,000</span>
                        <a href="#" class="discount"></a>
                    </p>
                </div>


            </div>
        </div>--%>
    </div>

</asp:Content>
