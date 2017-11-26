<div class="container main">

    <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </a>
    <!-- Be sure to leave the brand out there if you want it shown -->

    <!-- Everything you want hidden at 940px or less, place within here -->
  <div class="nav-collapse collapse nav navbar-nav collapse navbar-collapse">
        <!-- .nav, .navbar-search, .navbar-form, etc -->
        <ul class="sf-menu">
            <li><a href="index.jsp">Home</a></li>
            <li class="deeper parent current">
                <a href="ManageCategory.jsp" class="dropdown-toggle" data-toggle="dropdown">
                    Category
                </a>
                <ul class="dropdown-menu">
                    <li><a href="ManageCategory.jsp">Category</a></li>

                </ul>
            </li>
            <li class="deeper parent dropdown">
                <a href="manageproduct.jsp" class="dropdown-toggle" data-toggle="dropdown">
                    Product
                </a>
                <ul class="dropdown-menu">
                    <li><a href="manageproduct.jsp">Product</a></li>
                   
                    <li><a href="adminProduct-list.jsp">Show ALL</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Feedbacks
                </a>
                <ul class="dropdown-menu">
                    <li><a href="feedbacks.jsp">User Feedback</a></li>
                     
                </ul>
            </li>
             
            <li><a href="userlist.jsp">User List</a></li>
            <li><a href="query.jsp">Queries</a></li>
        </ul>


    </div>
