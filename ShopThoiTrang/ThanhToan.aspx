<%@ Page Title="" Language="C#" MasterPageFile="~/ShopThoiTrang.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="ShopThoiTrang.ThanhToan" %>

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
                <div class="col-md-9" style="margin-top: 40px;">
                    <div>
                        <h2 class="tieudegiua">
                            <span class="title-content">THANH TOÁN</span>
                        </h2>
                    </div>
                    <div class="dataTable_wrapper" style="margin: 40px auto; width: 100%;">
                        <asp:GridView ID="grvsanpham" runat="server" AutoGenerateColumns="False" Width="100%" OnRowCommand="grvsanpham_RowCommand" CssClass="table table-striped table-bordered table-hover" OnRowDeleting="grvsanpham_RowDeleting">
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
                                    <HeaderStyle Height="45px" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gia", "{0:#,0.#} VNĐ") %>'></asp:Label>
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
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("TongGia", "{0:#,0.#} VNĐ") %>'></asp:Label>
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
                    <table class="table">
                        <tbody>
                            <tr style="color: #FFF; font-weight: bold; background-color: orange;">
                                <td>
                                    <asp:Label ID="lbltongtien" runat="server" Text="Tổng giá: 0 VNĐ" CssClass="tongtien"></asp:Label>
                                </td>
                            </tr>
                        </tbody>

                    </table>

                    <div class="dangki" style="margin-top: 100px;">
                        <form>
                            <table style="margin-top: 30px;">
                                <tbody>



                                    <tr>
                                        <td colspan="2"><b>Thông tin khách hàng</b></td>
                                    </tr>
                                    <tr>
                                        <td>Họ và tên</td>
                                        <td>
                                            <%--<select name="quan" id="quan">
                                         <option value> Chọn Quận Huyện</option>
                                          <option value="56">Quận Ba Đình</option>
                                      </select>--%>
                                            <asp:TextBox ID="txthovaten" type="text" class="textbox" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>



                                    <tr>
                                        <td>Email</td>
                                        <td>

                                            <asp:TextBox ID="txtemail" runat="server" class="textbox"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Điện thoại</td>
                                        <td>
                                            <asp:TextBox ID="txtdienthoai" runat="server" class="textbox"></asp:TextBox>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Tỉnh/Thành phố</td>
                                        <td>
                                            <asp:DropDownList ID="ddlthanhpho" runat="server">
                                                <asp:ListItem Value="0">Chọn tỉnh/thành phố</asp:ListItem>
                                                <asp:ListItem Value="1">Hà Nội</asp:ListItem>
                                            </asp:DropDownList>
                                            <%--  <asp:Button ID="btndangki" runat="server" Text="Đăng kí" class="btn btn-warning" OnClick="btndangki_Click" />
                        <asp:Button ID="btnhuy" runat="server" Text="Hủy"  class="btn btn-warning" OnClick="btnhuy_Click"/>--%>
                                            <%--<option value="">Chọn tỉnh/thành phố</option>
                                          <option value="6">Thành Phố Hồ Chí Minh</option>
											<option value="2">Hà Nội</option>
											<option value="10">Hải Phòng</option>
											<option value="11">Đà Nẵng</option>
											<option value="12">Hà Giang</option>
											<option value="13">Cao Bằng</option>
											<option value="14">Lai Châu</option>
											<option value="15">Lào Cai</option>
											<option value="16">Tuyên Quang</option>
											<option value="17">Lạng Sơn</option>
											<option value="18">Bắc Kạn</option>
											<option value="19">Thái Nguyên</option>
											<option value="20">Yên Bái</option>
											<option value="21">Sơn La</option>
											<option value="22">Phú Thọ</option>
											<option value="23">Vĩnh Phúc</option>
											<option value="24">Quảng Ninh</option>
											<option value="25">Bắc Giang</option>
											<option value="26">Bắc Ninh</option>
											<option value="27">Hải Dương</option>
											<option value="28">Hưng Yên</option>
											<option value="29">Hòa Bình</option>
											<option value="30">Hà Nam</option>
											<option value="31">Nam Định</option>
											<option value="32">Thái Bình</option>
											<option value="33">Ninh Bình</option>
											<option value="34">Thanh Hóa</option>
											<option value="35">Nghệ An</option>
											<option value="36">Hà Tỉnh</option>
											<option value="38">Quảng Trị</option>
											<option value="37">Quảng Bình</option>
											<option value="39">Thừa Thiên Huế</option>
											<option value="40">Quảng Nam</option>
											<option value="41">Quảng Ngãi</option>
											<option value="42">Kontum</option>
											<option value="43">Bình Định</option>
											<option value="44">Gia Lai</option>
											<option value="45">Phú Yên</option>
											<option value="46">Đăk Lăk</option>
											<option value="47">Khánh Hòa</option>
											<option value="48">Lâm Đồng</option>
											<option value="49">Bình Phước</option>
											<option value="50">Bình Dương</option>
											<option value="51">Ninh Thuận</option>
											<option value="52">Tây Ninh</option>
											<option value="53">Bình Thuận</option>
											<option value="54">Đồng Nai</option>
											<option value="55">Long An</option>
											<option value="56">Đồng Tháp</option>
											<option value="57">An Giang</option>
											<option value="58">Bà Rịa-Vũng Tàu</option>
											<option value="59">Tiền Giang</option>
											<option value="60">Kiên Giang</option>
											<option value="61">Cần Thơ</option>
											<option value="62">Bến Tre</option>
											<option value="63">Vĩnh Long</option>
											<option value="64">Trà Vinh</option>
											<option value="65">Sóc Trăng</option>
											<option value="66">Bạc Liêu</option>
											<option value="67">Cà Mau</option>
											<option value="68">Điện Biên</option>
											<option value="69">Đăk Nông</option>
											<option value="70">Hậu Giang</option>
                                      </select>--%>
                                        
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Quân/Huyện</td>
                                        <td>
                                            <asp:DropDownList ID="ddlquan" runat="server">
                                                <asp:ListItem Value="0">Chọn Quận Huyện</asp:ListItem>
                                                <asp:ListItem Value="1">Quận Ba Đình</asp:ListItem>
                                                <asp:ListItem Value="2">TP.Hồ Chí Minh</asp:ListItem>
                                            </asp:DropDownList>
                                            <%--<select name="quan" id="quan">
                                         <option value> Chọn Quận Huyện</option>
                                          <option value="56">Quận Ba Đình</option>
                                      </select>--%>
                                        
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Địa chỉ</td>
                                        <td>
                                            <asp:TextBox ID="txtdiachi" runat="server" class="textbox"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hình thức thanh toán</td>
                                        <td>
                                            <asp:DropDownList ID="ddlhinhthucthanhtoan" runat="server"></asp:DropDownList>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <div style="margin: 30px 0;">
                            <asp:Button ID="btnmuatiep" runat="server" Text="MUA TIẾP" class="btn btn-warning" OnClick="btnmuatiep_Click" />
                            <asp:Button ID="btndathang" runat="server" Text="HOÀN TẤT ĐẶT HÀNG" class="btn btn-warning" Style="margin-left: 30px;" OnClick="btndathang_Click" />
                        </div>

                    </div>
                </div>
            </div>
            &nbsp;
        </div>

    </div>
</asp:Content>
