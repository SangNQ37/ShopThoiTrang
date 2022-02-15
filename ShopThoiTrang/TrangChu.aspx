<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/ShopThoiTrang.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="ShopThoiTrang.TrangChu" %>

<%@ Register Src="~/MenuLeft.ascx" TagPrefix="uc1" TagName="MenuLeft" %>
<%@ Register Src="~/backtopWeb.ascx" TagPrefix="uc1" TagName="backtopWeb" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 262px;
            height: 320px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="content">
        <uc1:backtopWeb runat="server" ID="backtopWeb" />
        <div class="wap_slider">
            <div class="container">
                <div class="col-md-3">
                    <uc1:MenuLeft runat="server" ID="MenuLeft" />
                </div>
                <div class="col-sm-9">

                    <div class="slideshow">
                        <section class="regular slider">
                             <asp:Repeater ID="rptQuangCao" runat="server" OnItemCommand="rptQuangCao_ItemCommand">
                                <ItemTemplate>
                                    <div>
                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Bind("urlImage")%>' OnClick="ImageButton2_Click" CommandArgument='<%# Bind("id")%>'></asp:ImageButton>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

<%--                            <div>
                                <img src="images/banner-thu-dong-2016_web3197_905x345.jpg">
                            </div>
                            <div>
                                <img src="images/dam-tay-xe_-cover-web3220_905x345.jpg">
                            </div>
                            <div>
                                <img src="images/untitled_web9889_905x345.jpg">
                            </div>--%>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix">
        </div>
        <div class="main">
            <div class="container">
                <h2 class="tieudegiua">
                    <span class="title-content">ÁO KHOÁC</span>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="container">
                <div style="margin-left: 60px;">
                    <asp:DataList ID="dtlaokhoac" runat="server" RepeatColumns="3" OnItemCommand="dtlaokhoac_ItemCommand">
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
                                    <%--<asp:HyperLink ID="hpltensp" runat="server" Text='<%# Bind("TenHang") %>'></asp:HyperLink>--%>
                                    <%--<a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>--%>
                                </h3>
                                    <p>
                                        <strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong>
                                        <span><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></span>
                                        <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="container">

                <div class="col-md-10">
                </div>
                <div class="col-md-2">
                    <asp:LinkButton ID="lbtnMuatiep" runat="server" class="btn btn-info" OnClick="lbtnMuatiep_Click">CHI TIẾT</asp:LinkButton>
                </div>
            </div>


            <div class="container">
                <h2 class="tieudegiua">
                    <span class="title-content">VÁY ĐẦM VÀ SET BỘ</span>
                </h2>

                <div class="clearfix"></div>
            </div>
            <div class="container">
                <div style="margin-left: 60px;">
                    <asp:DataList ID="dtlvaydamvasetbo" runat="server" RepeatColumns="3" OnItemCommand="dtlvaydamvasetbo_ItemCommand" OnSelectedIndexChanged="dtlvaydamvasetbo_SelectedIndexChanged">
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <div class="item" style="margin: 10px;">
                                    <a href="#">

                                        <asp:ImageButton ID="ImageButton1" Style="width: 100%" ImageUrl='<%# Bind("image")%>' runat="server" CommandName="myCommand" />
                                        <%--<asp:Image ID="Image1" runat="server" imageurl='<%# Bind("image")%>' />--%>
                                        <div class="giamgia">
                                            <h3 style="font-size: 11px;">Giảm</h3>
                                            <h3 style="font-size: 16px;">10%</h3>
                                            <%--<h3 style="font-size: 16px;"><%# Eval("GiaTri") %></h3>--%>
                                        </div>
                                    </a>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h3 class="item_text">
                                    <asp:HyperLink ID="hpltensp" runat="server" Text='<%# Eval("TenHang").ToString().Length<=26?Eval("TenHang"):Eval("TenHang").ToString().Substring(0,26)+"..." %>' Style="display: block; width: 100%; text-align: center;"></asp:HyperLink>
                                    <%--<asp:HyperLink ID="hpltensp" runat="server" Text='<%# Bind("TenHang") %>'></asp:HyperLink>--%>
                                    <%--<a href="#">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</a>--%>
                                </h3>
                                    <p>
                                        <strong><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaMoi").ToString()))  %></strong>
                                        <span><%# String.Format("{0:0,00}", int.Parse(DataBinder.Eval(Container.DataItem, "giaCu").ToString()))  %></span>
                                        <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <%--    <asp:Literal ID="ltrVAYDAM" runat="server"></asp:Literal>--%>
                <div class="clearfix"></div>
            </div>
            <div class="container">

                <div class="col-md-10">
                </div>
                <div class="col-md-2">
                    <asp:LinkButton ID="lbtnchitietvdsb" runat="server" class="btn btn-info" OnClick="lbtnchitietvdsb_Click">CHI TIẾT</asp:LinkButton>
                </div>
            </div>

            <!-- end -->
            <div class="container">
                <h2 class="tieudegiua">
                    <span class="title-content">ĐẦM KHUYẾN MẠI</span>
                </h2>

            </div>
            <div class="clearfix"></div>
            <div class="container">
                <div style="margin-left: 60px;">
                    <asp:DataList ID="dtldamkhuyenmai" runat="server" RepeatColumns="3" OnItemCommand="dtldamkhuyenmai_ItemCommand">
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
                                        <asp:LinkButton ID="LinkButton1" class="discount" CommandName="myCommand" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:DataList>
                </div>

            </div>
            <div class="container">

                <div class="col-md-10">
                </div>
                <div class="col-md-2">
                    <asp:LinkButton ID="lbtndamkm" runat="server" class="btn btn-info" OnClick="lbtndamkm_Click">CHI TIẾT</asp:LinkButton>
                </div>
            </div>
            <!--End content -->
            <!--Footer-->

            <!--End Footer-->

        </div>
    </div>
    <div class="clearfix"></div>
</asp:Content>
