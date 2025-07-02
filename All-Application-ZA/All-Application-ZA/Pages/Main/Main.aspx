<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="All_Application_ZA.Pages.Main.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All-Application-ZA | University Applications</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Main.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <script src="Main.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <header class="header animate__animated animate__fadeInDown">
            <div class="logo-container">
                <img src="../../Assets/Images/logo.png" alt="All-Application-ZA Logo" class="logo" />
                <h1>All-Application-ZA</h1>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="../Main/Main.aspx" class="active"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="../AboutUs/AboutUs.aspx"><i class="fas fa-info-circle"></i>About Us</a></li>
                    <li><a href="../ContactUs/ContactUs.aspx"><i class="fas fa-envelope"></i>Contact Us</a></li>
                    <li><a href="../Register/Register.aspx"><i class="fas fa-user-plus"></i>Register</a></li>
                    <li><a href="../Login/Login.aspx"><i class="fas fa-sign-in-alt"></i>Login</a></li>
                </ul>
            </nav>
            <div class="mobile-menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </header>

        <!-- Search and Filter Section -->
        <section class="search-filter-section animate__animated animate__fadeIn">
            <div class="search-container">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" placeholder="Search universities..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" CssClass="search-btn" Text="Search" />
            </div>
            <div class="filter-container">
                <asp:DropDownList ID="ddlProvince" runat="server" CssClass="filter-dropdown">
                    <asp:ListItem Value="">All Provinces</asp:ListItem>
                    <asp:ListItem Value="EC">Eastern Cape</asp:ListItem>
                    <asp:ListItem Value="FS">Free State</asp:ListItem>
                    <asp:ListItem Value="GP">Gauteng</asp:ListItem>
                    <asp:ListItem Value="KZN">KwaZulu-Natal</asp:ListItem>
                    <asp:ListItem Value="LP">Limpopo</asp:ListItem>
                    <asp:ListItem Value="MP">Mpumalanga</asp:ListItem>
                    <asp:ListItem Value="NC">Northern Cape</asp:ListItem>
                    <asp:ListItem Value="NW">North West</asp:ListItem>
                    <asp:ListItem Value="WC">Western Cape</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="filter-dropdown">
                    <asp:ListItem Value="">All Statuses</asp:ListItem>
                    <asp:ListItem Value="Open">Open for Applications</asp:ListItem>
                    <asp:ListItem Value="Closed">Closed</asp:ListItem>
                </asp:DropDownList>
            </div>
        </section>

        <!-- Universities Grid Section -->
        <section class="universities-section">
            <h2 class="animate__animated animate__fadeIn">South African Universities</h2>
            <div class="universities-grid" id="universitiesGrid">
                <!-- University of Cape Town -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="WC" data-status="Open">
                    <div class="card-header">
                        <img src="../../Assets/Images/uctlogo.jpg" alt="UCT Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of Cape Town</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Cape Town, Western Cape</p>
                        <p><i class="fas fa-star"></i>Ranked #1 in South Africa</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUCT" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UCT" />
                        <a href="https://www.uct.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of Pretoria -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="GP" data-status="Open" style="animation-delay: 0.1s">
                    <div class="card-header">
                        <img src="../../Assets/Images/uplogo.jpg" alt="UP Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of Pretoria</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Pretoria, Gauteng</p>
                        <p><i class="fas fa-users"></i>Largest residential university in SA</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUP" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UP" />
                        <a href="https://www.up.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Stellenbosch University -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="WC" data-status="Open" style="animation-delay: 0.2s">
                    <div class="card-header">
                        <img src="../../Assets/Images/uslogo.jpg" alt="Stellenbosch Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Stellenbosch University</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Stellenbosch, Western Cape</p>
                        <p><i class="fas fa-flask"></i>Leading research university</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyStellenbosch" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="Stellenbosch" />
                        <a href="https://www.sun.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of Johannesburg -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="GP" data-status="Closed" style="animation-delay: 0.3s">
                    <div class="card-header">
                        <img src="../../Assets/Images/ujlogo.png" alt="UJ Logo" />
                        <span class="status-badge closed">Closed</span>
                    </div>
                    <div class="card-body">
                        <h3>University of Johannesburg</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Johannesburg, Gauteng</p>
                        <p><i class="fas fa-globe-africa"></i>Young, vibrant and multicultural</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUJ" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UJ" Enabled="false" />
                        <a href="https://www.uj.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of KwaZulu-Natal -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="KZN" data-status="Open" style="animation-delay: 0.4s">
                    <div class="card-header">
                        <img src="../../Assets/Images/ukznlogo.jpg" alt="UKZN Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of KwaZulu-Natal</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Durban & Pietermaritzburg, KZN</p>
                        <p><i class="fas fa-heartbeat"></i>Strong health sciences programs</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUKZN" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UKZN" />
                        <a href="https://www.ukzn.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of the Free State -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="FS" data-status="Open" style="animation-delay: 0.5s">
                    <div class="card-header">
                        <img src="../../Assets/Images/ufs.jpg" alt="UFS Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of the Free State</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Bloemfontein, Free State</p>
                        <p><i class="fas fa-balance-scale"></i>Excellent law faculty</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUFS" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UFS" />
                        <a href="https://www.ufs.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- North-West University -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="NW" data-status="Open" style="animation-delay: 0.6s">
                    <div class="card-header">
                        <img src="../../Assets/Images/nwulogo.jpg" alt="NWU Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>North-West University</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Potchefstroom & Mahikeng, NW</p>
                        <p><i class="fas fa-atom"></i>Strong in natural sciences</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyNWU" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="NWU" />
                        <a href="https://www.nwu.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Rhodes University -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="EC" data-status="Open" style="animation-delay: 0.7s">
                    <div class="card-header">
                        <img src="../../Assets/Images/rhodeslogo.png" alt="Rhodes Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Rhodes University</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Grahamstown, Eastern Cape</p>
                        <p><i class="fas fa-graduation-cap"></i>Excellent postgraduate success rate</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyRhodes" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="Rhodes" />
                        <a href="https://www.ru.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of Fort Hare -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="EC" data-status="Open" style="animation-delay: 0.8s">
                    <div class="card-header">
                        <img src="../../Assets/Images/ufhlogo.png" alt="UFH Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of Fort Hare</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Alice & East London, EC</p>
                        <p><i class="fas fa-landmark"></i>Historic institution with rich heritage</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUFH" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UFH" />
                        <a href="https://www.ufh.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Durban University of Technology -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="KZN" data-status="Open" style="animation-delay: 0.9s">
                    <div class="card-header">
                        <img src="../../Assets/Images/dutlogo.jpg" alt="DUT Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Durban University of Technology</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Durban & Pietermaritzburg, KZN</p>
                        <p><i class="fas fa-tools"></i>Focus on technological education</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyDUT" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="DUT" />
                        <a href="https://www.dut.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Tshwane University of Technology -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="GP" data-status="Open" style="animation-delay: 1.0s">
                    <div class="card-header">
                        <img src="../../Assets/Images/tutlogo.jpg" alt="TUT Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Tshwane University of Technology</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Pretoria, Gauteng</p>
                        <p><i class="fas fa-industry"></i>Largest contact university in SA</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyTUT" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="TUT" />
                        <a href="https://www.tut.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Cape Peninsula University of Technology -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="WC" data-status="Open" style="animation-delay: 1.1s">
                    <div class="card-header">
                        <img src="../../Assets/Images/cputlogo.jpg" alt="CPUT Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Cape Peninsula University of Technology</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Cape Town, Western Cape</p>
                        <p><i class="fas fa-laptop-code"></i>Strong IT and engineering programs</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyCPUT" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="CPUT" />
                        <a href="https://www.cput.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of Limpopo -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="LP" data-status="Open" style="animation-delay: 1.2s">
                    <div class="card-header">
                        <img src="../../Assets/Images/ullogo.jpg" alt="UL Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of Limpopo</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Polokwane & Mankweng, Limpopo</p>
                        <p><i class="fas fa-leaf"></i>Focus on rural development</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUL" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UL" />
                        <a href="https://www.ul.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of South Africa -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="GP" data-status="Open" style="animation-delay: 1.3s">
                    <div class="card-header">
                        <img src="../../Assets/Images/unisalogo.jpg" alt="UNISA Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of South Africa</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Pretoria, Gauteng</p>
                        <p><i class="fas fa-globe"></i>Africa's largest distance learning institution</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUNISA" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UNISA" />
                        <a href="https://www.unisa.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of the Witwatersrand -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="GP" data-status="Open" style="animation-delay: 1.4s">
                    <div class="card-header">
                        <img src="../../Assets/Images/witslogo.jpg" alt="Wits Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of the Witwatersrand</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Johannesburg, Gauteng</p>
                        <p><i class="fas fa-microscope"></i>Premier research university</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyWits" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="Wits" />
                        <a href="https://www.wits.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Central University of Technology -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="FS" data-status="Open" style="animation-delay: 1.5s">
                    <div class="card-header">
                        <img src="../../Assets/Images/cutlogo.png" alt="CUT Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Central University of Technology</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Bloemfontein & Welkom, Free State</p>
                        <p><i class="fas fa-robot"></i>Focus on applied technology</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyCUT" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="CUT" />
                        <a href="https://www.cut.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Nelson Mandela University -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="EC" data-status="Open" style="animation-delay: 1.6s">
                    <div class="card-header">
                        <img src="../../Assets/Images/nmulogo.jpg" alt="NMU Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Nelson Mandela University</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Port Elizabeth, Eastern Cape</p>
                        <p><i class="fas fa-anchor"></i>Strong maritime studies programs</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyNMU" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="NMU" />
                        <a href="https://www.mandela.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Mangosuthu University of Technology -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="KZN" data-status="Open" style="animation-delay: 1.7s">
                    <div class="card-header">
                        <img src="../../Assets/Images/mutlogo.png" alt="MUT Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Mangosuthu University of Technology</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Durban, KwaZulu-Natal</p>
                        <p><i class="fas fa-cogs"></i>Focus on engineering and IT</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyMUT" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="MUT" />
                        <a href="https://www.mut.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of Venda -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="LP" data-status="Open" style="animation-delay: 1.8s">
                    <div class="card-header">
                        <img src="../../Assets/Images/univenlogo.jpg" alt="Univen Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of Venda</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Thohoyandou, Limpopo</p>
                        <p><i class="fas fa-tree"></i>Focus on environmental sciences</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUniven" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="Univen" />
                        <a href="https://www.univen.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- University of Mpumalanga -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="MP" data-status="Open" style="animation-delay: 1.9s">
                    <div class="card-header">
                        <img src="../../Assets/Images/umplogo.jpg" alt="UMP Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>University of Mpumalanga</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Mbombela, Mpumalanga</p>
                        <p><i class="fas fa-seedling"></i>Focus on agriculture and tourism</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyUMP" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="UMP" />
                        <a href="https://www.ump.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Sol Plaatje University -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="NC" data-status="Open" style="animation-delay: 2.0s">
                    <div class="card-header">
                        <img src="../../Assets/Images/spulogo.png" alt="SPU Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Sol Plaatje University</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Kimberley, Northern Cape</p>
                        <p><i class="fas fa-book"></i>Newest university in South Africa</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplySPU" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="SPU" />
                        <a href="https://www.spu.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Vaal University of Technology -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="GP" data-status="Open" style="animation-delay: 2.1s">
                    <div class="card-header">
                        <img src="../../Assets/Images/vutlogo.jpg" alt="VUT Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Vaal University of Technology</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Vanderbijlpark, Gauteng</p>
                        <p><i class="fas fa-industry"></i>Strong industry partnerships</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyVUT" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="VUT" />
                        <a href="https://www.vut.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>

                <!-- Walter Sisulu University -->
                <div class="university-card animate__animated animate__fadeInUp" data-province="EC" data-status="Open" style="animation-delay: 2.2s">
                    <div class="card-header">
                        <img src="../../Assets/Images/wsulogo.png" alt="WSU Logo" />
                        <span class="status-badge open">Open</span>
                    </div>
                    <div class="card-body">
                        <h3>Walter Sisulu University</h3>
                        <p><i class="fas fa-map-marker-alt"></i>Mthatha & Butterworth, EC</p>
                        <p><i class="fas fa-medkit"></i>Strong health sciences programs</p>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnApplyWSU" runat="server" CssClass="apply-btn" Text="APPLY" CommandArgument="WSU" />
                        <a href="https://www.wsu.ac.za" class="website-link" target="_blank"><i class="fas fa-external-link-alt"></i>Visit Website</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer Section -->
        <footer class="footer animate__animated animate__fadeInUp">
            <div class="footer-content">
                <div class="footer-section about">
                    <h3>About Us</h3>
                    <p>All-Application-ZA helps students navigate university applications in South Africa. We provide up-to-date information on application statuses, deadlines, and requirements.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="footer-section links">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="../Main/Main.aspx"><i class="fas fa-arrow-right"></i>Home</a></li>
                        <li><a href="#"><i class="fas fa-arrow-right"></i>Universities</a></li>
                        <li><a href="../AppGuide/AppGuide.aspx"><i class="fas fa-arrow-right"></i>Application Guide</a></li>
                        <li><a href="../ContactUs/ContactUs.aspx"><i class="fas fa-arrow-right"></i>Contact Us</a></li>
                    </ul>
                </div>
                <div class="footer-section contact">
                    <h3>Contact Us</h3>
                    <p><i class="fas fa-map-marker-alt"></i>East London, Eastern Cape</p>
                    <p><i class="fas fa-phone"></i>+27 ## ### ####</p>
                    <p><i class="fas fa-envelope"></i>info@allapplicationza.co.za</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 All-Application-ZA. All Rights Reserved.</p>
            </div>
        </footer>
    </form>
</body>
</html>
