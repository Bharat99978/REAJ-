<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>政府网站登录</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 0; padding: 0; color: #333; }
        .header { background-color: #003366; color: white; padding: 15px 0; text-align: center; }
        .header h1 { margin: 0; font-size: 28px; font-weight: bold; }
        .container { max-width: 800px; margin: 30px auto; padding: 20px; background-color: white; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); }
        h2 { color: #003366; text-align: center; font-size: 24px; }
        label { display: block; margin-bottom: 10px; font-size: 16px; font-weight: bold; color: #333; }
        input[type="text"], input[type="password"] { width: 100%; padding: 12px; margin-bottom: 20px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px; }
        button { background-color: #003366; color: white; padding: 12px 24px; border: none; border-radius: 4px; cursor: pointer; font-size: 18px; display: block; margin: 0 auto; }
        button:hover { background-color: #002244; }
        .info-box { background-color: #e0ebf5; padding: 15px; margin-bottom: 20px; border-left: 6px solid #003366; font-size: 14px; }
        .footer { text-align: center; background-color: #f1f1f1; padding: 20px; font-size: 14px; color: #666; margin-top: 30px; }
        .footer img { width: 50px; display: block; margin: 0 auto 10px; }
        .footer p { margin: 5px 0; }
        @media (max-width: 600px) { h2 { font-size: 20px; } button { width: 100%; } }
    </style>
</head>
<body>
    <div class="header"><h1>中华人民共和国政府登录系统</h1></div>
    <div class="container"><h2>用户登录</h2>
        <div class="info-box"><strong>通知:</strong> 此登录页面由中华人民共和国政府授权，仅用于政府公务人员。</div>
        <?php
        session_start();
        $message = '';
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $username = $_POST['username'];
            $password = $_POST['password'];
            if ($username == "123456789" && $password == "123456789") {
                $_SESSION['user'] = 'admin';
                header("Location: admin_panel.php");
                exit();
            } elseif ($username == "13792588" && $password == "13792588") {
                $_SESSION['user'] = 'manager';
                header("Location: manager_panel.php");
                exit();
            } else { $message = "用户名或密码错误!"; }
        }
        ?>
        <form method="POST" action="">
            <label for="username">用户名:</label>
            <input type="text" id="username" name="username" placeholder="请输入您的用户名" required>
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" placeholder="请输入您的密码" required>
            <button type="submit">登录</button>
        </form>
        <?php if ($message): ?><p style="color: red; text-align: center;"><?php echo $message; ?></p><?php endif; ?>
    </div>
    <div class="footer"><img src="https://i.imghippo.com/files/UXyIh1729345138.png" alt="中华人民共和国徽章"><p>中华人民共和国政府版权所有 © 2024</p><p>备案号: 京ICP证000001号</p></div>
</body>
</html>