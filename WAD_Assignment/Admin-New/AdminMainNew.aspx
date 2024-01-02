<%@ Page Language="C#" MasterPageFile="../Admin-New/AdminSideBar.master" AutoEventWireup="true" CodeFile="AdminMainNew.aspx.cs" Inherits="WAD_Assignment.Admin_New.AdminMainNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="AdminMainNew.css" />

    <div id="page-content-wrapper">
        <h1 style="text-align:center; color:#858788; font-size:36px;">Admin Page</h1><br />
        <div class="row">
            <div class="card card1">
                <div class="card1_title_wrapper">
                    <h1 class="car1_title">Customers</h1>
                    <p class="car1_text">
                        <%--can put any content--%>
                    </p>
                </div>
                <div class="card1_table_wrapper">
                    <table class="card1_table">
                        <thead class="card1_table_head">
                            <tr>
                                <th>Name</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>View All</th>
                            </tr>
                        </thead>
                        <tbody class="card1_table_tbody" id="threeCustomer"><%--only loop first 3 customer--%>
                            <tr>
                                <td><i class="positiveIcon fas fa-check"></i>ABC</td>
<<<<<<< Updated upstream
                                <td>0123456789/td>
                                <td>abc@gmail.com</td>
                                <td>
                                    <button id="viewBtn" class="btn btn-secondary">View List</button>
                                </td>
                            </tr>
                            <tr>
                                <td><i class="positiveIcon fas fa-check"></i>ABC</td>
                                <td>0123456789/td>
                                <td>abc@gmail.com</td>
=======
                                <td>0123456789</td>
                                <td>abc@gmail.com</td>
                                <td>
                                    <button id="viewBtn" class="btn btn-secondary"><a href="ManageCustomer/ManageCustomer.aspx">View List</a></button>
                                </td>
                            </tr>
                            <tr>
                                <td><i class="positiveIcon fas fa-check"></i>SauWei</td>
                                <td>0123456789</td>
                                <td>sw@gmail.com</td>
>>>>>>> Stashed changes
                                <td>
                                    <button id="viewBtn2" class="btn btn-secondary">View List</button>
                                </td>
                            </tr>
                            <tr>
<<<<<<< Updated upstream
                                <td><i class="positiveIcon fas fa-check"></i>ABC</td>
                                <td>0123456789/td>
                                <td>abc@gmail.com</td>
=======
                                <td><i class="positiveIcon fas fa-check"></i>Erika</td>
                                <td>0123456789</td>
                                <td>erika@gmail.com</td>
>>>>>>> Stashed changes
                                <td>
                                    <button id="viewBtn3" class="btn btn-secondary">View List</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card card2">
                <div class="clock" onclick="changeClock()">
                    <div class="hour_wrapper">
                        <div class="hour" id="hr"></div>
                    </div>
                    <div class="minute_wrapper">
                        <div class="minute" id="mn"></div>
                    </div>
                    <div class="second_wrapper">
                        <div class="second" id="sc"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row2">
            <div class="card card3" id="OneMovie">
                <div class="movie_title">
<<<<<<< Updated upstream
                    <button class="btn btn-secondary">Movie</button>
=======
                    <button class="btn btn-secondary"><a href="ManageMovie/ManageMovie.aspx">Movie</a></button>
>>>>>>> Stashed changes
                    <span></span>
                </div>
                <div class="movie_image" id="showMovie">
                    <img src="../image/avatar.jpg" alt="movie" />
                </div>
                <div class="movie_bottom">
                    <div class="left_numbers">
                        <p id="movie_name">&#x1F3AC; Avatar</p>
                        <p id="movie_time">&#x23F3; 3 Hour</p>
                        <p id="movie_categories">&#x1F3A5; Animation</p>
                    </div>
                    <div id="showRate" class="right_rate">
                        <p>4<span style="color:#ecd261;">&#9733;</span></p>
                    </div>
                </div>
            </div>
            <div class="card card4">
                <div class="card1_title_wrapper">
                    <h1 class="car1_title">Cancel And Refund</h1>
                    <p class="car1_text">
                        <%--can put any content--%>
                    </p>
                </div>
                <div class="card1_table_wrapper">
                    <table class="card1_table">
                        <thead class="card1_table_head">
                            <tr>
                                <th>CUSTOMER NAME</th>
                                <th>REASON</th>
                                <th>STATUS</th>
                                <th>ACCEPT</th>
                                <th>REJECT</th>
                            </tr>
                        </thead>
                        <tbody class="card1_table_tbody" id="threeCancelRefund"><%--Only show first Three Cancel and Refund--%>
                            <tr>
<<<<<<< Updated upstream
                                <td><i class="positiveIcon fas fa-check"></i> John Doe</td>
=======
                                <td><i class="positiveIcon fas fa-check"></i>Ben</td>
>>>>>>> Stashed changes
                                <td>Change the mind</td>
                                <td>Processing</td>
                                <td>
                                    <button id="accptBtn" class="btn btn-secondary">Accept</button>
                                </td>
                                <td>
                                    <button id="rjBtn" class="btn btn-secondary">Reject</button>
                                </td>
                            </tr>
                            <tr>
<<<<<<< Updated upstream
                                <td><i class="positiveIcon fas fa-check"></i> Gonzales Higuan</td>
=======
                                <td><i class="positiveIcon fas fa-check"></i>Nathan</td>
>>>>>>> Stashed changes
                                <td>Sudden Got OT</td>
                                <td>Processing</td>
                                <td>
                                    <button id="accptBtn1" class="btn btn-secondary">Accept</button>
                                </td>
                                <td>
                                    <button id="rjBtn1" class="btn btn-secondary">Reject</button>
                                </td>
                            </tr>
                            <tr>
<<<<<<< Updated upstream
                                <td><i class="positiveIcon fas fa-check"></i> Turgut Ozben</td>
=======
                                <td><i class="positiveIcon fas fa-check"></i>ABC</td>
>>>>>>> Stashed changes
                                <td>Select Wrong Time</td>
                                <td>Processing</td>
                                <td>
                                    <button id="accptBtn2" class="btn btn-secondary">Accept</button>
                                </td>
                                <td>
                                    <button id="rjBtn2" class="btn btn-secondary">Reject</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="AdminMainNew.js"></script>
</asp:Content>
