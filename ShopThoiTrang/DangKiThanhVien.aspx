<%@ Page Title="" Language="C#" MasterPageFile="~/ShopThoiTrang.Master" AutoEventWireup="true" CodeBehind="DangKiThanhVien.aspx.cs" Inherits="ShopThoiTrang.DangKiThanhVien" %>

<%@ Register Src="~/MenuLeft.ascx" TagPrefix="uc1" TagName="MenuLeft" %>
<%@ Register Src="~/backtopWeb.ascx" TagPrefix="uc1" TagName="backtopWeb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
    <script src="https://apis.google.com/js/plus.js?onload=init"></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoadCallback"></script>
    <script src="js/script.js" type="text/javascript"></script>
    <script src="js/app.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function () {
            var p = document.createElement('script');
            p.type = 'text/javascript';
            p.async = true;
            p.src = 'https://apis.google.com/js/client.js?onload=onLoadFunction';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(p, s);
          
        })();
    </script>
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>



    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '1838823719729580',
                xfbml: true,
                version: 'v2.8'
            });
            FB.AppEvents.logPageView();
            //FB.getLoginStatus(function (response) {
            //    login(response);
            //});
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        function login() {
            FB.login(function (response) {
                if (response.status === 'connected') {
                    FB.api('/me', { fields: 'link' }, function (response) {
                        var t;

                        alert('bạn đã đăng nhập thành công');
                        t = response.link;

                        window.location.href = "/TrangChu.aspx?s=" + t;

                    });
                    //FB.api('/me', { fields: 'email' }, function (response) {
                    // var t;
                    //alert('bạn đã đăng nhập thành công' + response.email);
                    // '<%Session["TenDangNhap"] = "quantri"; %>';
                    //  t = response.email;

                    //  window.location.href = "/TrangChu.aspx?s=" + t;
                    //  });



                }
                else if (response.status === 'not_authorized') {

                }
                else {
                }
            });
        }
    </script>
    <div class="content" style="min-height: 500px;">
        <uc1:backtopWeb runat="server" ID="backtopWeb" />
        <div class="container">
            <div class="col-md-3">
                <uc1:MenuLeft runat="server" ID="MenuLeft" />
            </div>

            <div class="col-md-9">
                <h2 class="tieudegiua" style="margin-top: 35px;">
                    <span class="title-content">ĐĂNG KÍ THÀNH VIÊN</span>
                </h2>
                <div class="clearfix"></div>
                <div class="LoginByFb" style="margin-top: 10px;float:left">
                    <a onclick="login();">

                        <img src="images/fb_login.png" />
                    </a>
                </div>
                <div class="LoginByGoogle+" style="float:left;width: 202px;height: 49px;margin-top: 7px;margin-left: 14px;" >
                    <div ng-app="myApp" ng-controller="myController">
                        <a ng-click="onGoogleLogin()">
                            <img src="images/gp_login.png" style="cursor: pointer; width:233px"  />
                                                     
                        </a>
                    </div>

                  
                </div>
                <div class="clearfix"></div>
                <div class="dangki">
                    <form>
                        <table style="margin-top: 30px;">
                            <tbody>
                                <tr>
                                    <td colspan="2"><b>Thông tin tài khoản</b></td>
                                </tr>
                                <tr>
                                    <td>Tên đăng nhập</td>
                                    <td>
                                        <%--<input name="username" type="text" class="input" id="username" value/>--%>
                                        <asp:TextBox ID="txtusername" type="text" class="textbox" runat="server" OnTextChanged="txtusername_TextChanged" OnLoad="txtusername_Load"></asp:TextBox>
                                        <span class="userloading">
                                            <%--<img src="images/ajax-loader.gif" style="width:15px;"/>--%>
                                            <asp:Image ID="loader" runat="server" src="images/ajax-loader.gif" Style="width: 15px;" OnDataBinding="loader_DataBinding" OnDisposed="loader_Disposed" OnInit="loader_Init" OnLoad="loader_Load" OnPreRender="loader_PreRender" OnUnload="loader_Unload" />
                                        </span>
                                        <span class="usernameResult">
                                            <%--<span style="color:#f00;">Tài khoản phải từ 4 kí tự trở lên</span>--%>
                                            <asp:Label ID="lblcheck" runat="server" Text="Tài khoản phải từ 4 kí tự trở lên" Style="color: #f00;"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mật khẩu</td>
                                    <td>
                                        <%--<asp:ChangePassword ID="password" class="input" runat="server"></asp:ChangePassword>--%>
                                        <asp:TextBox ID="txtpassword" type="password" class="textbox" runat="server"></asp:TextBox>
                                        <%--<input name="username" type="text" class="input" id="Text1" value/>--%>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td>Gõ lại mật khẩu</td>
                                    <td>
                                        <asp:TextBox ID="txtrepressPassword" type="password" class="textbox" runat="server"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><b>Thông tin cá nhân</b></td>
                                </tr>
                                <tr>
                                    <td>Họ và tên</td>
                                    <td>
                                        <%--<input name="username" type="text" class="input" id="Text3" value/>--%>
                                        <asp:TextBox ID="txthovaten" type="text" class="textbox" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Giới tính</td>
                                    <td>

                                        <asp:RadioButton ID="rdobtnNam" value="1" Style="width: initial; height: initial; float: left;" runat="server" GroupName="sex" Checked="True" Text="Nam" />

                                        <asp:RadioButton ID="rdobtnNu" value="0" Style="width: initial; height: initial; float: left; margin-left: 10px;" runat="server" GroupName="sex" Text="Nữ" />

                                    </td>
                                </tr>
                                <tr>
                                    <td>Ngày sinh</td>
                                    <td>
                                        <%--<input type="date" name="ngaysinh" max="2100-12-31" min="1970-12-31" style="width: initial;height: initial;" />--%>
                                        <asp:TextBox ID="txtngaysinh" runat="server" TextMode="Date" OnTextChanged="txtngaysinh_TextChanged"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">Thông tin xác thực thanh toán</td>

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
                                        <%--<select name="thanhpho" id="thanhpho">--%>
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
                            </tbody>
                        </table>
                    </form>
                    <div style="margin: 30px 0;">
                        <asp:Button ID="btndangki" runat="server" Text="Đăng kí" class="btn btn-warning" OnClick="btndangki_Click" />
                        <asp:Button ID="btnhuy" runat="server" Text="Hủy" class="btn btn-warning" OnClick="btnhuy_Click" />

                    </div>

                </div>


            </div>
        </div>
    </div>

</asp:Content>
