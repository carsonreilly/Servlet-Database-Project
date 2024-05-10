import java.sql.*;

public class ResultSetToHTMLFormatterClass {
    public static synchronized String getHtmlRows(ResultSet results) throws SQLException {
        StringBuffer htmlRows = new StringBuffer();
        ResultSetMetaData metaData = results.getMetaData();
        int numColumns = metaData.getColumnCount();

        // set the table header row
        htmlRows.append("<tr>");
        for (int i = 1; i <= numColumns; i++) {
            htmlRows.append("<th>").append(metaData.getColumnName(i)).append("</th>");
        }
        htmlRows.append("</tr>");

        // set the remainder of the table - row-by-row
        int zebraCounter = 0;
        while (results.next()) {
            if (zebraCounter % 2 == 0) {
                htmlRows.append("<tr bgcolor=\"#CCCCCC\">");
            } else {
                htmlRows.append("<tr bgcolor=\"#FFFFFF\">");
            }
            zebraCounter++;

            for (int i = 1; i <= numColumns; i++) {
                htmlRows.append("<td>").append(results.getString(i)).append("</td>");
            }
            htmlRows.append("</tr>");
        }

        return htmlRows.toString();
    }
}
