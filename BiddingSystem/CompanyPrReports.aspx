﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BiddingAdmin.Master" AutoEventWireup="true" CodeBehind="CompanyPrReports.aspx.cs" Inherits="BiddingSystem.CompanyPrReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentSection" runat="server">

    <html>
    <head>
         <script src="AdminResources/js/jquery.min.js" type="text/javascript"></script>
       <script src="AdminResources/js/jquery-1.10.2.min.js"></script>

    
            <style type="text/css">
          #myModal.modal-dialog {
             width: 90%;
             }
      

            table{
                color:black;
            }
            body{
                     color:black;     
                page-break-inside:auto !important;
                
            }

            #divPrintPoReport  #tr{
                page-break-after:auto !important;
                page-break-inside:avoid !important;
            }

           #divPrintPoReport  #table{
                page-break-after:auto !important;
                page-break-inside:avoid !important;
                background-color:aquamarine;
            }

            #hiddenPrint{
           visibility:hidden;
            }

              .Calander {
           position: relative;
            color: white;
        }

       .Calander:before {
            position: absolute;
            content: attr(data-date);
            display: inline-block;
            color: black;
        }

      .Calander::-webkit-datetime-edit, .Calander::-webkit-inner-spin-button, .Calander::-webkit-clear-button {
            display:none;
        }

        .Calander::-webkit-calendar-picker-indicator {
            position: absolute;
            /*top: 3px;*/
            right: 5px;            
            color: #555;
            opacity: 1;
            font-size:9px;
        }
        </style>
        <script src="AdminResources/js/moment.min.js"></script>
    </head>
    <body>

    
