<!DOCTYPE html>
<html>
<head>
    <title>Pay Amount</title>
</head>
<body>
    <h2>Pay Amount</h2>
    <form method="post" action="verifyOtpAndPay.jsp">
        Sender Account ID: <input type="text" name="sender_account_id" required><br>
        Receiver Account ID: <input type="text" name="receiver_account_id" required><br>
        Amount: <input type="text" name="amount" required><br>
        Enter OTP: <input type="text" name="otp" required><br>
        <input type="submit" value="Pay Amount">
    </form>
</body>
</html>
