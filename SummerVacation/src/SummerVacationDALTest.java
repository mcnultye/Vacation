import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SummerVacationDALTest {

    private SummerVacationDAL summerVacationDAL;

    @Before
    public void setUp() {
        summerVacationDAL = new SummerVacationDAL("testDatabase", "testUser", "testPassword");
    }

    @Test
    public void testTryGetDestinationForActivity() {
        List<String> destinations = summerVacationDAL.TryGetDestinationForActivity("Swimming");
        // Assuming Swimming activity is already in the test database
        assertEquals(1, destinations.size()); // Assert that one destination is returned
        assertEquals("Beach Park", destinations.get(0)); // Assert the correct destination is returned
    }
    @Test
    public void testInsertActivitiesForParks() {
        Map<String, List<String>> parksAndActivities = new HashMap<>();
        parksAndActivities.put("New Park", Arrays.asList("Activity1", "Activity2"));

        assertTrue(summerVacationDAL.insertActivitiesForParks(parksAndActivities));
    }

    @Test
    public void testInsertSameParkTwice() {
        Map<String, List<String>> parksAndActivities = new HashMap<>();
        parksAndActivities.put("Existing Park", Arrays.asList("Activity1", "Activity2"));
        parksAndActivities.put("Existing Park", Arrays.asList("Activity3", "Activity4"));

        assertFalse(summerVacationDAL.insertActivitiesForParks(parksAndActivities));
    }

    @Test
    public void testInsertParkWithNewActivity() {
        Map<String, List<String>> parksAndActivities = new HashMap<>();
        parksAndActivities.put("New Park", Arrays.asList("Activity1", "New Activity"));

        assertFalse(summerVacationDAL.insertActivitiesForParks(parksAndActivities));
    }

    @Test
    public void testInsertGarbagePark() {
        Map<String, List<String>> parksAndActivities = new HashMap<>();
        parksAndActivities.put("Garbage Park", Arrays.asList("Activity1", "Activity2"));

        assertFalse(summerVacationDAL.insertActivitiesForParks(parksAndActivities));
    }

    @Test
    public void testDuplicateParkNamesDifferentPlaces() {
        Map<String, List<String>> parksAndActivities = new HashMap<>();
        parksAndActivities.put("Duplicate Park", Arrays.asList("Activity1", "Activity2"));
        parksAndActivities.put("Duplicate Park", Arrays.asList("Activity3", "Activity4"));

        assertFalse(summerVacationDAL.insertActivitiesForParks(parksAndActivities));
    }
}