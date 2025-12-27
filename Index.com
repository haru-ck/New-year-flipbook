<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>New Year Pause ✨</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    * {
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      margin: 0;
      background: #c9f2e6;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      overflow: hidden;
    }

    .book {
      width: 90%;
      max-width: 420px;
      height: 85vh;
      background: #eafff8;
      border-radius: 20px;
      box-shadow: 0 15px 40px rgba(0,0,0,0.15);
      overflow: hidden;
      position: relative;
    }

    .page {
      position: absolute;
      inset: 0;
      padding: 30px;
      display: none;
      flex-direction: column;
      justify-content: center;
      animation: flip 0.6s ease;
    }

    .page.active {
      display: flex;
    }

    @keyframes flip {
      from {
        opacity: 0;
        transform: translateX(50px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    h1, h2 {
      margin-bottom: 20px;
      color: #155f55;
    }

    p {
      color: #2f6f66;
      line-height: 1.6;
    }

    input, textarea {
      width: 100%;
      padding: 12px;
      border-radius: 10px;
      border: none;
      margin-top: 10px;
      font-size: 16px;
      background: #ffffff;
    }

    textarea {
      resize: none;
      height: 90px;
    }

    button {
      margin-top: 25px;
      padding: 12px;
      border: none;
      border-radius: 30px;
      background: #2bbfa7;
      color: white;
      font-size: 16px;
      cursor: pointer;
      transition: 0.3s;
    }

    button:hover {
      background: #1fa08c;
    }

    .small {
      font-size: 14px;
      opacity: 0.7;
      margin-top: 10px;
    }
  </style>
</head>

<body>
  <div class="book">

    <!-- Page 1 -->
    <div class="page active">
      <h1>2025</h1>
      <p style="font-size:18px;">
        <strong>“No pressure. This is not being graded.”</strong>
      </p>
      <p class="small">Take a breath. This is casual.</p>
      <button onclick="nextPage()">Continue →</button>
    </div>

    <!-- Page 2 -->
    <div class="page">
      <h2>Q1</h2>
      <p>Something for 2025?</p>
      <textarea placeholder="Write anything…"></textarea>
      <button onclick="nextPage()">Next →</button>
    </div>

    <!-- Page 3 -->
    <div class="page">
      <h2>Q2</h2>
      <p>On a scale of 1–10, rate the year.</p>
      <input type="number" min="1" max="10" placeholder="Be honest 👀">
      <button onclick="nextPage()">Next →</button>
    </div>

    <!-- Page 4 -->
    <div class="page">
      <h2>Q3</h2>
      <p>Reaction of the year (emoji only).</p>
      <input type="text" placeholder="😵‍💫 😌 🤡 😭 ?">
      <button onclick="nextPage()">Next →</button>
    </div>

    <!-- Page 5 -->
    <div class="page">
      <h2>Q4</h2>
      <p>Something you could tell your enemy / least fav human?</p>
      <textarea placeholder="This stays here. Promise."></textarea>
      <button onclick="nextPage()">Next →</button>
    </div>

    <!-- Page 6 -->
    <div class="page">
      <h2>Q5</h2>
      <p>Emoji for the year 2026.</p>
      <input type="text" placeholder="✨ 👀 🔥 🌱">
      <button onclick="nextPage()">Finish →</button>
    </div>

    <!-- Final Page -->
    <div class="page">
      <h2>That’s it 🌱</h2>
      <p>
        Thanks for playing along.  
        This wasn’t meant to fix anything, explain anything, or turn your life into a fairy tale.  
        It’s just a small pause before the year ends — created out of boredom! 😋
      </p>
      <p>
        If this helped you reflect, great.<br>
        If it didn’t, at least it killed a few minutes.
      </p>
      <p>
        Take whatever you want into 2026.  
        Leave the rest behind.  
        <strong>Especially the people you thought about while answering question four.</strong>
      </p>
    </div>

  </div>

  <script>
    let current = 0;
    const pages = document.querySelectorAll('.page');

    function nextPage() {
      pages[current].classList.remove('active');
      current++;
      if (current < pages.length) {
        pages[current].classList.add('active');
      }
    }
  </script>
</body>
</html>
