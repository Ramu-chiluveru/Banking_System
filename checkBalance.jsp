<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Check Balance</title>
</head>
<body>
    <h2>Check Account Balance</h2>
    <form method="post">
        Account ID: <input type="text" name="account_id" required><br>
        <input type="submit" value="Check Balance">
    </form>

    <%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String accountIdParam = request.getParameter("account_id");
        int accountId = -1;

        try {
            
            if (accountIdParam != null && !accountIdParam.isEmpty()) {
                accountId = Integer.parseInt(accountIdParam);
            } else {
                out.println("Account ID parameter is missing or empty.");
                return;
            }

            
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "*Ramu@2003#")) {
                
                // Use a PreparedStatement to prevent SQL injection
                String query = "SELECT amount FROM accounts WHERE aid = ?";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setInt(1, accountId);

                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            double balance = rs.getDouble("amount");
                            out.println("Account Balance: " + balance);
                        } else {
                            out.println("Account not found.");
                        }
                    }
                }
            }
        } catch (NumberFormatException e) {
            out.println("Invalid Account ID format. Please enter a valid integer.");
        } catch (SQLException e) {
            out.println("A database error occurred: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            out.println("JDBC Driver not found: " + e.getMessage());
        } catch (Exception e) {
            out.println("An unexpected error occurred: " + e.getMessage());
        }
    }
    %>
</body>
</html>
