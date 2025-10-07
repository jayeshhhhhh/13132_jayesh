import java.sql.*;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "password");
            Statement st = con.createStatement();
            int ch;
            do {
                System.out.println("1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit");
                ch = sc.nextInt();
                switch (ch) {
                    case 1:
                        st.executeUpdate("create table if not exists student(id int primary key, name varchar(50))");
                        System.out.println("Table created");
                        break;
                    case 2:
                        System.out.print("Enter id and name: ");
                        int id = sc.nextInt();
                        String name = sc.next();
                        st.executeUpdate("insert into student values(" + id + ",'" + name + "')");
                        System.out.println("Data inserted");
                        break;
                    case 3:
                        System.out.print("Enter id and new name: ");
                        id = sc.nextInt();
                        name = sc.next();
                        st.executeUpdate("update student set name='" + name + "' where id=" + id);
                        System.out.println("Data updated");
                        break;
                    case 4:
                        System.out.print("Enter id to delete: ");
                        id = sc.nextInt();
                        st.executeUpdate("delete from student where id=" + id);
                        System.out.println("Data deleted");
                        break;
                    case 5:
                        ResultSet rs = st.executeQuery("select * from student");
                        while (rs.next())
                            System.out.println(rs.getInt(1) + " " + rs.getString(2));
                        break;
                    case 6:
                        System.out.println("Exiting...");
                        break;
                    default:
                        System.out.println("Invalid choice");
                }
            } while (ch != 6);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
output:
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 1
Table created
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 2
Enter id and name: 
>> 1 John
Data inserted
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 2
Enter id and name: 
>> 2 Mary
Data inserted
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 5
1 John
2 Mary
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 3
Enter id and new name:
>> 1 Alex
Data updated
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 5
1 Alex
2 Mary
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 4
Enter id to delete:
>> 2
Data deleted
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 5
1 Alex
1.Create Table 2.Insert 3.Update 4.Delete 5.Select 6.Exit
>> 6
Exiting...

