<%@ Page Title="" Language="C#" MasterPageFile="~/ShopThoiTrang.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="ShopThoiTrang.GioHang" %>

<%@ Register Src="~/MenuLeft.ascx" TagPrefix="uc1" TagName="MenuLeft" %>
<%@ Register Src="~/backtopWeb.ascx" TagPrefix="uc1" TagName="backtopWeb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script src="js/j-query.js"></script>
    <div class="content" style="min-height: 400px;">
        <uc1:backtopWeb runat="server" ID="backtopWeb" />
        <div class="container">
            <div class="col-md-3">
                <uc1:MenuLeft runat="server" ID="MenuLeft" />
            </div>
            <div class="col-md-9" style="margin-top: 40px;">
                <div>
                    <h2 class="tieudegiua">
                        <span class="title-content">GIỎ HÀNG</span>
                    </h2>
                </div>
                <%--   <table class="table giohang">
                    <thead>
                        <tr style="background-color:orange;">
                            <th style="width:7%; color:#FFF;font-weight:bold;">STT</th>
                            <th style="width:30%;color:#FFF;font-weight:bold;">Tên
                            </th>
                            <th style="width:5%;color:#FFF;font-weight:bold;">Size</th>
                            <th style="color:#FFF;font-weight:bold;">Hình ảnh</th>
                            <th style="color:#FFF;font-weight:bold;">Giá</th>
                            <th style="color:#FFF;font-weight:bold;">Số lượng</th>
                             <th style="color:#FFF;font-weight:bold;">Tổng giá</th>
                             <th style="color:#FFF;font-weight:bold;">Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="padding-top: 20px; ">1</td>
                             <td style="padding-top: 20px;">DL372 ĐẦM DẠ GHI-LÊ (2 TÚI THẬT)</td>
                              <td style="padding-top: 20px;">L</td>
                            <td style="padding-top: 3px;"><img src="images/timthumb.png" style=" width:50px; height:70px;"/></td>
                              <td style="padding-top: 20px;">297,000 &nbsp; VNĐ</td>
                                <td ><input type="text" value="1" maxlength="5"size="2" style="text-align:center;border:1px solid #F0F0F0;margin-top: 20px; width:50%;"/>&nbsp;</td>
                             <td style="padding-top: 20px;">297.000 VNĐ</td>
                             <td style="padding-top: 20px;">
                                <a href="#">
                                    <img src="images/delete.png" />
                                </a>
                            </td>
                       </tr>
                    </tbody>
                </table>--%>
                <div style="margin-top: 40px;" class="dataTable_wrapper">
                    <asp:GridView ID="grvsanpham" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" Width="100%" OnRowCommand="grvsanpham_RowCommand" OnRowDeleting="grvsanpham_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                                <%--<EditItemTemplate>
                                      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                  </EditItemTemplate>--%>
                                <ItemTemplate>
                                    <%--<asp:Label ID="Label1" runat="server"></asp:Label>--%>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Tên sản phẩm" DataField="TenSP">
                                <HeaderStyle Height="45px" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Size" HeaderText="Size">
                                <ControlStyle Height="10px" Width="20px" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Đơn Giá">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Gia") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gia", "{0:#,0.#} VNĐ")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="UrlImage" HeaderText="Hình ảnh">

                                <ControlStyle Height="70px" Width="50px" />

                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />

                            </asp:ImageField>
                            <asp:TemplateField HeaderText="Thành Tiên">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TongGia") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TongGia", "{0:#,0.#} VNĐ")  %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete">
                                          <img src="images/delete.png" alt="" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div style="margin-bottom:10px;">
                    <asp:Label ID="lblgiohang" runat="server" Text="" style="text-align: center;width: 100%;display: block;"></asp:Label>
                </div>
                <table class="table" >
                    <tbody>
                        <tr style="color: #FFF; font-weight: bold; background-color: orange;">
                            <td>
                                <asp:Label ID="lbltongtien" runat="server" Text="Tổng giá: 0 VNĐ" CssClass="tongtien"></asp:Label>
                            </td>
                        </tr>
                    </tbody>

                </table>
                <div class="dathang">
                    <div class="col-md-4">
                        <input type="text" class="form-control" id="pwd" placeholder="Mã giảm giá">
                    </div>
                    <div class="col-md-2">
                    </div>
                    <div style="float: right;" class="col-md-6">
                        <asp:LinkButton ID="lbtnMuatiep" runat="server" class="btn btn-info" OnClick="lbtnMuatiep_Click">MUA TIẾP</asp:LinkButton>
                        <asp:LinkButton ID="lbtnXoaALL" runat="server" class="btn btn-info" OnClick="lbtnXoaALL_Click">XÓA TẤT CẢ</asp:LinkButton>
                        <asp:LinkButton ID="lbtnDatHang" runat="server" class="btn btn-info" OnClick="lbtnDatHang_Click">ĐẶT HÀNG</asp:LinkButton>

                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
