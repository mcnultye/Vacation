import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import static org.junit.Assert.assertNotNull;
import org.junit.Test;

public class SummerVacationPresentationLayer 
{
    private static SummerVacationDAL GetDAL()
    {
        Scanner credentialScanner = new Scanner(System.in);
        System.out.print("Enter username: ");
        // String input
        String userName = credentialScanner.nextLine();
        System.out.print("Enter password: ");
        Console console = System.console();
        char[] password = console.readPassword();
        return new SummerVacationDAL("Vacation", userName, new String(password));
    }

    @Test
    public void testGetDal() {
        SummerVacationDAL dal = SummerVacationPresentationLayer.GetDAL();
        assertNotNull(dal);
    }
    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Welcome to your vacation planner and park addition tool!");
        System.out.println("What would you like to do?");
        System.out.println("1. Plan a summer vacation");
        System.out.println("2. Add a new park");

        int choice = scanner.nextInt();
        scanner.nextLine(); // Consume newline

        SummerVacationDAL dal = new SummerVacationDAL("Vacation", "username", "password")
        if (choice == 1) {
            planSummerVacation(dal);
        } else if (choice == 2) {
            addNewPark(scanner, dal);
        } else {
            System.out.println("Invalid choice. Exiting.");
        }
    }
        private static void planSummerVacation(SummerVacationDAL dal) {
            System.out.println("Welcome to your summer vacation planner! Please enter an activity name to see potential vacation options!");
            Scanner activityScanner = new Scanner(System.in);
            String activityName = activityScanner.nextLine();
            List<String> parks = dal.TryGetDestinationForActivity(activityName);
            for (String park : parks) {
                System.out.println(park);
            }
        }
        private static void addNewPark(Scanner scanner, SummerVacationDAL dal) {
            System.out.println("Enter the name of the new park:");
            String parkName = scanner.nextLine();

            System.out.println("Enter the address of the new park:");
            String address = scanner.nextLine();

            System.out.println("Enter the state of the new park:");
            String state = scanner.nextLine();

            System.out.println("Enter the zip code of the new park:");
            String zipCode = scanner.nextLine();

            // Now prompt for activities and add them to a list
            List<String> activities = new ArrayList<>();
            System.out.println("Enter the activities available at the park (enter 'done' when finished):");
            String activity;
            while (true) {
                System.out.println("Enter an activity:");
                activity = scanner.nextLine();
                if (activity.equalsIgnoreCase("done")) {
                    break;
                }
                activities.add(activity);
            }

            // Create a map containing the new park and its activities
            Map<String, List<String>> parkAndActivities = new HashMap<>();
            parkAndActivities.put(parkName, activities);

            // Call the method to add the new park and its activities to the database
            boolean success = dal.insertActivitiesForParks(parkAndActivities);
            if (success) {
                System.out.println("New park and activities added successfully.");
            } else {
                System.out.println("Failed to add new park and activities.");
            }
        }
    }