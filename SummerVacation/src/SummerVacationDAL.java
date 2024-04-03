import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SummerVacationDAL
{
    private Connection connection;

    // Notice that the databaseName, user and password are passed into this method. We are in the DAL,
    // and we cannot prompt the user for this information. That should be done in the presentation layer
    private void InitializeConnection(String databaseName, String user, String password)
    {
        try
        {
            if(connection == null)
            {
               connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + databaseName, user, password);
            }
        } 
        catch (SQLException exception)
        {
            System.out.println("Failed to connect to the database" + exception.getMessage());
        }
    }

    public SummerVacationDAL(String databaseName, String userName, String password)
    {
        InitializeConnection(databaseName, userName, password);
    }

    public List<String> TryGetDestinationForActivity(String activityName)
    {
        List<String> parks = new ArrayList<String>();
        try
        {
            PreparedStatement myStatement = connection.prepareStatement("Select * From Plan Where ActivityName = ?");
            myStatement.setString(1, activityName);
            ResultSet myRelation = myStatement.executeQuery();
            while(myRelation.next())
            {
               parks.add(myRelation.getString("ParkName"));                
            }
            return parks;
        }
        catch(SQLException ex)
        {
            System.out.println("Failed to get activity destinations" + ex.getMessage());
            return parks;
        }
      }


      public boolean addPark(String parkName, String address, String state, String zipCode) {
        try {
        CallableStatement addParkProcedure = connection.prepareCall("{Call addNewPark(?, ?, ?, ?)}");
        addParkProcedure.setString(1, parkName);
            addParkProcedure.setString(2, address);
            addParkProcedure.setString(3, state);
            addParkProcedure.setString(4, zipCode);
            addParkProcedure.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Failed to add park: " + ex.getMessage());
            return false;
        }
        }
        public boolean addActivity(String activityName, int numPlayers) {
            try {
                CallableStatement addActivityProcedure = connection.prepareCall("{CALL AddActivity(?, ?)}");
                addActivityProcedure.setString(1, activityName);
                addActivityProcedure.setInt(2, numPlayers);
                addActivityProcedure.execute();
                return true;
            } catch (SQLException ex) {
                System.out.println("Failed to add activity: " + ex.getMessage());
                return false;
            }
        }

        public boolean insertActivitiesForParks(Map<String, List<String>> parksAndActivities) {
        try {
            PreparedStatement insertStatement = connection.prepareStatement(
                    "INSERT INTO Plan (ActivityName, ParkName) VALUES (?, ?)");

            for (Map.Entry<String, List<String>> entry : parksAndActivities.entrySet()) {
                String parkName = entry.getKey();
                List<String> activities = entry.getValue();

                for (String activity : activities) {
                    insertStatement.setString(1, activity);
                    insertStatement.setString(2, parkName);
                    insertStatement.addBatch();
                }
            }

            insertStatement.executeBatch();
            return true;
        } catch (SQLException ex) {
            System.out.println("Failed to insert activities for parks: " + ex.getMessage());
            return false;
        }
    }
      }