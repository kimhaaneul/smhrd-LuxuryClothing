<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Search</title>
</head>
<body>
    <h1>User Search</h1>
    <label for="userId">Enter User ID:</label>
    <input type="text" id="userId" name="userId">
    <button onclick="searchUser()">Search</button>

    <div id="userDetails"></div>

    <script>
        function searchUser() {
            var userId = document.getElementById("userId").value;
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "searchUser?userId=" + userId, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById("userDetails").innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</body>
</html>