<section class="content-header">
    <h1>
      PR Reports 
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="AdminDashboard.aspx"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">PR Reports</li>
      </ol>
    </section>
    <br />

    <form runat="server">
    

        <div id="myModal" class="modal fade" tabindex="-1" role="dialog"  aria-hidden="true">
				  <div class="modal-dialog" >
					<!-- Modal content-->
					<div class="modal-content" ">
					  <div class="modal-header" style="background-color:#a2bdcc;">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>		
						<h4 class="modal-title">View PO</h4>
					  </div>
					  <div class="modal-body">
						<div class="login-w3ls">
                            
					
			</div>
		  </div>
		</div>
	  </div>
     </div>



            <section  class="content" >
 
      <div class="box box-info" id="panelPurchaseRequset" runat="server">
        <div class="box-header with-border" id="viewPOSection">
        

            <div class="row">
                <div class="col-sm-12">
                    <div class="col-sm-4">
                          <label>PR Code</label>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPoCode"  ValidationGroup="btnPoCodeSearch" ForeColor="Red">*</asp:RequiredFieldValidator>
                         <div class="input-group margin">
                        <asp:TextBox ID="txtPoCode" runat="server" CssClass="form-control" PlaceHolder="LCL1 / IMP1"></asp:TextBox>
                    <span class="input-group-btn">
                         <asp:Button runat="server" ID="btnPoCodeSearch" ValidationGroup="btnPoCodeSearch" OnClick="btnPoCodeSearch_Click"  CssClass="btn btn-info"  Text="Search"/>
                     
                    </span>
              </div>
                    </div>

                    <%--<div class="col-sm-4">
                         <label>Status</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="" ControlToValidate="ddlStatus"   ValidationGroup="btnPoStatusSearch" ForeColor="Red">*</asp:RequiredFieldValidator>

                         <div class="input-group margin">
                              <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" >
                            <asp:ListItem Value="">-Please Select-</asp:ListItem>
                           <asp:ListItem Value="0">Pending</asp:ListItem>
                            <asp:ListItem Value="1">Approved</asp:ListItem>
                            <asp:ListItem Value="2">Rejected</asp:ListItem>
                       </asp:DropDownList>
                    <span class="input-group-btn">
                         <asp:Button runat="server" ID="btnPoStatusSearch" OnClick="btnPoStatusSearch_Click"  ValidationGroup="btnPoStatusSearch" CssClass="btn btn-info"  Text="Search" />
                    </span>
              </div>
                    </div>--%>

                    <div class="col-sm-4">  
                          <label>Date</label>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStartDate"  ValidationGroup="btnPoDateSearch" ForeColor="Red">*</asp:RequiredFieldValidator>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEndDate"  ValidationGroup="btnPoDateSearch" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <div class="input-group margin">
                        <asp:TextBox ID="txtStartDate" type="date" runat="server" Width="50%" data-date="" data-date-format="DD MMMM YYYY" CssClass="form-control  Calander" placeholder="from" ></asp:TextBox>
                              
                        <asp:TextBox ID="txtEndDate" type="date" runat="server" Width="50%" data-date="" data-date-format="DD MMMM YYYY" CssClass="form-control Calander"  placeholder="to" ></asp:TextBox>  
                            
                    <span class="input-group-btn">
                         <asp:Button runat="server" ID="btnPoDateSearch" ValidationGroup="btnPoDateSearch" OnClick="btnPoDateSearch_Click" CssClass="btn btn-info"  Text="Search"/>
                    </span>
              </div>
                    </div>
                </div>
            </div>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
          </div>
        </div>
    
          <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="Updatepanel1" runat="server">
        <ContentTemplate>

        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
            <div class="table-responsive">
                 <asp:GridView runat="server" ID="gvPurchaseRequest" GridLines="None" CssClass="table table-responsive"
                    AutoGenerateColumns="false"  HeaderStyle-BackColor="#3C8DBC" HeaderStyle-ForeColor="White" >
                    <Columns>
                        <asp:BoundField DataField="PrId"  HeaderText="PrId" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                        <%--<asp:BoundField DataField="PrCode"  HeaderText="PR Code" />--%>
                        <asp:TemplateField HeaderText="PR Code">
                                 <ItemTemplate>
                                     <asp:Label runat="server" ID="lblPRCode" Text='<%#Eval("PrCode") == null? "" : "PR-" + Eval("PrCode").ToString()%>'></asp:Label>
                                 </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="WarehouseName"  HeaderText="Warehouse" />
                        <%--<asp:BoundField DataField="DepartmentId"  HeaderText="DepartmentId" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                        <asp:BoundField DataField="ExpectedDate"  HeaderText="Date Of Request" DataFormatString='<%$ appSettings:dateTimePattern %>' />
                        <asp:BoundField DataField="RequiredFor"  HeaderText="Quotation For" />
                        <%--<asp:BoundField DataField="OurReference"  HeaderText="OurReference" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                        <%--<asp:BoundField DataField="RequestedBy"  HeaderText="RequestedBy" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                        <asp:BoundField DataField="CreatedDate"  HeaderText="PR Created Date" DataFormatString='<%$ appSettings:dateTimePattern %>' />
                        <asp:BoundField DataField="CreatedBy"  HeaderText="CreatedBy" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>
                        <%--<asp:BoundField DataField="UpdatedDateTime"  HeaderText="UpdatedDateTime" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                        <%--<asp:BoundField DataField="UpdatedBy"  HeaderText="UpdatedBy" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                        <%--<asp:BoundField DataField="IsActive"  HeaderText="IsActive" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                        <%--<asp:BoundField DataField="PrIsApproved"  HeaderText="PrIsApproved" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                        <%--<asp:BoundField DataField="PrIsApprovedOeRejectDate"  HeaderText="PrIsApprovedOeRejectDate" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden"/>--%>
                        
                        <asp:TemplateField HeaderText="Purchasing Type">
                                                            <ItemTemplate>
                                                                <asp:Label
                                                                    runat="server"
                                                                    Visible='<%# Eval("PurchaseType").ToString() == "1" ? true : false %>'
                                                                    Text="Local" CssClass="label label-warning"/>
                                                                <asp:Label
                                                                    runat="server"
                                                                    Visible='<%# Eval("PurchaseType").ToString() == "2" ? true : false %>'
                                                                    Text="Import" CssClass="label label-success"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="Status">
                                 <ItemTemplate>
                                     <asp:Label runat="server" ID="llSt" Text='<%#Eval("StatusName") == null ? "":Eval("StatusName").ToString()%>' CssClass="label label-info"></asp:Label>
                                 </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnView" Text="View" OnClick="btnView_Click" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>         
          </div>
         
        </div>
         </ContentTemplate>
    </asp:UpdatePanel>
      </div>
    </section>
      

        
    </form>
        </body>

</html>
 <script type="text/javascript">
     //$(document).ready(function ()
     //   {
          
         $(".Calander").change(function () {
             if (this.value) {
                 $(this).attr('data-date', moment($(this).val(), 'YYYY-MM-DD').format($(this).attr('data-date-format')));
             } else {
                 $(this).attr('data-date', '');
             }
         });
   
     //});
    </script>
</asp:Content>
