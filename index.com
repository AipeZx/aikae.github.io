<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Image Click Counter</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f5f5f5;
            margin: 0;
        }
        h1 {
            color: #333;
        }
        .container {
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }
        img {
            width: 200px;
            height: auto;
            cursor: pointer;
            margin-top: 10px;
            border-radius: 10px;
            transition: transform 0.2s;
        }
        img:hover {
            transform: scale(1.05);
        }
        p {
            margin-top: 20px;
            font-size: 18px;
            color: #555;
        }
        span {
            font-weight: bold;
            color: #ff6347;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Pop Poom</h1>
        <img src="https://img5.pic.in.th/file/secure-sv1/1000020966.jpg" alt="Clickable Image" id="clickableImage">
        <p>Number of clicks: <span id="clickCount">0</span></p>
    </div>

    <script>
        let clickCount = localStorage.getItem('clickCount') ? parseInt(localStorage.getItem('clickCount')) : 0;
        const image = document.getElementById('clickableImage');
        const clickCountDisplay = document.getElementById('clickCount');

        // Display initial click count
        clickCountDisplay.textContent = clickCount;

        image.addEventListener('click', () => {
            clickCount++;
            clickCountDisplay.textContent = clickCount;
            localStorage.setItem('clickCount', clickCount);
        });
    </script>
</body>
</html>
