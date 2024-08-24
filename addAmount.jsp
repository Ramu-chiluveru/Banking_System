<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Amount</title>
</head>
<body>
    <h2>Add Amount to Account</h2>
    <form method="post">
        Account ID: <input type="text" name="account_id"><br>
        Amount: <input type="text" name="amount"><br>
        <input type="submit" value="Add Amount">
    </form>

    <%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String accountId = request.getParameter("account_id");
        String amountStr = request.getParameter("amount");
        double amount = Double.parseDouble(amountStr);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "naresh", "naresh0969");
            Statement stmt = con.createStatement();
            String query = "UPDATE accounts SET amount = amount + " + amount + " WHERE aid = " + accountId;
            int rowsUpdated = stmt.executeUpdate(query);

            if (rowsUpdated > 0) {
                out.println("Amount added successfully!");
            } else {
                out.println("Account not found.");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    %>
</body>
</html>
