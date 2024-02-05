<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Forums</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        .question {
            min-height: 333px;
        }
    </style>
</head>

<body>
    <?php
    include 'partials/_dbconnect.php';
    include 'partials/_header.php';
    ?>
    <?php
    $id = $_GET['threadid'];
    $sql = "SELECT * FROM `threads` WHERE thread_id=$id";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
        $title = $row['thread_title'];
        $desc = $row['thread_desc'];
        $thread_user_id = $row['thread_user_id'];

        // query the users table to find out the name of posted by this comment
            $sql2 = "SELECT usname FROM `user_table` WHERE sno='$thread_user_id'";
            $result2 = mysqli_query($conn, $sql2);
            $row2 = mysqli_fetch_assoc($result2);
            $posted_by = mysqli_fetch_assoc($result2);
            $posted_by = $row2['usname'];
       
    }
    ?>

    <?php
    $dhowAlert = false;
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method == 'POST') {
        // insert comment in to database
        $comment = $_POST['comment'];
        $comment = str_replace("<", "&lt;", "$comment");
        $comment = str_replace(">", "&gt;", "$comment");
        $sno = $_POST['sno'];
        $sql = "INSERT INTO `comments` (`comment_content`, `thread_id`, `comment_by`, `comment_time`) VALUES ('$comment', '$id', '$sno', current_timestamp())";
        $result = mysqli_query($conn, $sql);
        $showAlert = true;
        if ($showAlert) {
            echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success!</strong> Your Comment has been added!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>';
        }
    }
    ?>


    <div class="container my-4 alert alert-success">

        <div class="jumbotron">
            <h1 class="display-4"><?php echo $title; ?></h1>
            <p class="lead"><?php echo $desc; ?></p>
            <hr class="my-4">
            <p>Fiverr is a place where professionals across hundreds of industries come to grow their businesses. To maintain a respectful, inclusive, and safe environment for everyone, we've created a set of rules to serve as a compass for behavior in our community.Even though a post may not be strictly against the rules, it may still be removed or edited at the staff's discretion. Also, if a member pushes the boundaries too far, their Forum account may be banned.</p>
            <p>
            <h4>Posted by: <?php echo $posted_by; ?></h4>
            </p>
        </div>

    </div>
    
    <?php
    if (isset($_SESSION['loggedin']) == true) {
        echo '<div class="container alert alert-light">
        <h1>Post a comment</h1>
        <form action="' . $_SERVER["REQUEST_URI"] . '" method="post">
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Type your comment</label>
                <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
                <input type="hidden" name="sno" value=" '. $_SESSION['sno'] . '">   
            </div>
            <button type="submit" class="btn btn-success">Post comment</button>
        </form>
    </div>';
    } else {
        echo '
        <div class="container">
        <h1 class="py-2">Start a Discussion</h1>
        <div class="alert alert-info" role="alert">
        <p class="text-center my-0">You are not loggedin. please login to be able to start a Discussion!</p>
      </div>
      </div>';
    }

    ?>

    

    <div class="container">
        <h1>Discussion</h1>

        <?php
        $id = $_GET['threadid'];
        $sql = "SELECT * FROM `comments` WHERE thread_id=$id";
        $result = mysqli_query($conn, $sql);
        $noResult = true;
        while ($row = mysqli_fetch_assoc($result)) {
            $noResult = false;
            $id = $row['comment_id'];
            $content = $row['comment_content'];
            $comment_time = $row['comment_time'];
            $thread_user_id = $row['comment_by'];

            $sql2 = "SELECT usname FROM `user_table` WHERE sno='$thread_user_id'";
            $result2 = mysqli_query($conn, $sql2);
            $row2 = mysqli_fetch_assoc($result2);

            echo '<div class="media alert alert-light">
            <img src="img/default_user.png" class="mr-2 br-6" width="54px">
            <div class="media-body my-2">
            <p class="fw-bold my-0">' . $row2['usname'] . '</p><p>' . $comment_time . '</p>
            <p>' . $content . '</p>
            </div>
        </div>';
        }
        if ($noResult) {
            echo '<div class="jumbotron jumbotron-fluid">
            <div class="container">
              <p class="display-5">No Comment Found</p>
              <p class="lead">Be the first persion to Commentx  </p>
            </div>
          </div>';
        }

        ?>


    </div>

    <?php
    include 'partials/_footer.php';
    ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>