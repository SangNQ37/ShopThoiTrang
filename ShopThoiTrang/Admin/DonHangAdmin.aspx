<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="DonHangAdmin.aspx.cs" Inherits="ShopThoiTrang.Admin.DonHangAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script tyle="text/javascript" language="javascript">
        function CheckAllEmp(Checkbox) {
            //var GridVwHeaderChckbox = document.getElementById("");
            //for (i = 1; i < GridVwHeaderChckbox.rows.length; i++)
            //{

            //}
        }
       
        function DisplayDataToModal(id, ngaylapHd, IdKhachHang, IdPay) {
         
            $('#<%=lbl_ID.ClientID%>').html(id);

           $('#<%=lblngaylapHd.ClientID%>').html(ngaylapHd);
           $('#<%=lblId_KhachHang.ClientID%>').html(IdKhachHang);
           $('#<%=lblIdpttt.ClientID%>').html(IdPay);
           //$('#lbl_ID').val(id);

       }

       
      
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnData" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Quản lý Đơn hàng</h1>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="height: 48px;">
                    <asp:LinkButton ID="btnRefresh_Top" runat="server" OnCommand="btnRefresh_Top_Command">
                        <div style="float:left;margin-right:10px;">
                            <button type="button" class="btn btn-primary btn-circle">
                                <i class="fa fa-refresh"></i>
                            </button>
                            <span>Làm mới</span>
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
                    <asp:LinkButton ID="btnDelete" runat="server" OnClientClick="javascript:return confirm('Bạn chắc chắn muốn xóa?');" OnCommand="btnDelete_Command" OnClick="btnDelete_Click">
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
                    <asp:GridView ID="grvDatHang" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CssClass="table table-striped table-bordered table-hover" OnRowDataBound="grvKhachHang_RowDataBound" OnSelectedIndexChanged="grvKhachHang_SelectedIndexChanged" OnRowCommand="grvKhachHang_RowCommand" OnRowEditing="grvKhachHang_RowEditing">
                        <HeaderStyle CssClass="dgvheader" />
                        <RowStyle CssClass="gradeA" />
                        <Columns>

                           
                            <asp:BoundField AccessibleHeaderText="id" DataField="id" HeaderText="ID">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="NgaylapHD" DataField="NgaylapHD" HeaderText="Ngày đặt hàng">
                                <HeaderStyle Width="200px" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="id_KhachHang" DataField="id_KhachHang" HeaderText="ID Khách Hàng">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="IdPay" DataField="IdPay" HeaderText="ID_Phương Thức Thanh Toán">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="300px" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Chi tiết đơn hàng
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%--onClick="editModal(id)"--%>
                                   
                                          <%--<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" onclick="DisplayDataToModal('<%# Eval("id") %>','<%# Eval("NgaylapHD") %>', '<%# Eval("id_KhachHang")%>' , '<%# Eval("IdPay") %>')">Chi tiết</button>--%>
                                    
                                  <button   type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"  onclick="DisplayDataToModal('<%# Eval("id") %>','<%# Eval("NgaylapHD") %>', '<%# Eval("id_KhachHang")%>' , '<%# Eval("IdPay") %>')">Chi Tiết </button>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            
                        </Columns>

                    </asp:GridView>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->

                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Chi tiết đơn hàng</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-5">
                                            ID:
                                        </div>
                                        <div class="col-md-7">
                                            <asp:Label ID="lbl_ID" runat="server" Text=""></asp:Label>
                                            
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            Ngày lập hóa đơn:
                                        </div>
                                        <div class="col-md-7">
                                            <asp:Label ID="lblngaylapHd" runat="server" Text="" EnableViewState="true"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            Mã Khách Hàng
                                        </div>
                                        <div class="col-md-7">
                                            <asp:Label ID="lblId_KhachHang" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            Mã phương thức thanh toán
                                        </div>
                                        <div class="col-md-7">
                                            <asp:Label ID="lblIdpttt" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div style="margin-top: 40px;">
                                        <div class="dataTable_wrapper">
                                            <asp:GridView ID="grvChiTietDonHang" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" CssClass="table table-striped table-bordered table-hover" OnRowDataBound="grvTintuc_RowDataBound" OnSelectedIndexChanged="grvTintuc_SelectedIndexChanged">
                                                <HeaderStyle CssClass="dgvheader" />
                                                <RowStyle CssClass="gradeA" />
                                                <Columns>
                                                    <asp:BoundField AccessibleHeaderText="id_hoadon" DataField="id_hoadon" HeaderText="ID_Hóa đơn">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:BoundField>
                                                    <asp:BoundField AccessibleHeaderText="id_hang" DataField="id_hang" HeaderText="ID_Hàng">
                                                        <ItemStyle Width="150px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField AccessibleHeaderText="SoLuongMua" DataField="SoLuongMua" HeaderText="Số lượng mua">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="500px" />
                                                        <ItemStyle Width="380px" />
                                                    </asp:BoundField>
                                                   
                                                    <asp:BoundField AccessibleHeaderText="Size" DataField="Size" HeaderText="Size">
                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    </asp:BoundField>
                                                    <asp:BoundField AccessibleHeaderText="Gia" DataField="Gia" HeaderText="Giá" />
                                                     <asp:BoundField AccessibleHeaderText="ThanhTien" DataField="ThanhTien" HeaderText="Thành tiền">
                                                        <ItemStyle Width="100px" />
                                                    </asp:BoundField>
                                                </Columns>

                                            </asp:GridView>

                                        </div>
                                    <%--</div>--%>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<script>
                        function editModal(id) {
                            console.log($('#myModal'));
                            $('#myModal').modal();
                        }

                        $('#myModal').on('show.bs.modal', function (e) {
                            $('#lblID').val(id);
                          
                        });
                    </script>--%>
                </div>
            </div>
        </div>
        
    </asp:Panel>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <!-- DataTables JavaScript -->

    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script type="text/javascript">


        $(document).ready(function () {
            $('#grvKhachHang').DataTable({
                responsive: true
            });

        });
    </script>
</asp:Content>
