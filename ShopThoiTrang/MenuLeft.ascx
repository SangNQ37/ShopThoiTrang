<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuLeft.ascx.cs" Inherits="ShopThoiTrang.MenuLeft" %>
    <div class="left">
        <div class="tieudetrai">
            DANH MỤC SẢN PHẨM
        </div>
        <div class="danhmuc">
            <ul class="side-menu" data-side-menu="data-side-menu">
                <li class="slide-li-1">
                    <a href="#" class="slide-a-parent">VÁY ĐẦM VÀ SET BỘ</a>

                    <ul class="sub-slide-menu">
                        <li>
                            <%--  <a href="#">ĐẦM LIỀN</a>--%>
                            <asp:LinkButton ID="lbtndamlien" runat="server" OnClick="lbtndamlien_Click">ĐẦM LIỀN</asp:LinkButton>
                        </li>
                    </ul>
                </li>
                <li>
                    <asp:LinkButton ID="lbtnaokhoac" runat="server" OnClick="lbtnaokhoac_Click">ÁO KHOÁC</asp:LinkButton>
                    <%--<a href="#">ÁO KHOÁC</a>--%>			
                </li>
                <li>
                    <%--<a href="#">ĐẦM KHUYẾN MẠI</a>--%>
                    <asp:LinkButton ID="lbtndamkm" runat="server" OnClick="lbtndamkm_Click">ĐẦM KHUYẾN MẠI</asp:LinkButton>
                </li>
            </ul>

        </div>
    </div>
 
