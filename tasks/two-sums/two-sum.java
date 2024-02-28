import java.util.HashMap;
import java.util.Map;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        String inputArray = scanner.nextLine().trim();
        int[] nums = parseArray(inputArray);

        int target = scanner.nextInt();

        int[] result = twoSum(nums, target);

        System.out.println("[" + result[0] + ", " + result[1] + "]");

        scanner.close();
    }

    public static int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> m = new HashMap<>();
        for (int i = 0; i < nums.length; ++i) {
            int x = nums[i];
            int y = target - x;
            if (m.containsKey(y)) {
                return new int[] {m.get(y), i};
            }
            m.put(x, i);
        }
        throw new IllegalArgumentException("No two sum solution");
    }

    public static int[] parseArray(String inputArray) {
        String[] tokens = inputArray.substring(1, inputArray.length() - 1).split(",");
        int[] nums = new int[tokens.length];
        for (int i = 0; i < tokens.length; i++) {
            nums[i] = Integer.parseInt(tokens[i].trim());
        }
        return nums;
    }
}
