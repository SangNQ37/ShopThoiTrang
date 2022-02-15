﻿<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ShopThoiTrang.Admin.Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" language="javascript">
        function CheckAllEmp(Checkbox) {
            var GridVwHeaderChckbox = document.getElementById("<%=grvMenu.ClientID%>");
            for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
                GridVwHeaderChckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;

            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnData" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Quản lý Menu</h1>
            </div>
        </div>
        <div>
            <div class="form-group input-group">
                <span class="input-group-addon">Type</span>
                <asp:DropDownList ID="cmbType_Home" CssClass="form-control" runat="server" OnSelectedIndexChanged="cmbType_Home_SelectedIndexChanged" AutoPostBack="true">

                    <asp:ListItem Value="0"> 0 - Trang chủ</asp:ListItem>
                    <asp:ListItem Value="1"> 1 - Trang quản trị</asp:ListItem>

                </asp:DropDownList>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="height: 28px;">
                    <asp:LinkButton ID="btnRefresh_Top" runat="server" OnCommand="btnRefresh_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-primary btn-circle">
                                <i class="fa fa-refresh"></i>
                            </button>
                            <span>Làm mới</span>
                             <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnAdd_Top" runat="server" OnClick="btnAdd_Top_Click" OnCommand="btnAdd_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-success btn-circle">
                                <i class="fa fa-plus"></i>
                            </button>
                            <span>Thêm</span>
                             <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" href="javascript:void(0);" OnClientClick="window.history.go(-1);">
                        <div style="float:left;margin-right:10px">
                            <button type="button" class="btn btn-success btn-circle">
                                <i class="fa fa-mail-reply"></i>
                            </button>
                            <span>Trở lại</span>
                              <img src="Images/split.png" style="margin-left:10px;"/>
                        </div>   
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="javascript:return confirm('Bạn chắc chắn muốn xóa?');" OnCommand="btnDelete_Command">
                        <div style="float:left;">
                            <button type="button" class="btn btn-danger btn-circle"><i class="fa fa-times"></i>
                             </button>
                             <span>Xóa</span>
                        </div>
                    </asp:LinkButton>
                </div>
            </div>
            <!-- /.panel-heading-->
            <div class="panel-body">
                <div class="dataTable_wrapper">
                    <asp:GridView ID="grvMenu" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CssClass="table table-striped table-bordered table-hover" OnRowDataBound="grvMenu_RowDataBound" OnSelectedIndexChanged="grvMenu_SelectedIndexChanged">
                        <HeaderStyle CssClass="dgvheader" />
                        <RowStyle CssClass="gradeA" />
                        <Columns>

                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="ckAll" runat="server" onclick="CheckAllEmp(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CkDelete" runat="server" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' />
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField AccessibleHeaderText="ID" DataField="ID" HeaderText="ID" />
                            <asp:BoundField AccessibleHeaderText="TenMenu" DataField="TenMenu" HeaderText="TenMenu" />
                            <asp:BoundField AccessibleHeaderText="Type" DataField="Type" HeaderText="Type" />
                            <asp:BoundField AccessibleHeaderText="Ord" DataField="Ord" HeaderText="Ord" />
                            <asp:BoundField AccessibleHeaderText="Level" DataField="Level" HeaderText="Level" />
                            <asp:BoundField AccessibleHeaderText="Link" DataField="Link" HeaderText="Link" />
                            <asp:BoundField AccessibleHeaderText="TypeClick" DataField="TypeClick" HeaderText="TypeClick" />
                            <asp:BoundField AccessibleHeaderText="Icon" DataField="Icon" HeaderText="Icon" />
                            <asp:BoundField AccessibleHeaderText="Active" DataField="Active" HeaderText="Active" />
                            <asp:TemplateField>
                                <HeaderTemplate>Chức năng</HeaderTemplate>
                                <ItemTemplate>
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbAddSub" runat="server" ImageUrl="~/Admin/Images/add.png" CommandName="AddSub" Text="AddSub" ToolTip="Thêm Menu con" OnCommand="lbAddSub_Command" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' />
                                    </div>
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbUp" runat="server" ImageUrl="~/Admin/Images/1459276881_arrow-up_basic_blue.png" CommandName="Up" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Visible='<%# (DataBinder.Eval(Container.DataItem, "Ord").ToString() != "1") %>'
                                            Text="Up" OnCommand="lbUp_Command" ToolTip="Lên Trên"></asp:ImageButton>
                                    </div>
                                    <!--To fire the OnRowEditing event.-->

                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbDown" runat="server" ImageUrl="~/Admin/Images/1459276887_arrow-down_basic_blue.png" CommandName="Down" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>' Visible='<%# isDown((DataBinder.Eval(Container.DataItem, "ID").ToString())) %>'
                                            Text="Down" OnCommand="lbDown_Command" ToolTip="Xuống Dưới"></asp:ImageButton>
                                    </div>
                                    <!--To fire the OnRowEditing event.-->
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbEdit" runat="server" ImageUrl="~/Admin/Images/edit.png" CommandName="Sua" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                            Text="Sua" OnCommand="lbEdit_Command" ToolTip="Sửa"></asp:ImageButton>
                                    </div>
                                    <!--To fire the OnRowDeleting event.-->
                                    <div style="min-width: 19.5%; min-height: 10px; float: left;">
                                        <asp:ImageButton ID="lbDelete" runat="server" CommandName="Xoa" ImageUrl="~/Admin/Images/close.png" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                            Text="Xoa" OnCommand="lbDelete_Command" ToolTip="Xóa" OnClientClick="javascript:return confirm('Bạn chắc chắn muốn xóa?');"></asp:ImageButton>
                                    </div>


                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>

                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnInfo" runat="server" Visible="false">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Cập nhật thông tin</h1>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div>
                    <asp:LinkButton ID="btnSave_Top" runat="server" OnClick="btnSave_Top_Click">
                        <button type="button" class="btn btn-primary btn-circle">
                            <i class="fa fa-save"></i>
                        </button>
                        <span>Lưu lại</span>
                        <img src="Images/split.png" style="margin-left:10px;"/>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnReturn_Top" runat="server" OnClick="btnReturn_Top_Click" OnCommand="btnReturn_Top_Command">
                         <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-success btn-circle"><i class="fa fa-mail-reply"></i>
                             </button>
                            <span>Trở lại</span>
                            <img src="Images/split.png" style="margin-left:10px;"/>
                             </div>
                    </asp:LinkButton>
                    <asp:Label ID="Label2" runat="server">
                                    <div style="clear:left;">
                                        
                                    </div>
                    </asp:Label>
                </div>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="dataTables_wrapper">
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label1" runat="server">ID :</asp:Label>
                        </div>
                        <asp:TextBox ID="txtID" runat="server" class="col-md-10" placeholder="ID" ReadOnly="true" Style="cursor: not-allowed"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label3" runat="server">Tên Menu</asp:Label>
                        </div>
                        <asp:TextBox ID="txtTenMenu" runat="server" class="col-md-10" placeholder="Tên Menu" Style="background-color: white !important;"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label4" runat="server">Type : </asp:Label>
                        </div>
                        <asp:TextBox ID="txtType" runat="server" class="col-md-10" placeholder="Type" ReadOnly="true" Style="cursor: not-allowed; background-color: white !important;"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label6" runat="server">Ord : </asp:Label>
                        </div>
                        <asp:TextBox runat="server" ID="txtOrd" class="col-md-10" placeholder="Ord" ReadOnly="true" Style="cursor: not-allowed; background-color: white !important;"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label7" runat="server">Level : </asp:Label>
                        </div>
                        <asp:TextBox runat="server" ID="txtLevel" class="col-md-10" placeholder="Level" ReadOnly="true" Style="cursor: not-allowed; background-color: white !important;"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label11" runat="server">Link : </asp:Label>
                        </div>
                        <asp:TextBox runat="server" ID="txtLink" class="col-md-10" placeholder="Link" Style="background-color: white !important;"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label5" runat="server">Link : </asp:Label>
                        </div>
                        <asp:DropDownList runat="server" ID="cmbTypeClick" class="col-md-10" Height="42px" Style="background-color: white !important;">
                            <asp:ListItem Value="">
                                ----
                            </asp:ListItem>
                            <asp:ListItem Value="_blank">
                                                   _blank
                            </asp:ListItem>
                            <asp:ListItem Value="_self">
                                                   _self
                            </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label9" runat="server">Icon : </asp:Label>

                            <!--Modal-->
                        </div>
                        <asp:TextBox ID="txtIcon" runat="server" placeholder="Choose Icon" Text="" CssClass="col-md-10" data-toggle="modal" data-target="#myModal" Style="background-color: white !important;"></asp:TextBox>
                    </div>
                    <div class="row show-grid">
                        <div class="col-md-2">
                            <asp:Label ID="Label10" runat="server">Active : </asp:Label>
                        </div>
                        <div class="col-md-10" style="background-color: white !important;">
                            <asp:CheckBox runat="server" ID="chkActive" ClientIDMode="Static"></asp:CheckBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="width: 60% !important;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">All available icons (font-awesome)</h4>
                    </div>
                    <div class="modal-body" style="min-height: 3050px;">
                        <div class="fa col-lg-3">
                            <p class="fa fa-glass">fa-glass </p>
                            <br />
                            <p class="fa fa-music">fa-music </p>
                            <br />
                            <p class="fa fa-search">fa-search </p>
                            <br />
                            <p class="fa fa-envelope-o">fa-envelope-o </p>
                            <br />
                            <p class="fa fa-heart">fa-heart </p>
                            <br />
                            <p class="fa fa-star">fa-star </p>
                            <br />
                            <p class="fa fa-star-o">fa-star-o </p>
                            <br />
                            <p class="fa fa-user">fa-user </p>
                            <br />
                            <p class="fa fa-film">fa-film </p>
                            <br />
                            <p class="fa fa-th-large">fa-th-large </p>
                            <br />
                            <p class="fa fa-th">fa-th </p>
                            <br />
                            <p class="fa fa-th-list">fa-th-list </p>
                            <br />
                            <p class="fa fa-check">fa-check </p>
                            <br />
                            <p class="fa fa-times">fa-times </p>
                            <br />
                            <p class="fa fa-search-plus">fa-search-plus </p>
                            <br />
                            <p class="fa fa-search-minus">fa-search-minus </p>
                            <br />
                            <p class="fa fa-power-off">fa-power-off </p>
                            <br />
                            <p class="fa fa-signal">fa-signal </p>
                            <br />
                            <p class="fa fa-gear">fa-gear </p>
                            <br />
                            <p class="fa fa-cog">fa-cog </p>
                            <br />
                            <p class="fa fa-trash-o">fa-trash-o </p>
                            <br />
                            <p class="fa fa-home">fa-home </p>
                            <br />
                            <p class="fa fa-file-o">fa-file-o </p>
                            <br />
                            <p class="fa fa-clock-o">fa-clock-o </p>
                            <br />
                            <p class="fa fa-road">fa-road </p>
                            <br />
                            <p class="fa fa-download">fa-download </p>
                            <br />
                            <p class="fa fa-arrow-circle-o-down">fa-arrow-circle-o-down </p>
                            <br />
                            <p class="fa fa-arrow-circle-o-up">fa-arrow-circle-o-up </p>
                            <br />
                            <p class="fa fa-inbox">fa-inbox </p>
                            <br />
                            <p class="fa fa-play-circle-o">fa-play-circle-o </p>
                            <br />
                            <p class="fa fa-rotate-right">fa-rotate-right </p>
                            <br />
                            <p class="fa fa-repeat">fa-repeat </p>
                            <br />
                            <p class="fa fa-refresh">fa-refresh </p>
                            <br />
                            <p class="fa fa-list-alt">fa-list-alt </p>
                            <br />
                            <p class="fa fa-lock">fa-lock </p>
                            <br />
                            <p class="fa fa-flag">fa-flag </p>
                            <br />
                            <p class="fa fa-headphones">fa-headphones </p>
                            <br />
                            <p class="fa fa-volume-off">fa-volume-off </p>
                            <br />
                            <p class="fa fa-volume-down">fa-volume-down </p>
                            <br />
                            <p class="fa fa-volume-up">fa-volume-up </p>
                            <br />
                            <p class="fa fa-qrcode">fa-qrcode </p>
                            <br />
                            <p class="fa fa-barcode">fa-barcode </p>
                            <br />
                            <p class="fa fa-tag">fa-tag </p>
                            <br />
                            <p class="fa fa-tags">fa-tags </p>
                            <br />
                            <p class="fa fa-book">fa-book </p>
                            <br />
                            <p class="fa fa-bookmark">fa-bookmark </p>
                            <br />
                            <p class="fa fa-print">fa-print </p>
                            <br />
                            <p class="fa fa-camera">fa-camera </p>
                            <br />
                            <p class="fa fa-font">fa-font </p>
                            <br />
                            <p class="fa fa-bold">fa-bold </p>
                            <br />
                            <p class="fa fa-italic">fa-italic </p>
                            <br />
                            <p class="fa fa-text-height">fa-text-height </p>
                            <br />
                            <p class="fa fa-text-width">fa-text-width </p>
                            <br />
                            <p class="fa fa-align-left">fa-align-left </p>
                            <br />
                            <p class="fa fa-align-center">fa-align-center </p>
                            <br />
                            <p class="fa fa-align-right">fa-align-right </p>
                            <br />
                            <p class="fa fa-align-justify">fa-align-justify </p>
                            <br />
                            <p class="fa fa-list">fa-list </p>
                            <br />
                            <p class="fa fa-dedent">fa-dedent </p>
                            <br />
                            <p class="fa fa-outdent">fa-outdent </p>
                            <br />
                            <p class="fa fa-indent">fa-indent </p>
                            <br />
                            <p class="fa fa-video-camera">fa-video-camera </p>
                            <br />
                            <p class="fa fa-photo">fa-photo </p>
                            <br />
                            <p class="fa fa-image">fa-image </p>
                            <br />
                            <p class="fa fa-picture-o">fa-picture-o </p>
                            <br />
                            <p class="fa fa-pencil">fa-pencil </p>
                            <br />
                            <p class="fa fa-map-marker">fa-map-marker </p>
                            <br />
                            <p class="fa fa-adjust">fa-adjust </p>
                            <br />
                            <p class="fa fa-tint">fa-tint </p>
                            <br />
                            <p class="fa fa-edit">fa-edit </p>
                            <br />
                            <p class="fa fa-pencil-square-o">fa-pencil-square-o </p>
                            <br />
                            <p class="fa fa-share-square-o">fa-share-square-o </p>
                            <br />
                            <p class="fa fa-check-square-o">fa-check-square-o </p>
                            <br />
                            <p class="fa fa-arrows">fa-arrows </p>
                            <br />
                            <p class="fa fa-step-backward">fa-step-backward </p>
                            <br />
                            <p class="fa fa-fast-backward">fa-fast-backward </p>
                            <br />
                            <p class="fa fa-backward">fa-backward </p>
                            <br />
                            <p class="fa fa-play">fa-play </p>
                            <br />
                            <p class="fa fa-pause">fa-pause </p>
                            <br />
                            <p class="fa fa-stop">fa-stop </p>
                            <br />
                            <p class="fa fa-forward">fa-forward </p>
                            <br />
                            <p class="fa fa-fast-forward">fa-fast-forward </p>
                            <br />
                            <p class="fa fa-step-forward">fa-step-forward </p>
                            <br />
                            <p class="fa fa-eject">fa-eject </p>
                            <br />
                            <p class="fa fa-chevron-left">fa-chevron-left </p>
                            <br />
                            <p class="fa fa-chevron-right">fa-chevron-right </p>
                            <br />
                            <p class="fa fa-plus-circle">fa-plus-circle </p>
                            <br />
                            <p class="fa fa-minus-circle">fa-minus-circle </p>
                            <br />
                            <p class="fa fa-times-circle">fa-times-circle </p>
                            <br />
                            <p class="fa fa-check-circle">fa-check-circle </p>
                            <br />
                            <p class="fa fa-question-circle">fa-question-circle </p>
                            <br />
                            <p class="fa fa-info-circle">fa-info-circle </p>
                            <br />
                            <p class="fa fa-crosshairs">fa-crosshairs </p>
                            <br />
                            <p class="fa fa-times-circle-o">fa-times-circle-o </p>
                            <br />
                            <p class="fa fa-check-circle-o">fa-check-circle-o </p>
                            <br />
                            <p class="fa fa-ban">fa-ban </p>
                            <br />
                            <p class="fa fa-arrow-left">fa-arrow-left </p>
                            <br />
                            <p class="fa fa-arrow-right">fa-arrow-right </p>
                            <br />
                            <p class="fa fa-arrow-up">fa-arrow-up </p>
                            <br />
                            <p class="fa fa-arrow-down">fa-arrow-down </p>
                            <br />
                            <p class="fa fa-mail-forward">fa-mail-forward </p>
                            <br />
                            <p class="fa fa-share">fa-share </p>
                            <br />
                            <p class="fa fa-expand">fa-expand </p>
                            <br />
                            <p class="fa fa-compress">fa-compress </p>
                            <br />
                            <p class="fa fa-plus">fa-plus </p>
                            <br />
                            <p class="fa fa-minus">fa-minus </p>
                            <br />
                            <p class="fa fa-asterisk">fa-asterisk </p>
                            <br />
                            <p class="fa fa-exclamation-circle">fa-exclamation-circle </p>
                            <br />
                            <p class="fa fa-gift">fa-gift </p>
                            <br />
                            <p class="fa fa-leaf">fa-leaf </p>
                            <br />
                            <p class="fa fa-fire">fa-fire </p>
                            <br />
                            <p class="fa fa-eye">fa-eye </p>
                            <br />
                            <p class="fa fa-eye-slash">fa-eye-slash </p>
                            <br />
                            <p class="fa fa-warning">fa-warning </p>
                            <br />
                            <p class="fa fa-exclamation-triangle">fa-exclamation-triangle </p>
                            <br />
                            <p class="fa fa-plane">fa-plane </p>
                            <br />
                            <p class="fa fa-calendar">fa-calendar </p>
                            <br />
                            <p class="fa fa-random">fa-random </p>
                            <br />
                            <p class="fa fa-comment">fa-comment </p>
                            <br />
                            <p class="fa fa-magnet">fa-magnet </p>
                            <br />
                            <p class="fa fa-chevron-up">fa-chevron-up </p>
                            <br />
                            <p class="fa fa-chevron-down">fa-chevron-down </p>
                            <br />
                            <p class="fa fa-retweet">fa-retweet </p>
                            <br />
                            <p class="fa fa-shopping-cart">fa-shopping-cart </p>
                            <br />
                            <p class="fa fa-folder">fa-folder </p>
                            <br />
                            <p class="fa fa-folder-open">fa-folder-open </p>
                            <br />
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                        <div class="fa col-lg-3">
                            <p class="fa fa-arrows-v">fa-arrows-v </p>
                            <br />
                            <p class="fa fa-arrows-h">fa-arrows-h </p>
                            <br />
                            <p class="fa fa-bar-chart-o">fa-bar-chart-o </p>
                            <br />
                            <p class="fa fa-twitter-square">fa-twitter-square </p>
                            <br />
                            <p class="fa fa-facebook-square">fa-facebook-square </p>
                            <br />
                            <p class="fa fa-camera-retro">fa-camera-retro </p>
                            <br />
                            <p class="fa fa-key">fa-key </p>
                            <br />
                            <p class="fa fa-gears">fa-gears </p>
                            <br />
                            <p class="fa fa-cogs">fa-cogs </p>
                            <br />
                            <p class="fa fa-comments">fa-comments </p>
                            <br />
                            <p class="fa fa-thumbs-o-up">fa-thumbs-o-up </p>
                            <br />
                            <p class="fa fa-thumbs-o-down">fa-thumbs-o-down </p>
                            <br />
                            <p class="fa fa-star-half">fa-star-half </p>
                            <br />
                            <p class="fa fa-heart-o">fa-heart-o </p>
                            <br />
                            <p class="fa fa-sign-out">fa-sign-out </p>
                            <br />
                            <p class="fa fa-linkedin-square">fa-linkedin-square </p>
                            <br />
                            <p class="fa fa-thumb-tack">fa-thumb-tack </p>
                            <br />
                            <p class="fa fa-external-link">fa-external-link </p>
                            <br />
                            <p class="fa fa-sign-in">fa-sign-in </p>
                            <br />
                            <p class="fa fa-trophy">fa-trophy </p>
                            <br />
                            <p class="fa fa-github-square">fa-github-square </p>
                            <br />
                            <p class="fa fa-upload">fa-upload </p>
                            <br />
                            <p class="fa fa-lemon-o">fa-lemon-o </p>
                            <br />
                            <p class="fa fa-phone">fa-phone </p>
                            <br />
                            <p class="fa fa-square-o">fa-square-o </p>
                            <br />
                            <p class="fa fa-bookmark-o">fa-bookmark-o </p>
                            <br />
                            <p class="fa fa-phone-square">fa-phone-square </p>
                            <br />
                            <p class="fa fa-twitter">fa-twitter </p>
                            <br />
                            <p class="fa fa-facebook">fa-facebook </p>
                            <br />
                            <p class="fa fa-github">fa-github </p>
                            <br />
                            <p class="fa fa-unlock">fa-unlock </p>
                            <br />
                            <p class="fa fa-credit-card">fa-credit-card </p>
                            <br />
                            <p class="fa fa-rss">fa-rss </p>
                            <br />
                            <p class="fa fa-hdd-o">fa-hdd-o </p>
                            <br />
                            <p class="fa fa-bullhorn">fa-bullhorn </p>
                            <br />
                            <p class="fa fa-bell">fa-bell </p>
                            <br />
                            <p class="fa fa-certificate">fa-certificate </p>
                            <br />
                            <p class="fa fa-hand-o-right">fa-hand-o-right </p>
                            <br />
                            <p class="fa fa-hand-o-left">fa-hand-o-left </p>
                            <br />
                            <p class="fa fa-hand-o-up">fa-hand-o-up </p>
                            <br />
                            <p class="fa fa-hand-o-down">fa-hand-o-down </p>
                            <br />
                            <p class="fa fa-arrow-circle-left">fa-arrow-circle-left </p>
                            <br />
                            <p class="fa fa-arrow-circle-right">fa-arrow-circle-right </p>
                            <br />
                            <p class="fa fa-arrow-circle-up">fa-arrow-circle-up </p>
                            <br />
                            <p class="fa fa-arrow-circle-down">fa-arrow-circle-down </p>
                            <br />
                            <p class="fa fa-globe">fa-globe </p>
                            <br />
                            <p class="fa fa-wrench">fa-wrench </p>
                            <br />
                            <p class="fa fa-tasks">fa-tasks </p>
                            <br />
                            <p class="fa fa-filter">fa-filter </p>
                            <br />
                            <p class="fa fa-briefcase">fa-briefcase </p>
                            <br />
                            <p class="fa fa-arrows-alt">fa-arrows-alt </p>
                            <br />
                            <p class="fa fa-group">fa-group </p>
                            <br />
                            <p class="fa fa-users">fa-users </p>
                            <br />
                            <p class="fa fa-chain">fa-chain </p>
                            <br />
                            <p class="fa fa-link">fa-link </p>
                            <br />
                            <p class="fa fa-cloud">fa-cloud </p>
                            <br />
                            <p class="fa fa-flask">fa-flask </p>
                            <br />
                            <p class="fa fa-cut">fa-cut </p>
                            <br />
                            <p class="fa fa-scissors">fa-scissors </p>
                            <br />
                            <p class="fa fa-copy">fa-copy </p>
                            <br />
                            <p class="fa fa-files-o">fa-files-o </p>
                            <br />
                            <p class="fa fa-paperclip">fa-paperclip </p>
                            <br />
                            <p class="fa fa-save">fa-save </p>
                            <br />
                            <p class="fa fa-floppy-o">fa-floppy-o </p>
                            <br />
                            <p class="fa fa-square">fa-square </p>
                            <br />
                            <p class="fa fa-navicon">fa-navicon </p>
                            <br />
                            <p class="fa fa-reorder">fa-reorder </p>
                            <br />
                            <p class="fa fa-bars">fa-bars </p>
                            <br />
                            <p class="fa fa-list-ul">fa-list-ul </p>
                            <br />
                            <p class="fa fa-list-ol">fa-list-ol </p>
                            <br />
                            <p class="fa fa-strikethrough">fa-strikethrough </p>
                            <br />
                            <p class="fa fa-underline">fa-underline </p>
                            <br />
                            <p class="fa fa-table">fa-table </p>
                            <br />
                            <p class="fa fa-magic">fa-magic </p>
                            <br />
                            <p class="fa fa-truck">fa-truck </p>
                            <br />
                            <p class="fa fa-pinterest">fa-pinterest </p>
                            <br />
                            <p class="fa fa-pinterest-square">fa-pinterest-square </p>
                            <br />
                            <p class="fa fa-google-plus-square">fa-google-plus-square </p>
                            <br />
                            <p class="fa fa-google-plus">fa-google-plus </p>
                            <br />
                            <p class="fa fa-money">fa-money </p>
                            <br />
                            <p class="fa fa-caret-down">fa-caret-down </p>
                            <br />
                            <p class="fa fa-caret-up">fa-caret-up </p>
                            <br />
                            <p class="fa fa-caret-left">fa-caret-left </p>
                            <br />
                            <p class="fa fa-caret-right">fa-caret-right </p>
                            <br />
                            <p class="fa fa-columns">fa-columns </p>
                            <br />
                            <p class="fa fa-unsorted">fa-unsorted </p>
                            <br />
                            <p class="fa fa-sort">fa-sort </p>
                            <br />
                            <p class="fa fa-sort-down">fa-sort-down </p>
                            <br />
                            <p class="fa fa-sort-desc">fa-sort-desc </p>
                            <br />
                            <p class="fa fa-sort-up">fa-sort-up </p>
                            <br />
                            <p class="fa fa-sort-asc">fa-sort-asc </p>
                            <br />
                            <p class="fa fa-envelope">fa-envelope </p>
                            <br />
                            <p class="fa fa-linkedin">fa-linkedin </p>
                            <br />
                            <p class="fa fa-rotate-left">fa-rotate-left </p>
                            <br />
                            <p class="fa fa-undo">fa-undo </p>
                            <br />
                            <p class="fa fa-legal">fa-legal </p>
                            <br />
                            <p class="fa fa-gavel">fa-gavel </p>
                            <br />
                            <p class="fa fa-dashboard">fa-dashboard </p>
                            <br />
                            <p class="fa fa-tachometer">fa-tachometer </p>
                            <br />
                            <p class="fa fa-comment-o">fa-comment-o </p>
                            <br />
                            <p class="fa fa-comments-o">fa-comments-o </p>
                            <br />
                            <p class="fa fa-flash">fa-flash </p>
                            <br />
                            <p class="fa fa-bolt">fa-bolt </p>
                            <br />
                            <p class="fa fa-sitemap">fa-sitemap </p>
                            <br />
                            <p class="fa fa-umbrella">fa-umbrella </p>
                            <br />
                            <p class="fa fa-paste">fa-paste </p>
                            <br />
                            <p class="fa fa-clipboard">fa-clipboard </p>
                            <br />
                            <p class="fa fa-lightbulb-o">fa-lightbulb-o </p>
                            <br />
                            <p class="fa fa-exchange">fa-exchange </p>
                            <br />
                            <p class="fa fa-cloud-download">fa-cloud-download </p>
                            <br />
                            <p class="fa fa-cloud-upload">fa-cloud-upload </p>
                            <br />
                            <p class="fa fa-user-md">fa-user-md </p>
                            <br />
                            <p class="fa fa-stethoscope">fa-stethoscope </p>
                            <br />
                            <p class="fa fa-suitcase">fa-suitcase </p>
                            <br />
                            <p class="fa fa-bell-o">fa-bell-o </p>
                            <br />
                            <p class="fa fa-coffee">fa-coffee </p>
                            <br />
                            <p class="fa fa-cutlery">fa-cutlery </p>
                            <br />
                            <p class="fa fa-file-text-o">fa-file-text-o </p>
                            <br />
                            <p class="fa fa-building-o">fa-building-o </p>
                            <br />
                            <p class="fa fa-hospital-o">fa-hospital-o </p>
                            <br />
                            <p class="fa fa-ambulance">fa-ambulance </p>
                            <br />
                            <p class="fa fa-medkit">fa-medkit </p>
                            <br />
                            <p class="fa fa-fighter-jet">fa-fighter-jet </p>
                            <br />
                            <p class="fa fa-beer">fa-beer </p>
                            <br />
                            <p class="fa fa-h-square">fa-h-square </p>
                            <br />
                            <p class="fa fa-plus-square">fa-plus-square </p>
                            <br />
                        </div>
                        <div class="fa col-lg-3">
                            <p class="fa fa-angle-double-left">fa-angle-double-left </p>
                            <br />
                            <p class="fa fa-angle-double-right">fa-angle-double-right </p>
                            <br />
                            <p class="fa fa-angle-double-up">fa-angle-double-up </p>
                            <br />
                            <p class="fa fa-angle-double-down">fa-angle-double-down </p>
                            <br />
                            <p class="fa fa-angle-left">fa-angle-left </p>
                            <br />
                            <p class="fa fa-angle-right">fa-angle-right </p>
                            <br />
                            <p class="fa fa-angle-up">fa-angle-up </p>
                            <br />
                            <p class="fa fa-angle-down">fa-angle-down </p>
                            <br />
                            <p class="fa fa-desktop">fa-desktop </p>
                            <br />
                            <p class="fa fa-laptop">fa-laptop </p>
                            <br />
                            <p class="fa fa-tablet">fa-tablet </p>
                            <br />
                            <p class="fa fa-mobile-phone">fa-mobile-phone </p>
                            <br />
                            <p class="fa fa-mobile">fa-mobile </p>
                            <br />
                            <p class="fa fa-circle-o">fa-circle-o </p>
                            <br />
                            <p class="fa fa-quote-left">fa-quote-left </p>
                            <br />
                            <p class="fa fa-quote-right">fa-quote-right </p>
                            <br />
                            <p class="fa fa-spinner">fa-spinner </p>
                            <br />
                            <p class="fa fa-circle">fa-circle </p>
                            <br />
                            <p class="fa fa-mail-reply">fa-mail-reply </p>
                            <br />
                            <p class="fa fa-reply">fa-reply </p>
                            <br />
                            <p class="fa fa-github-alt">fa-github-alt </p>
                            <br />
                            <p class="fa fa-folder-o">fa-folder-o </p>
                            <br />
                            <p class="fa fa-folder-open-o">fa-folder-open-o </p>
                            <br />
                            <p class="fa fa-smile-o">fa-smile-o </p>
                            <br />
                            <p class="fa fa-frown-o">fa-frown-o </p>
                            <br />
                            <p class="fa fa-meh-o">fa-meh-o </p>
                            <br />
                            <p class="fa fa-gamepad">fa-gamepad </p>
                            <br />
                            <p class="fa fa-keyboard-o">fa-keyboard-o </p>
                            <br />
                            <p class="fa fa-flag-o">fa-flag-o </p>
                            <br />
                            <p class="fa fa-flag-checkered">fa-flag-checkered </p>
                            <br />
                            <p class="fa fa-terminal">fa-terminal </p>
                            <br />
                            <p class="fa fa-code">fa-code </p>
                            <br />
                            <p class="fa fa-mail-reply-all">fa-mail-reply-all </p>
                            <br />
                            <p class="fa fa-reply-all">fa-reply-all </p>
                            <br />
                            <p class="fa fa-star-half-empty">fa-star-half-empty </p>
                            <br />
                            <p class="fa fa-star-half-full">fa-star-half-full </p>
                            <br />
                            <p class="fa fa-star-half-o">fa-star-half-o </p>
                            <br />
                            <p class="fa fa-location-arrow">fa-location-arrow </p>
                            <br />
                            <p class="fa fa-crop">fa-crop </p>
                            <br />
                            <p class="fa fa-code-fork">fa-code-fork </p>
                            <br />
                            <p class="fa fa-unlink">fa-unlink </p>
                            <br />
                            <p class="fa fa-chain-broken">fa-chain-broken </p>
                            <br />
                            <p class="fa fa-question">fa-question </p>
                            <br />
                            <p class="fa fa-info">fa-info </p>
                            <br />
                            <p class="fa fa-exclamation">fa-exclamation </p>
                            <br />
                            <p class="fa fa-superscript">fa-superscript </p>
                            <br />
                            <p class="fa fa-subscript">fa-subscript </p>
                            <br />
                            <p class="fa fa-eraser">fa-eraser </p>
                            <br />
                            <p class="fa fa-puzzle-piece">fa-puzzle-piece </p>
                            <br />
                            <p class="fa fa-microphone">fa-microphone </p>
                            <br />
                            <p class="fa fa-microphone-slash">fa-microphone-slash </p>
                            <br />
                            <p class="fa fa-shield">fa-shield </p>
                            <br />
                            <p class="fa fa-calendar-o">fa-calendar-o </p>
                            <br />
                            <p class="fa fa-fire-extinguisher">fa-fire-extinguisher </p>
                            <br />
                            <p class="fa fa-rocket">fa-rocket </p>
                            <br />
                            <p class="fa fa-maxcdn">fa-maxcdn </p>
                            <br />
                            <p class="fa fa-chevron-circle-left">fa-chevron-circle-left </p>
                            <br />
                            <p class="fa fa-chevron-circle-right">fa-chevron-circle-right </p>
                            <br />
                            <p class="fa fa-chevron-circle-up">fa-chevron-circle-up </p>
                            <br />
                            <p class="fa fa-chevron-circle-down">fa-chevron-circle-down </p>
                            <br />
                            <p class="fa fa-html5">fa-html5 </p>
                            <br />
                            <p class="fa fa-css3">fa-css3 </p>
                            <br />
                            <p class="fa fa-anchor">fa-anchor </p>
                            <br />
                            <p class="fa fa-unlock-alt">fa-unlock-alt </p>
                            <br />
                            <p class="fa fa-bullseye">fa-bullseye </p>
                            <br />
                            <p class="fa fa-ellipsis-h">fa-ellipsis-h </p>
                            <br />
                            <p class="fa fa-ellipsis-v">fa-ellipsis-v </p>
                            <br />
                            <p class="fa fa-rss-square">fa-rss-square </p>
                            <br />
                            <p class="fa fa-play-circle">fa-play-circle </p>
                            <br />
                            <p class="fa fa-ticket">fa-ticket </p>
                            <br />
                            <p class="fa fa-minus-square">fa-minus-square </p>
                            <br />
                            <p class="fa fa-minus-square-o">fa-minus-square-o </p>
                            <br />
                            <p class="fa fa-level-up">fa-level-up </p>
                            <br />
                            <p class="fa fa-level-down">fa-level-down </p>
                            <br />
                            <p class="fa fa-check-square">fa-check-square </p>
                            <br />
                            <p class="fa fa-pencil-square">fa-pencil-square </p>
                            <br />
                            <p class="fa fa-external-link-square">fa-external-link-square </p>
                            <br />
                            <p class="fa fa-share-square">fa-share-square </p>
                            <br />
                            <p class="fa fa-compass">fa-compass </p>
                            <br />
                            <p class="fa fa-toggle-down">fa-toggle-down </p>
                            <br />
                            <p class="fa fa-caret-square-o-down">fa-caret-square-o-down </p>
                            <br />
                            <p class="fa fa-toggle-up">fa-toggle-up </p>
                            <br />
                            <p class="fa fa-caret-square-o-up">fa-caret-square-o-up </p>
                            <br />
                            <p class="fa fa-toggle-right">fa-toggle-right </p>
                            <br />
                            <p class="fa fa-caret-square-o-right">fa-caret-square-o-right </p>
                            <br />
                            <p class="fa fa-euro">fa-euro </p>
                            <br />
                            <p class="fa fa-eur">fa-eur </p>
                            <br />
                            <p class="fa fa-gbp">fa-gbp </p>
                            <br />
                            <p class="fa fa-dollar">fa-dollar </p>
                            <br />
                            <p class="fa fa-usd">fa-usd </p>
                            <br />
                            <p class="fa fa-rupee">fa-rupee </p>
                            <br />
                            <p class="fa fa-inr">fa-inr </p>
                            <br />
                            <p class="fa fa-cny">fa-cny </p>
                            <br />
                            <p class="fa fa-rmb">fa-rmb </p>
                            <br />
                            <p class="fa fa-yen">fa-yen </p>
                            <br />
                            <p class="fa fa-jpy">fa-jpy </p>
                            <br />
                            <p class="fa fa-ruble">fa-ruble </p>
                            <br />
                            <p class="fa fa-rouble">fa-rouble </p>
                            <br />
                            <p class="fa fa-rub">fa-rub </p>
                            <br />
                            <p class="fa fa-won">fa-won </p>
                            <br />
                            <p class="fa fa-krw">fa-krw </p>
                            <br />
                            <p class="fa fa-bitcoin">fa-bitcoin </p>
                            <br />
                            <p class="fa fa-btc">fa-btc </p>
                            <br />
                            <p class="fa fa-file">fa-file </p>
                            <br />
                            <p class="fa fa-file-text">fa-file-text </p>
                            <br />
                            <p class="fa fa-sort-alpha-asc">fa-sort-alpha-asc </p>
                            <br />
                            <p class="fa fa-sort-alpha-desc">fa-sort-alpha-desc </p>
                            <br />
                            <p class="fa fa-sort-amount-asc">fa-sort-amount-asc </p>
                            <br />
                            <p class="fa fa-sort-amount-desc">fa-sort-amount-desc </p>
                            <br />
                            <p class="fa fa-sort-numeric-asc">fa-sort-numeric-asc </p>
                            <br />
                            <p class="fa fa-sort-numeric-desc">fa-sort-numeric-desc </p>
                            <br />
                            <p class="fa fa-thumbs-up">fa-thumbs-up </p>
                            <br />
                            <p class="fa fa-thumbs-down">fa-thumbs-down </p>
                            <br />
                            <p class="fa fa-youtube-square">fa-youtube-square </p>
                            <br />
                            <p class="fa fa-youtube">fa-youtube </p>
                            <br />
                            <p class="fa fa-xing">fa-xing </p>
                            <br />
                            <p class="fa fa-xing-square">fa-xing-square </p>
                            <br />
                            <p class="fa fa-youtube-play">fa-youtube-play </p>
                            <br />
                            <p class="fa fa-dropbox">fa-dropbox </p>
                            <br />
                            <p class="fa fa-stack-overflow">fa-stack-overflow </p>
                            <br />
                            <p class="fa fa-instagram">fa-instagram </p>
                            <br />
                            <p class="fa fa-flickr">fa-flickr </p>
                            <br />
                            <p class="fa fa-adn">fa-adn </p>
                            <br />
                            <p class="fa fa-bitbucket">fa-bitbucket </p>
                            <br />
                            <p class="fa fa-bitbucket-square">fa-bitbucket-square </p>
                            <br />
                            <p class="fa fa-tumblr">fa-tumblr </p>
                            <br />
                        </div>
                        <div class="fa col-lg-3">
                            <p class="fa fa-tumblr-square">fa-tumblr-square </p>
                            <br />
                            <p class="fa fa-long-arrow-down">fa-long-arrow-down </p>
                            <br />
                            <p class="fa fa-long-arrow-up">fa-long-arrow-up </p>
                            <br />
                            <p class="fa fa-long-arrow-left">fa-long-arrow-left </p>
                            <br />
                            <p class="fa fa-long-arrow-right">fa-long-arrow-right </p>
                            <br />
                            <p class="fa fa-apple">fa-apple </p>
                            <br />
                            <p class="fa fa-windows">fa-windows </p>
                            <br />
                            <p class="fa fa-android">fa-android </p>
                            <br />
                            <p class="fa fa-linux">fa-linux </p>
                            <br />
                            <p class="fa fa-dribbble">fa-dribbble </p>
                            <br />
                            <p class="fa fa-skype">fa-skype </p>
                            <br />
                            <p class="fa fa-foursquare">fa-foursquare </p>
                            <br />
                            <p class="fa fa-trello">fa-trello </p>
                            <br />
                            <p class="fa fa-female">fa-female </p>
                            <br />
                            <p class="fa fa-male">fa-male </p>
                            <br />
                            <p class="fa fa-gittip">fa-gittip </p>
                            <br />
                            <p class="fa fa-sun-o">fa-sun-o </p>
                            <br />
                            <p class="fa fa-moon-o">fa-moon-o </p>
                            <br />
                            <p class="fa fa-archive">fa-archive </p>
                            <br />
                            <p class="fa fa-bug">fa-bug </p>
                            <br />
                            <p class="fa fa-vk">fa-vk </p>
                            <br />
                            <p class="fa fa-weibo">fa-weibo </p>
                            <br />
                            <p class="fa fa-renren">fa-renren </p>
                            <br />
                            <p class="fa fa-pagelines">fa-pagelines </p>
                            <br />
                            <p class="fa fa-stack-exchange">fa-stack-exchange </p>
                            <br />
                            <p class="fa fa-arrow-circle-o-right">fa-arrow-circle-o-right </p>
                            <br />
                            <p class="fa fa-arrow-circle-o-left">fa-arrow-circle-o-left </p>
                            <br />
                            <p class="fa fa-toggle-left">fa-toggle-left </p>
                            <br />
                            <p class="fa fa-caret-square-o-left">fa-caret-square-o-left </p>
                            <br />
                            <p class="fa fa-dot-circle-o">fa-dot-circle-o </p>
                            <br />
                            <p class="fa fa-wheelchair">fa-wheelchair </p>
                            <br />
                            <p class="fa fa-vimeo-square">fa-vimeo-square </p>
                            <br />
                            <p class="fa fa-turkish-lira">fa-turkish-lira </p>
                            <br />
                            <p class="fa fa-try">fa-try </p>
                            <br />
                            <p class="fa fa-plus-square-o">fa-plus-square-o </p>
                            <br />
                            <p class="fa fa-space-shuttle">fa-space-shuttle </p>
                            <br />
                            <p class="fa fa-slack">fa-slack </p>
                            <br />
                            <p class="fa fa-envelope-square">fa-envelope-square </p>
                            <br />
                            <p class="fa fa-wordpress">fa-wordpress </p>
                            <br />
                            <p class="fa fa-openid">fa-openid </p>
                            <br />
                            <p class="fa fa-institution">fa-institution </p>
                            <br />
                            <p class="fa fa-bank">fa-bank </p>
                            <br />
                            <p class="fa fa-university">fa-university </p>
                            <br />
                            <p class="fa fa-mortar-board">fa-mortar-board </p>
                            <br />
                            <p class="fa fa-graduation-cap">fa-graduation-cap </p>
                            <br />
                            <p class="fa fa-yahoo">fa-yahoo </p>
                            <br />
                            <p class="fa fa-google">fa-google </p>
                            <br />
                            <p class="fa fa-reddit">fa-reddit </p>
                            <br />
                            <p class="fa fa-reddit-square">fa-reddit-square </p>
                            <br />
                            <p class="fa fa-stumbleupon-circle">fa-stumbleupon-circle </p>
                            <br />
                            <p class="fa fa-stumbleupon">fa-stumbleupon </p>
                            <br />
                            <p class="fa fa-delicious">fa-delicious </p>
                            <br />
                            <p class="fa fa-digg">fa-digg </p>
                            <br />
                            <p class="fa fa-pied-piper-square">fa-pied-piper-square </p>
                            <br />
                            <p class="fa fa-pied-piper">fa-pied-piper </p>
                            <br />
                            <p class="fa fa-pied-piper-alt">fa-pied-piper-alt </p>
                            <br />
                            <p class="fa fa-drupal">fa-drupal </p>
                            <br />
                            <p class="fa fa-joomla">fa-joomla </p>
                            <br />
                            <p class="fa fa-language">fa-language </p>
                            <br />
                            <p class="fa fa-fax">fa-fax </p>
                            <br />
                            <p class="fa fa-building">fa-building </p>
                            <br />
                            <p class="fa fa-child">fa-child </p>
                            <br />
                            <p class="fa fa-paw">fa-paw </p>
                            <br />
                            <p class="fa fa-spoon">fa-spoon </p>
                            <br />
                            <p class="fa fa-cube">fa-cube </p>
                            <br />
                            <p class="fa fa-cubes">fa-cubes </p>
                            <br />
                            <p class="fa fa-behance">fa-behance </p>
                            <br />
                            <p class="fa fa-behance-square">fa-behance-square </p>
                            <br />
                            <p class="fa fa-steam">fa-steam </p>
                            <br />
                            <p class="fa fa-steam-square">fa-steam-square </p>
                            <br />
                            <p class="fa fa-recycle">fa-recycle </p>
                            <br />
                            <p class="fa fa-automobile">fa-automobile </p>
                            <br />
                            <p class="fa fa-car">fa-car </p>
                            <br />
                            <p class="fa fa-cab">fa-cab </p>
                            <br />
                            <p class="fa fa-taxi">fa-taxi </p>
                            <br />
                            <p class="fa fa-tree">fa-tree </p>
                            <br />
                            <p class="fa fa-spotify">fa-spotify </p>
                            <br />
                            <p class="fa fa-deviantart">fa-deviantart </p>
                            <br />
                            <p class="fa fa-soundcloud">fa-soundcloud </p>
                            <br />
                            <p class="fa fa-database">fa-database </p>
                            <br />
                            <p class="fa fa-file-pdf-o">fa-file-pdf-o </p>
                            <br />
                            <p class="fa fa-file-word-o">fa-file-word-o </p>
                            <br />
                            <p class="fa fa-file-excel-o">fa-file-excel-o </p>
                            <br />
                            <p class="fa fa-file-powerpoint-o">fa-file-powerpoint-o </p>
                            <br />
                            <p class="fa fa-file-photo-o">fa-file-photo-o </p>
                            <br />
                            <p class="fa fa-file-picture-o">fa-file-picture-o </p>
                            <br />
                            <p class="fa fa-file-image-o">fa-file-image-o </p>
                            <br />
                            <p class="fa fa-file-zip-o">fa-file-zip-o </p>
                            <br />
                            <p class="fa fa-file-archive-o">fa-file-archive-o </p>
                            <br />
                            <p class="fa fa-file-sound-o">fa-file-sound-o </p>
                            <br />
                            <p class="fa fa-file-audio-o">fa-file-audio-o </p>
                            <br />
                            <p class="fa fa-file-movie-o">fa-file-movie-o </p>
                            <br />
                            <p class="fa fa-file-video-o">fa-file-video-o </p>
                            <br />
                            <p class="fa fa-file-code-o">fa-file-code-o </p>
                            <br />
                            <p class="fa fa-vine">fa-vine </p>
                            <br />
                            <p class="fa fa-codepen">fa-codepen </p>
                            <br />
                            <p class="fa fa-jsfiddle">fa-jsfiddle </p>
                            <br />
                            <p class="fa fa-life-bouy">fa-life-bouy </p>
                            <br />
                            <p class="fa fa-life-saver">fa-life-saver </p>
                            <br />
                            <p class="fa fa-support">fa-support </p>
                            <br />
                            <p class="fa fa-life-ring">fa-life-ring </p>
                            <br />
                            <p class="fa fa-circle-o-notch">fa-circle-o-notch </p>
                            <br />
                            <p class="fa fa-ra">fa-ra </p>
                            <br />
                            <p class="fa fa-rebel">fa-rebel </p>
                            <br />
                            <p class="fa fa-ge">fa-ge </p>
                            <br />
                            <p class="fa fa-empire">fa-empire </p>
                            <br />
                            <p class="fa fa-git-square">fa-git-square </p>
                            <br />
                            <p class="fa fa-git">fa-git </p>
                            <br />
                            <p class="fa fa-hacker-news">fa-hacker-news </p>
                            <br />
                            <p class="fa fa-tencent-weibo">fa-tencent-weibo </p>
                            <br />
                            <p class="fa fa-qq">fa-qq </p>
                            <br />
                            <p class="fa fa-wechat">fa-wechat </p>
                            <br />
                            <p class="fa fa-weixin">fa-weixin </p>
                            <br />
                            <p class="fa fa-send">fa-send </p>
                            <br />
                            <p class="fa fa-paper-plane">fa-paper-plane </p>
                            <br />
                            <p class="fa fa-send-o">fa-send-o </p>
                            <br />
                            <p class="fa fa-paper-plane-o">fa-paper-plane-o </p>
                            <br />
                            <p class="fa fa-history">fa-history </p>
                            <br />
                            <p class="fa fa-circle-thin">fa-circle-thin </p>
                            <br />
                            <p class="fa fa-header">fa-header </p>
                            <br />
                            <p class="fa fa-paragraph">fa-paragraph </p>
                            <br />
                            <p class="fa fa-sliders">fa-sliders </p>
                            <br />
                            <p class="fa fa-share-alt">fa-share-alt </p>
                            <br />
                            <p class="fa fa-share-alt-square">fa-share-alt-square </p>
                            <br />
                            <p class="fa fa-bomb">fa-bomb </p>
                            <br />
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <!-- DataTables JavaScript -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
       

            $(document).ready(function () {
                $('#grvMenu').DataTable({
                    responsive: true
                });

            });
       
            $('#myModal p').on('click', function () {
                $('#<%=txtIcon.ClientID%>').attr("value", $(this).attr('class') + " fa-fw");
                $('#<%=txtIcon.ClientID%>').html($(this).attr('class') + " fa-fw");
                $('#myModal').hide();
                $('#myModal').attr('class', 'modal fade');
                $('.modal-backdrop').remove();
            });
    </script>
</asp:Content>
