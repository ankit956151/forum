<?php
session_start();

echo '<nav class="navbar navbar-expand-lg bg-body-tertiary py-3" data-bs-theme="dark">
<div class="container-fluid">
    <a class="navbar-brand" href="/forums/index.php">Forum</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/forums/index.php">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.php">About</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Top Categorys
                </a>
                <ul class="dropdown-menu">';

                $sql = "SELECT category_name, category_id FROM `categories` LIMIT 5";
                $result = mysqli_query($conn, $sql);
                while ($row = mysqli_fetch_assoc($result)) {
                echo '<a class="dropdown-item" href="threadlist.php?catid='. $row['category_id'] . '">'. $row['category_name'] . '</a>';
            }
                echo '</ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="contact.php">Contact</a>
            </li>
        </ul>';
        if (isset($_SESSION['loggedin']) == true) {
            echo '<form class="d-flex" role="search" method="get" action="search.php">
        <input class="form-control me-2" name="search" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-success" type="submit">Search</button>
            </form>
            <form class="d-flex">
           <p class="text-light my-2 mx-2">' . $_SESSION['user_email'] . ' </p>
           <a role="button" href="/forums/partials/_logout.php" class="btn btn-outline-primary mx-1"  data-bs-target="#loginModal">Logout</a>
        </form>';
            } else {
             echo '<div class="mx-2">
            <button class="btn btn-outline-primary mx-1" data-bs-toggle="modal" data-bs-target="#loginModal">Login</button>
            <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#signupModal">Signup</button>
        </div>';
}

echo '</div>
</div>
</nav>';
include 'partials/_loginmodal.php';
include 'partials/_signupmodal.php';
if (isset($_GET['signupsuccess']) && $_GET['signupsuccess'] == "true") {
    echo '<div class="alert alert-success alert-dismissible fade show my-0" role="alert">
    <strong>Success!</strong> You can now login.
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>';
}
?>