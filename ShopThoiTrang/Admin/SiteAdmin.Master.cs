using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShopThoiTrang.BUS;
namespace ShopThoiTrang.Admin
{
    public partial class SiteAdmin : System.Web.UI.MasterPage
    {
        public void bindMenu()
        {
            List<Entity.QuanLyMeNu> lst = new List<Entity.QuanLyMeNu>();
            lst =QuanLyMeNuService.QuanLyMeNu_GetByTop("", "Active = 1 and Type = 1", "[Level] ASC");
            string menu = "<ul class='nav' id='side-menu'>";
            menu += "<li class='sidebar-search'>";
            menu += "<div class='input-group custom-search-form'>";
            menu += "<input type='text' class='form-control' placeholder='Search...'>";
            menu += "<span class='input-group-btn'>";
            menu += "<button class='btn btn-default' type='button'>";
            menu += "<i class='fa fa-search'></i>";
            menu += "</button>";
            menu += "</span>";
            menu += "</div>";
            menu += "<!-- /input-group -->";
            menu += "</li>";

            bool kt = false;
            //int dem = 0;
            for (int i = 0; i < lst.Count; i++)
            {
                if (lst[i].Level.Length == 4)
                {
                    if (kt == true)
                    {
                        menu += "</ul>";
                        menu += "<!-- /.nav-second-level -->";
                        menu += "</li>";
                    }
                    if (i + 1 == lst.Count || lst[i + 1].Level.Length == 4)
                    {
                        kt = false;
                        menu += "<li>";
                        menu += "<a href='" + lst[i].Link + "' target='" + lst[i].TypeClick + "'><i class='" + lst[i].Icon + "'></i>" + lst[i].TenMenu + "</a>";
                        menu += "</li>";
                    }
                    else
                    {
                        //dem++;
                        kt = true;
                        //if (dem == 1) menu += "<li class='active'>";
                        menu += "<li>";
                        menu += "<a href='" + lst[i].Link + "'><i class='" + lst[i].Icon + "'></i>" + lst[i].TenMenu + "<span class='fa arrow'></span></a>";
                        menu += "<ul class='nav nav-second-level'>";
                    }
                }
                else
                {
                    menu += "<li>";
                    menu += "<a href='" + lst[i].Link + "' target='" + lst[i].TypeClick + "'>" + lst[i].TenMenu + "</a>";
                    menu += "</li>";
                }
            }

            menu += "</ul>";

            /*
            
                        
                        
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i>Tables</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i>Forms</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i>UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html">Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i>Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i>Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
            */
            ltrMenu.Text = menu;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            bindMenu();
        }
    }
}